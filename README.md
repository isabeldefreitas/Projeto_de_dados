# 🦜 SABIÁ — Sistema de Análises Baseadas em Integração de Aptidões

## 📋 Sobre o projeto

O **SABIÁ — Sistema de Análises Baseadas em Integração de Aptidões** é um projeto de dados, fictício, desenvolvido para a empresa **T2M**, com o objetivo de analisar as competências técnicas e comportamentais dos colaboradores e apoiar sua alocação estratégica em projetos e serviços.

O projeto foi desenvolvido a partir da identificação de uma necessidade de indicadores mensuráveis relacionados às aptidões e competências dos colaboradores. A ausência dessas informações dificulta tanto a identificação de gaps de conhecimento quanto a formação de equipes com profissionais adequados para cada demanda.

A solução proposta consiste em um sistema analítico que integra:

* 🐘 PostgreSQL
* 🐳 Docker e Docker Compose
* 🐍 Python
* 🔄 Pipeline ETL
* 📊 Power BI
* 📈 Análises exploratórias e Machine Learning

---

# 🎯 Objetivo

Desenvolver uma solução de dados capaz de:

* Avaliar as **Hard Skills** e **Soft Skills** dos colaboradores;
* Identificar gaps de competências;
* Analisar treinamentos e certificações;
* Apoiar a alocação de profissionais em empresas, projetos e serviços;
* Identificar perfis semelhantes de colaboradores;
* Gerar indicadores para apoiar a tomada de decisão;
* Facilitar a visualização das informações por meio de dashboards interativos.

---

# 🏗️ Arquitetura do Projeto

O projeto segue uma estrutura baseada na **Arquitetura Medalhão**, organizada em três camadas principais:

```text
                    ┌──────────────────┐
                    │   FONTES DE      │
                    │      DADOS       │
                    │                  │
                    │ PostgreSQL       │
                    │ Arquivos CSV     │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │   🥉 BRONZE      │
                    │                  │
                    │ Dados brutos     │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │   🥈 PRATA       │
                    │                  │
                    │ Pipeline ETL     │
                    │ Python           │
                    │ Docker           │
                    │ Dados tratados   │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │   🥇 OURO        │
                    │                  │
                    │ Power BI         │
                    │ SQL              │
                    │ Dashboards       │
                    │ Análises         │
                    └──────────────────┘
```

### 🥉 Camada Bronze

Representa as fontes de dados brutas.

Os dados são provenientes de:

* Banco de dados PostgreSQL;
* Arquivos CSV externos.

O banco original contém informações relacionadas a:

* Colaboradores;
* Empresas;
* Competências;
* Serviços;
* Fotos dos colaboradores;
* Relações entre colaboradores, empresas e competências.

Também foram integrados dados externos relacionados a:

* Certificações;
* Situação PCD;
* Dados pessoais;
* Formação acadêmica;
* Treinamentos;
* Datas de admissão;
* Soft Skills.

---

### 🥈 Camada Prata

Nesta etapa é realizado o processo de **ETL (Extract, Transform and Load)**.

O pipeline foi desenvolvido em **Python** e executado dentro de um container Docker.

Entre os principais tratamentos realizados estão:

* Padronização de datas;
* Padronização de categorias;
* Limpeza de nomes;
* Padronização de e-mails;
* Validação e formatação de CPF;
* Padronização de telefones;
* Tratamento de CNPJ;
* Remoção de duplicidades;
* Tratamento de valores ausentes;
* Renomeação de colunas;
* Separação de dados em tabelas fato e dimensão;
* Correção de relacionamentos;
* Criação de chaves para integração entre tabelas.

Os dados tratados são armazenados no schema:

```text
projetoDados2025_v2
```

---

### 🥇 Camada Ouro

A camada Ouro é responsável pelo consumo e análise dos dados.

Os dados tratados são utilizados para:

