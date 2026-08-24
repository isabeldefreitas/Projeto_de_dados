#!/bin/bash

# --- Configurações ---
DIRETORIO_NOTEBOOKS="/app/notebooks"
DIRETORIO_SAIDA="/tmp/notebooks_executados"

# Cria o diretório de saída
mkdir -p "$DIRETORIO_SAIDA"

echo "Iniciando a execução da pipeline de ETL..."

# Loop que encontra todos os notebooks (.ipynb), os ordena numericamente e os executa.
find "$DIRETORIO_NOTEBOOKS" -name "*.ipynb" | sort -V | while read -r notebook; do
  nome_notebook=$(basename "$notebook")
  
  echo "Executando o notebook: $nome_notebook"

  # Executa o notebook com papermill, especificando o kernel
  papermill --kernel python3 "$notebook" "$DIRETORIO_SAIDA/${nome_notebook%.ipynb}_saida.ipynb"
  
  # Verifica se a execução do notebook falhou
  if [ $? -ne 0 ]; then
    echo "Erro ao executar o notebook: $nome_notebook. A pipeline será abortada."
    exit 1
  fi
done

echo "Pipeline de ETL concluída com sucesso!"