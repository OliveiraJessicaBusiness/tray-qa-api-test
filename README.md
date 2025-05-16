
### 📄 `README.md` (versão aprimorada)

````markdown
# ✅ Projeto de Testes de API com Cypress e Cucumber

Este repositório contém a automação de testes para a [API pública do Star Wars (SWAPI)](https://swapi.py4e.com), utilizando o framework **Cypress** em conjunto com o **pré-processador Cucumber** (Gherkin).

O objetivo é validar endpoints REST com base em critérios comportamentais (BDD) de forma legível, reutilizável e organizada.

---

## ⚙️ Tecnologias Utilizadas

- [Cypress](https://www.cypress.io/) v14.x
- [Cucumber Preprocessor](https://github.com/badeball/cypress-cucumber-preprocessor)
- [esbuild](https://esbuild.github.io/) para build otimizado
- Node.js v18+

---

## 🚀 Como Iniciar

### 1. Clone o repositório

```bash
git clone https://github.com/OliveiraJessicaBusiness/tray-qa-api-test.git
cd tray-qa-api-test
````

### 2. Instale as dependências

```bash
npm install
```

### 3. Execute os testes

#### 👉 Modo interativo (interface Cypress):

```bash
npx cypress open
```

#### 👉 Modo headless (terminal):

```bash
npx cypress run
```

#### 👉 Somente testes de API:

```bash
npm run test:api
```

> Esse script usa `e2e-api.js` como `supportFile`.

---

## 📁 Estrutura do Projeto

```
tray-qa-api-test/
├── cypress.config.js              # Configuração Cypress + Cucumber
├── cypress/
│   ├── e2e/
│   │   └── api/
│   │       └── starwars.feature   # Cenários BDD
│   └── support/
│       ├── commands.js            # Custom commands (se necessário)
│       ├── e2e-api.js             # Configuração para testes de API
│       ├── e2e-ui.js              # Configuração (opcional) para testes de UI
│       └── step_definitions/
│           └── api/
│               └── starwars.steps.js
├── package.json                   # Scripts e dependências
└── README.md                      # Documentação do projeto
```

---

## 🧪 Scripts disponíveis

```json
"scripts": {
  "test:api": "CYPRESS_supportFile=cypress/support/e2e-api.js npx cypress run --env tipo=api",
  "test:ui": "CYPRESS_supportFile=cypress/support/e2e-ui.js npx cypress run --env tipo=ui"
}
```

---

## ✅ Exemplos de Validação

* Retorno esperado em buscas por personagens
* Códigos de status HTTP
* Resposta em JSON válida
* Campos obrigatórios na estrutura da resposta

---

## 📦 Dependências Principais

* [`cypress`](https://www.npmjs.com/package/cypress)
* [`@badeball/cypress-cucumber-preprocessor`](https://github.com/badeball/cypress-cucumber-preprocessor)
* [`@bahmutov/cypress-esbuild-preprocessor`](https://www.npmjs.com/package/@bahmutov/cypress-esbuild-preprocessor)
* [`esbuild`](https://esbuild.github.io/)

---

## 🛠️ Dicas e Soluções de Problemas

* **Erro: `supportFile missing or invalid`**

  * Verifique se o caminho em `cypress.config.js` está correto.

* **Erro de parsing no `.feature`**

  * Adicione `# language: pt` no topo do arquivo e valide a indentação.

* **Steps não reconhecidos**

  * Verifique se o diretório `step_definitions` está corretamente configurado.

---

## 🧠 Uso de Inteligência Artificial

Este projeto foi desenvolvido com apoio da ferramenta **Cursor (IDE com IA integrada)**, utilizada para:

* Estruturar o projeto com base em boas práticas
* Sugerir melhorias em organização e legibilidade do código

> **Todo o código, lógica de testes e validações foram escritos e revisados manualmente** para garantir precisão e alinhamento com os objetivos do desafio técnico.

---

## 🔗 Repositório

📎 [https://github.com/OliveiraJessicaBusiness/tray-qa-api-test](https://github.com/OliveiraJessicaBusiness/tray-qa-api-test)

---

## 📬 Contato

Jessica Carina
👩‍💻 QA
