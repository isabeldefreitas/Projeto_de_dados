import pandas as pd
import os

def criar_tabelas_dimensao_e_fato(df, nome_coluna_dimensao, nome_coluna_id_fato, nome_tabela_dimensao, nome_tabela_fato, outras_colunas_fato=None):
    """
    Cria uma tabela de dimensão e uma tabela fato a partir de um DataFrame.

    Args:
        df (pd.DataFrame): O DataFrame de entrada.
        nome_coluna_dimensao (str): O nome da coluna que será a base da nova dimensão.
        nome_coluna_id_fato (str): O nome da coluna de ID na tabela de fato.
        nome_tabela_dimensao (str): O nome desejado para o arquivo da tabela de dimensão.
        nome_tabela_fato (str): O nome desejado para o arquivo da tabela de fato.
        outras_colunas_fato (list, optional): Uma lista de outras colunas a serem incluídas na tabela de fato.

    Returns:
        tuple: Uma tupla contendo os DataFrames (dimensao, fato).
    """
    # 1. Cria a tabela de dimensão a partir dos valores únicos
    dimensao = pd.DataFrame(df[nome_coluna_dimensao].unique(), columns=[nome_coluna_dimensao])
    dimensao.insert(0, f'id{nome_coluna_dimensao}', range(1, 1 + len(dimensao)))

    # 2. Cria a tabela de fato fazendo o 'merge'
    fato = df.merge(dimensao, on=nome_coluna_dimensao, how='left')
    
    # 3. Seleciona as colunas para a tabela de fato
    colunas_fato_finais = [nome_coluna_id_fato, f'id{nome_coluna_dimensao}']
    if outras_colunas_fato:
        colunas_fato_finais.extend(outras_colunas_fato)
    
    fato = fato[colunas_fato_finais]
    
    # Usa a variável de ambiente para salvar o arquivo da dimensão
    caminho_base_arquivos = os.environ.get("CAMINHO_ARQUIVOS_CSV")
    caminho_saida_dimensao = os.path.join(caminho_base_arquivos, "dados_tratados_v2", f"{nome_tabela_dimensao}.csv")
    dimensao.to_csv(caminho_saida_dimensao, index=False)

    # Usa a variável de ambiente para salvar o arquivo da fato
    caminho_saida_fato = os.path.join(caminho_base_arquivos, "dados_tratados_v2", f"{nome_tabela_fato}.csv")
    fato.to_csv(caminho_saida_fato, index=False)    

    # Salva os DataFrames em arquivos CSV
    # dimensao.to_csv(f'../ArquivosExternos/dados_tratados_v2/{nome_tabela_dimensao}.csv', index=False)
    # fato.to_csv(f'../ArquivosExternos/dados_tratados_v2/{nome_tabela_fato}.csv', index=False)

    return dimensao, fato