* Dashboards no Power BI;
* Consultas SQL;
* Análises exploratórias;
* Clusterização de colaboradores;
* Análise de correlação entre competências;
* Análise de aderência dos colaboradores aos serviços.

---

# 🔄 Pipeline ETL

O processo ETL é executado em um ambiente containerizado utilizando **Docker Compose**.

A arquitetura possui dois serviços principais:

```text
┌────────────────────┐
│     PostgreSQL     │
│                    │
│ Dados de origem    │
│ Dados tratados     │
└─────────┬──────────┘
          │
          ▼
┌────────────────────┐
│    Pipeline ETL    │
│                    │
│ Python             │
│ Pandas             │
│ NumPy              │
│ SQLAlchemy         │
│ Psycopg2           │
└────────────────────┘
```

O pipeline é responsável por:

1. Extrair os dados do banco PostgreSQL;
2. Ler os arquivos CSV externos;
3. Realizar a limpeza e padronização dos dados;
4. Criar novas dimensões e tabelas fato;
5. Corrigir inconsistências e relacionamentos;
6. Exportar os dados tratados;
7. Inserir os dados no banco de destino.

---

# 🗂️ Principais Tratamentos

O projeto conta com diversos notebooks responsáveis pelo tratamento individual dos datasets.

Alguns deles são:

```text
Tratamento_Dados_Primarios.ipynb
Tratamento_DataAdmissao.ipynb
Tratamento_PCD.ipynb
Tratamento_Certificacoes.ipynb
Tratamento_Softskills.ipynb
Tratamento_competencia.ipynb
Tratamento_servicos.ipynb
Tratamento_Email.ipynb
coordenadas.ipynb
Tratamento_empresa.ipynb
Tratamento_relacao_colaborador_empresa.ipynb
Tratamento_relacao_colaborador_certificacao.ipynb
Tratamento_relacao_colaborador_formacao.ipynb
Tratamento_relacao_colaborador_softskills.ipynb
Tratamento_relacao_colaborador_treinamento.ipynb
Tratamento_relacao_colaborador_competencia.ipynb
Tratamento_relacao_dataAdmissao_colaborador.ipynb
Tratamento_relacao_colaborador_photo.ipynb
Tratamento_relacao_empresa_servico.ipynb
Tratamento_relacao_servico_competencia.ipynb
insert_db.ipynb
```

---

# 🗃️ Modelagem dos Dados

Os dados originais possuíam diversos relacionamentos **muitos para muitos**, o que dificultava a análise e a integração com ferramentas de BI.

Para solucionar esse problema, foram criadas tabelas de:

* Dimensão;
* Fato;
* Relacionamento.

A nova estrutura permite transformar relacionamentos complexos em relações mais adequadas para análise.

Exemplo:

```text
COLABORADOR
     │
     │ 1
     │
     ▼
COLABORADOR_COMPETENCIA
     ▲
     │ N
     │
COMPETENCIA
```

Outras entidades principais incluem:

```text
Colaborador
Empresa
Competência
Soft Skill
Certificação
Formação Acadêmica
Treinamento
Serviço
Cidade
Data de Admissão
```

---

# 📊 Dashboard

Após o tratamento dos dados, as informações foram integradas ao **Power BI**.

O dashboard permite analisar informações relacionadas a:

### 👥 Colaboradores

* Nome;
* Cidade;
* E-mail;
* Telefone;
* Empresa;
* Tempo de vínculo;
* Data de admissão;
* Competências;
* Formação acadêmica;
* Certificações;
* Soft Skills.

### 🧠 Competências

* Hard Skills mais frequentes;
* Distribuição dos níveis de competências;
* Competências por região;
* Relação entre treinamentos e competências.

### 🎓 Desenvolvimento profissional

* Quantidade de colaboradores certificados;
* Percentual de colaboradores com certificações;
* Treinamentos realizados;
* Gaps de capacitação.

---

# 🤖 Análise de Dados e Machine Learning

