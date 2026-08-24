import re
import pandas as pd

# Dicionário de DDDs por UF
DDD_POR_UF = {
    "AC": [68], "AL": [82], "AP": [96], "AM": [92, 97], "BA": [71, 73, 74, 75, 77],
    "CE": [85, 88], "DF": [61], "ES": [27, 28], "GO": [62, 64], "MA": [98, 99],
    "MT": [65, 66], "MS": [67], "MG": [31, 32, 33, 34, 35, 37, 38],
    "PA": [91, 93, 94], "PR": [41, 42, 43, 44, 45, 46], "PB": [83],
    "PE": [81, 87], "PI": [86, 89], "RJ": [21, 22, 24], "RN": [84],
    "RS": [51, 53, 54, 55], "RO": [69], "RR": [95], "SC": [47, 48, 49],
    "SP": [11, 12, 13, 14, 15, 16, 17, 18, 19], "SE": [79], "TO": [63]
}

def limpar_numero(numero):
    """Remove caracteres não numéricos, trata prefixos e zeros iniciais."""
    numero = str(numero)
    numeros = re.sub(r'\D', '', numero)  # mantém apenas dígitos

    # Remove +55 ou 55 no início
    if numeros.startswith("55") and len(numeros) > 11:
        numeros = numeros[2:]

    # Remove zero à esquerda
    if len(numeros) >= 2 and numeros[0] == "0":
        numeros = numeros[1:]

    return numeros

def validar_numero(numeros, uf=None):
    """Valida DDD e formato celular/fixo, retorna mensagens detalhadas."""
    estado_tel = uf

    # Quantidade de dígitos
    if len(numeros) not in [10, 11]:
        return estado_tel, "Inválido: quantidade incorreta", "Inválido: tamanho incorreto após DDD"

    # Verifica se todos os dígitos são iguais
    if len(set(numeros)) == 1:
        return estado_tel, "Inválido: todos dígitos iguais", "Inválido: número repetitivo"

    # Extrai DDD e número
    try:
        ddd = int(numeros[:2])
    except:
        return estado_tel, "Inválido: DDD não numérico", "Inválido: erro no DDD"

    numero = numeros[2:]

    # Validação do DDD
    if estado_tel and (ddd not in DDD_POR_UF.get(estado_tel, [])):
        ddd_status = f"Inválido: DDD {ddd} não pertence ao estado {estado_tel}"
    else:
        ddd_status = "Válido"

    # Validação celular/fixo
    if len(numero) == 9:
        if not numero.startswith("9"):
            num_status = "Inválido: celular sem 9 inicial"
        else:
            num_status = "Válido"
    elif len(numero) == 8:
        if numero[0] in ["2", "3", "4", "5"]:
            num_status = "Válido"
        elif numero[0] == "9":
            num_status = "Inválido: celular com tamanho incorreto"
        else:
            num_status = "Inválido: fixo com dígito inicial incorreto"
    else:
        num_status = "Inválido: tamanho incorreto após DDD"

    return estado_tel, ddd_status, num_status

def status_final(ddd_status, num_status):
    """Combina os status do DDD e do número."""
    if ddd_status != "Válido" and num_status != "Válido":
        return f"{ddd_status} e {num_status}"
    elif ddd_status != "Válido":
        return ddd_status
    elif num_status != "Válido":
        return num_status
    else:
        return "Válido"


def formatar_numero(numeros):
    """Formata número no padrão +55 (DD) XXXX-XXXX ou XXXXX-XXXX."""
    if len(numeros) == 11:  # Celular
        return f"+55 ({numeros[:2]}) {numeros[2:7]}-{numeros[7:]}"
    elif len(numeros) == 10:  # Fixo
        return f"+55 ({numeros[:2]}) {numeros[2:6]}-{numeros[6:]}"
    return numeros

def processar_telefone(numero, uf=None):
    """Processa número completo: limpeza, validação e status."""
    numeros = limpar_numero(numero)
    estado_tel, ddd_status, num_status = validar_numero(numeros, uf)
    status = status_final(ddd_status, num_status)
    return numeros, estado_tel, ddd_status, num_status, status

def aplicar_validacao(df, coluna_numero, coluna_uf):
    """
    Aplica validação de telefones em um DataFrame.
    - Cria colunas auxiliares com informações de status.
    - Substitui a coluna original pelo formato padronizado (+55 ...).
    """
    # Cria colunas auxiliares
    df[["telefone_limpo", "estado_telefone", "ddd_status", "num_status", "status_final"]] = df.apply(
        lambda row: pd.Series(processar_telefone(row[coluna_numero], row[coluna_uf])),
        axis=1
    )
    
    # Formata e sobrescreve a coluna original
    df[coluna_numero] = df["telefone_limpo"].apply(formatar_numero)
    
    return df
