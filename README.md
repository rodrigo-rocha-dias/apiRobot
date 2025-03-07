# Automacao de Testes de API com Robot Framework

## 📌 Descricao
Este projeto automatiza testes da API usando Robot Framework com a biblioteca Requests.

## 🛠 Tecnologias Utilizadas
- **Linguagem:** Python
- **Framework:** Robot Framework
- **Bibliotecas:** RobotFramework-Requests

## 🚀 Instalacao

### 1. Clone o repositório
```bash
git clone https://github.com/seu-usuario/apiRobot.git
cd apiRobot
```

### 2. Instale as dependências
```bash
pip install -r requirements.txt
```

## 📌 Estrutura do Projeto
```
apiRobot/
│-- tests/                 # Testes Robot Framework
│   ├── viacep.robot       # Testes da API ViaCEP
│-- resources/             # Palavras-chave reutilizáveis
│   ├── viacep_keywords.robot
│-- results/               # Relatórios gerados após os testes
│-- requirements.txt       # Dependências do projeto
│-- robot.yaml             # Configuração do Robot Framework
│-- README.md              # Documentação
```

## 📊 Executando os Testes

### Rodar todos os testes
```bash
robot -d results tests/viacep.robot
```

### Verificar os relatórios
Após a execução, acesse os arquivos gerados:
- 📄 **Relatório:** `results/report.html`
- 🔍 **Log:** `results/log.html`

## 📝 Exemplo de Teste
```robot
*** Settings ***
Library    RequestsLibrary

*** Test Cases ***
Validar Retorno de um CEP Válido
    ${response}=    GET    https://viacep.com.br/ws/01001000/json/
    Status Should Be    ${response.status_code}    200
    Should Contain    ${response.json()}    "logradouro": "Praça da Sé"
```

## 📌 Executando os Testes no GitHub Actions

Para rodar os testes automaticamente no GitHub Actions, crie um arquivo `.github/workflows/tests.yml` com o seguinte conteúdo:

```yaml
name: Run API Tests
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout do código
        uses: actions/checkout@v4

      - name: Configurar Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'

      - name: Instalar dependências
        run: pip install -r requirements.txt

      - name: Rodar os testes
        run: robot -d results tests/viacep.robot
```

Isso permitirá que os testes rodem automaticamente em cada `push` ou `pull request`. 🎯

