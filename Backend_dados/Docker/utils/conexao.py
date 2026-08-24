import os
from sqlalchemy import create_engine, text
from sqlalchemy.exc import SQLAlchemyError
import pandas as pd

# ====================================================================
# Configurações de Conexão 
# ====================================================================

USUARIO = os.getenv('DB_USUARIO')
SENHA = os.getenv('DB_SENHA')
HOST = os.getenv('DB_HOST')
PORTA = '5432'
BANCO = os.getenv('DB_NOME')

SCHEMA_ORIGEM = os.getenv('SCHEMA_ORIGEM')
SCHEMA_DESTINO = os.getenv('SCHEMA_DESTINO')


def get_engine():
    """Cria e retorna uma engine do SQLAlchemy para o banco de dados unificado."""
    try:
        engine = create_engine(
            f'postgresql+psycopg2://{USUARIO}:{SENHA}@{HOST}:{PORTA}/{BANCO}'
        )
        return engine
    except SQLAlchemyError as e:
        print(f"Erro ao criar conexão com o banco de dados: {e}")
        return None

# ====================================================================
# Funções Auxiliares para a Pipeline
# ====================================================================

def get_dados_origem(query):
    """
    Executa uma consulta no schema de origem e retorna um DataFrame.

    """
    engine = get_engine()
    if engine is None:
        return None
    try:
        df = pd.read_sql(query, con=engine)
        return df
    except SQLAlchemyError as e:
        print(f"Erro ao executar consulta: {e}")
        return None
    finally:
        if engine:
            engine.dispose()


def salvar_dados_destino(df, nome_tabela, if_exists='replace'):
    """
    Salva um DataFrame no schema de destino, criando-o se ele não existir.
    """
    engine = get_engine()
    if engine is None:
        return
    try:
        with engine.connect() as conn:
            # Cria o schema de destino se ele não existir
            conn.execute(text(f'CREATE SCHEMA IF NOT EXISTS "{SCHEMA_DESTINO}"'))
            conn.commit()

        # Salva o DataFrame na tabela, especificando o schema
        # Dentro da função salvar_dados_destino
        df.to_sql(nome_tabela, con=engine, schema=SCHEMA_DESTINO, if_exists='replace', index=False)
        print(f"DataFrame salvo com sucesso no schema '{SCHEMA_DESTINO}', tabela '{nome_tabela}'.")
    except SQLAlchemyError as e:
        print(f"Erro ao salvar DataFrame no banco de dados: {e}")
    finally:
        if engine:
            engine.dispose()



def adicionar_chave_primaria(nome_tabela, colunas, schema=SCHEMA_DESTINO):
    """Adiciona uma chave primária (simples ou composta) a uma tabela.
    
    Args:
        nome_tabela (str): Nome da tabela.
        colunas (list | str): Nome da coluna ou lista de nomes das colunas.
    """
    engine = get_engine()
    if engine is None:
        return

    # Converte o input para uma lista se for uma única string
    if isinstance(colunas, str):
        colunas = [colunas]

    # Formata a string de colunas para o SQL
    colunas_sql = ', '.join([f'"{c}"' for c in colunas])

    try:
        with engine.connect() as conn:
            # Comando SQL para adicionar a restrição de chave primária
            conn.execute(text(
                f'ALTER TABLE "{schema}"."{nome_tabela}" '
                f'ADD PRIMARY KEY ({colunas_sql})'
            ))
            conn.commit()
        print(f"Chave primária adicionada na tabela '{nome_tabela}' no schema '{schema}'.")
    except SQLAlchemyError as e:
        print(f"Erro ao adicionar chave primária: {e}")
    finally:
        if engine:
            engine.dispose()

def adicionar_chave_estrangeira(tabela_origem, coluna_origem, tabela_destino, coluna_destino, schema=SCHEMA_DESTINO):
    """Adiciona uma chave estrangeira de uma tabela para outra."""
    engine = get_engine()
    if engine is None:
        return
    try:
        with engine.connect() as conn:
            # Comando SQL para adicionar a restrição de chave estrangeira
            conn.execute(text(
                f'ALTER TABLE "{schema}"."{tabela_origem}" '
                f'ADD FOREIGN KEY ("{coluna_origem}") '
                f'REFERENCES "{schema}"."{tabela_destino}" ("{coluna_destino}")'
            ))
            conn.commit()
        print(f"Chave estrangeira adicionada da tabela '{tabela_origem}' para a tabela '{tabela_destino}'.")
    except SQLAlchemyError as e:
        print(f"Erro ao adicionar chave estrangeira: {e}")
    finally:
        if engine:
            engine.dispose()