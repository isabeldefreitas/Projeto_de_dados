# Usa uma imagem base oficial do Python
FROM python:3.9-slim

# Define o diretório de trabalho dentro do container
WORKDIR /app

# Copia e instala as dependências do projeto
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o conteúdo do projeto para o container
COPY . .

# Comando que o container executará ao ser iniciado.
# Ele chama o script que irá orquestrar a execução dos notebooks.
CMD ["./scripts/run-etl.sh"]