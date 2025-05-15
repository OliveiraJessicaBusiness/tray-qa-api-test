# Projeto de Testes de API com Cypress e Cucumber

Este repositório contém testes automatizados para a [API Star Wars (SWAPI)](https://swapi.py4e.com) utilizando o framework Cypress em conjunto com o pré-processador Cucumber (Gherkin).

## 🚀 Pré-requisitos

- [Node.js](https://nodejs.org/) (recomenda-se a versão 18.x ou superior)
- [npm](https://www.npmjs.com/) (instalado com o Node.js)

## ⚙️ Configuração Inicial

1. Clone o repositório ou baixe os arquivos do projeto.

2. Acesse a pasta raiz no terminal:

```bash
cd caminho/para/tray-qa-api-test
```

3. Instale as dependências do projeto:

```bash
npm install
```

> Caso tenha problemas com permissões ou ambiente do Node.js, revise sua instalação do `nvm` ou `npm`.

## 📁 Estrutura do Projeto

```
tray-qa-api-test/
├── cypress.config.js           # Configuração do Cypress + Cucumber
├── cypress/
│   ├── e2e/
│   │   └── api/                # Features de API (Gherkin)
│   │       └── starwars.feature
│   └── support/
│       ├── commands.js        # Comandos customizados do Cypress
│       ├── e2e-api.js         # Suporte para testes de API
│       ├── e2e-ui.js          # Suporte para testes de UI (se houver)
│       └── step_definitions/
│           └── api/
│               └── starwars.steps.js
├── package.json               # Scripts e dependências do projeto
├── README.md                  # Documentação (este arquivo)
```

## 🧪 Como Executar os Testes

### 1. Rodar via Interface Gráfica do Cypress

```bash
npx cypress open
```

### 2. Rodar todos os testes em modo headless

```bash
npx cypress run
```

### 3. Rodar apenas os testes de API

```bash
npm run test:api
```

> Este comando utiliza `e2e-api.js` como `supportFile`.

### Scripts disponíveis no `package.json`

```json
"scripts": {
  "test:api": "CYPRESS_supportFile=cypress/support/e2e-api.js npx cypress run --env tipo=api",
  "test:ui": "CYPRESS_supportFile=cypress/support/e2e-ui.js npx cypress run --env tipo=ui"
}
```

## 🧾 Relatórios de Teste

A geração de relatórios JSON via Cucumber pode ser habilitada, e integradores externos (como Allure ou Cucumber HTML Report) podem ser configurados conforme necessidade. O Cypress por padrão gera vídeos e screenshots (se habilitado).

## 🛠️ Troubleshooting

- **Erro: `supportFile missing or invalid`**
  → Verifique se o caminho do arquivo `supportFile` está correto.

- **Erro de parsing Gherkin**
  → Revise a sintaxe do `.feature`, mantendo `# language: pt` na primeira linha.

- **Steps não reconhecidos**
  → Confirme se o `stepDefinitions` está corretamente mapeado em `cypress.config.js`.

## 📦 Dependências Principais

- [`cypress`](https://www.npmjs.com/package/cypress)
- [`@badeball/cypress-cucumber-preprocessor`](https://github.com/badeball/cypress-cucumber-preprocessor)
- [`@bahmutov/cypress-esbuild-preprocessor`](https://www.npmjs.com/package/@bahmutov/cypress-esbuild-preprocessor)
- [`esbuild`](https://esbuild.github.io/)

## 🧠 IDE e Suporte com IA

O projeto foi desenvolvido utilizando o [Cursor](https://www.cursor.sh/) como IDE principal, o qual possui integração com IA para auxílio na estruturação de pastas e sugestões de código mais limpo e organizado.

Toda a lógica dos testes e organização do projeto foram revisadas manualmente para garantir clareza, legibilidade e conformidade com os objetivos do desafio técnico.