Além da análise exploratória realizada no Power BI, o projeto também utiliza técnicas de **Machine Learning** para identificar padrões entre os colaboradores.

Foram utilizadas matrizes de presença e ausência para representar:

* Hard Skills;
* Soft Skills;
* Treinamentos.

Esses dados foram utilizados para realizar análises de:

### Clusterização

Foi utilizado o algoritmo:

```text
K-Means
```

Antes da clusterização, os dados foram:

1. Padronizados;
2. Processados;
3. Reduzidos dimensionalmente utilizando PCA.

Os resultados foram visualizados através de:

* Gráficos de dispersão;
* Heatmaps;
* Gráficos de barras;
* Distribuição dos clusters por empresa.

---

# 🔗 Análise de Correlação

Também foram realizadas análises para identificar possíveis relações entre competências técnicas e comportamentais.

Foram analisadas:

* Correlações entre Hard Skills e Soft Skills;
* Correlações individuais entre competências;
* Testes de significância;
* Relações entre perfis profissionais.

---

# 📈 Principais Insights

Entre os resultados encontrados durante a análise estão:

* A maior parte dos colaboradores está concentrada no setor de TI;
* O setor de Análise de Dados possui baixa representatividade;
* SQL, C#, Python e React estão entre as competências mais frequentes;
* Apenas parte dos colaboradores possui certificações técnicas;
* Foram identificados gaps de competências e treinamentos;
* Existem perfis técnicos e comportamentais distintos entre os colaboradores;
* A distribuição de profissionais aptos varia entre empresas e serviços.

Essas análises podem auxiliar em decisões relacionadas a:

* 📚 Treinamentos direcionados;
* 🎓 Incentivo a certificações;
* 👥 Formação de equipes multidisciplinares;
* 🔄 Realocação de colaboradores;
* 📊 Identificação de gaps de competências;
* 🧩 Melhor distribuição de talentos entre projetos e serviços.

---

# 🛠️ Tecnologias Utilizadas

| Tecnologia       | Utilização                               |
| ---------------- | ---------------------------------------- |
| Python           | Tratamento e análise dos dados           |
| Pandas           | Manipulação de dados                     |
| NumPy            | Operações numéricas                      |
| PostgreSQL       | Armazenamento dos dados                  |
| Docker           | Containerização da aplicação             |
| Docker Compose   | Orquestração dos containers              |
| SQLAlchemy       | Integração entre Python e banco de dados |
| Psycopg2         | Conexão com PostgreSQL                   |
| Jupyter Notebook | Desenvolvimento do ETL                   |
| Papermill        | Automação de notebooks                   |
| Geopy            | Geocodificação                           |
| Power BI         | Visualização e dashboards                |
| DAX              | Criação de medidas                       |
| Scikit-learn     | Clusterização e análises                 |
| PCA              | Redução de dimensionalidade              |
| GitHub           | Versionamento do projeto                 |

---
# 📁 Estrutura do Projeto

```text
SABIA/
│
├── Backend/
│   │
│   ├── Docker/
│   │   │
│   │   ├── ArquivosExternos/
│   │   │   ├── dados_brutos/
│   │   │   └── dados_tratados_v2/
│   │   │
│   │   ├── init_db/
│   │   │   └── dump-postgres-202508011044.sql
│   │   │
│   │   ├── notebooks/
│   │   │
│   │   ├── scripts/
│   │   │   └── run-etl.sh
│   │   │
│   │   ├── utils/
│   │   │   ├── __init__.py
│   │   │   ├── exao.py
│   │   │   ├── modelagem_utils.py
│   │   │   └── valida_telefone.py
│   │   │
│   │   ├── Consultas.sql
│   │   ├── docker-compose.yml
│   │   ├── Dockerfile
│   │   ├── README.md
│   │   └── requirements.txt
│
├── Machine_learning/
│
├── Frontend/
│
├── README.md
│
└── SABIA_Documentacao.pdf
```
---

# 🚀 Como Executar o Projeto

## Pré-requisitos

Antes de executar o projeto, é necessário ter instalado:

* Docker
* Docker Compose
* Git

Opcionalmente:

* Python
* PostgreSQL
* Power BI Desktop
* DBeaver

---

## 1. Clone o repositório

```bash
git clone <URL_DO_REPOSITORIO>
```

Entre na pasta do projeto:

```bash
cd <NOME_DO_REPOSITORIO>
```

---

## 2. Configure as variáveis de ambiente

Crie um arquivo `.env` com as configurações necessárias para o banco de dados e para o pipeline ETL.

Exemplo:

```env
POSTGRES_HOST=postgres
POSTGRES_PORT=5432
POSTGRES_DB=postgres
POSTGRES_USER=postgres
POSTGRES_PASSWORD=sua_senha

SOURCE_SCHEMA=ProjetoDados25.1
TARGET_SCHEMA=projetoDados2025_v2
```

> Os nomes das variáveis devem ser ajustados de acordo com a configuração real do projeto.

---

## 3. Execute os containers

```bash
docker compose up --build
```

O Docker irá iniciar:

* O banco PostgreSQL;
* O container responsável pelo pipeline ETL.

---

## 4. Acesse os dados tratados

Após a execução do pipeline, os dados tratados estarão disponíveis no schema:

```text
projetoDados2025_v2
```

Esses dados podem ser acessados utilizando ferramentas como:

* DBeaver;
* PostgreSQL;
* Power BI.

---

# 📊 Power BI

O dashboard foi desenvolvido utilizando os dados tratados pelo pipeline ETL.

As principais análises incluem:

* Perfil dos colaboradores;
* Hard Skills;
* Soft Skills;
* Certificações;
* Treinamentos;
* Distribuição regional;
* Gaps de competências;
* Relação entre colaboradores e empresas;
* Aderência de competências aos serviços.

---

# 🔮 Possíveis Melhorias Futuras

Algumas melhorias que podem ser implementadas no projeto:

* [ ] Automatizar a execução do pipeline em intervalos definidos;
* [ ] Implementar testes automatizados no ETL;
* [ ] Criar validações de qualidade dos dados;
* [ ] Implementar logs estruturados;
* [ ] Migrar a pipeline para um ambiente em nuvem;
* [ ] Criar alertas para identificação automática de gaps;
* [ ] Desenvolver um sistema de recomendação para alocação de colaboradores;
* [ ] Permitir atualização dinâmica dos dados;
* [ ] Adicionar novas técnicas de Machine Learning.

---

# 👥 Equipe

Projeto desenvolvido por:

* **Davi**
* **Isabel**
* **Nathália**
* **Pedro**

---

# 📚 Repositórios

O projeto foi dividido entre "backend" e "frontend":

### Backend

Responsável pelo:

* Pipeline ETL;
* Tratamento dos dados;
* Modelagem;
* Banco de dados;
* Análises.

### Frontend

Responsável pelo:

* Dashboard;
* Modelagem no Power BI;
* Medidas DAX;
* Visualização dos dados.

```text
Dados_2025_1_T2M_Projeto-Sabia_FrontEnd
```

---

# 🧠 Conclusão

O **SABIÁ** demonstra como técnicas de Engenharia e Análise de Dados podem ser utilizadas para transformar dados brutos e inconsistentes em informações estratégicas.

Por meio de uma pipeline ETL containerizada, modelagem relacional, análise exploratória, dashboards e técnicas de Machine Learning, o projeto permite identificar competências, lacunas de capacitação e padrões entre colaboradores.

A solução pode apoiar organizações na tomada de decisões relacionadas à **gestão de talentos, desenvolvimento profissional, formação de equipes e alocação estratégica de recursos**.

---

<p align="center">
  Projeto fictício desenvolvido como projeto principal e requisito para a conclusão da Residência em TIC e Dados do Serratec - Parque Tecnológico de Petrópolis.
</p>
