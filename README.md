# Projeto de Testes de API com Cypress e Cucumber

Este projeto contém testes automatizados para a API Star Wars (SWAPI) utilizando Cypress e Cucumber.

## Pré-requisitos

*   [Node.js](https://nodejs.org/) (versão 18.x ou superior recomendada)
*   [npm](https://www.npmjs.com/) (geralmente vem com o Node.js)

## Configuração Inicial

1.  **Clone o repositório** (se aplicável) ou certifique-se de que você tem os arquivos do projeto.

2.  **Navegue até a pasta raiz do projeto** no seu terminal:
    ```bash
    cd caminho/para/tray-qa-api-tests
    ```

3.  **Instale as dependências do projeto**:
    Se você encontrar problemas com `npm install` (executáveis não sendo linkados em `node_modules/.bin`), pode haver um problema com sua configuração local do `npm` ou `nvm`. Certifique-se de que seu ambiente Node.js está configurado corretamente. Um passo que tentamos durante a depuração foi:
    ```bash
    # Se você usa nvm e tem problemas com prefixo global (verifique os logs do npm)
    # nvm use --delete-prefix SUA_VERSAO_NODE --silent 
    # Exemplo: nvm use --delete-prefix v18.20.5 --silent
    ```
    Em seguida, instale as dependências:
    ```bash
    npm install
    ```

## Estrutura do Projeto

*   `cypress.config.js`: Arquivo de configuração principal do Cypress, incluindo a configuração do pré-processador Cucumber.
*   `cypress/e2e/`: Contém os arquivos de feature (`.feature`) do Gherkin.
    *   `api_star_wars.feature`: Exemplo de feature para testar a SWAPI.
*   `cypress/support/`: Contém arquivos de suporte para os testes.
    *   `e2e.js`: Arquivo de suporte principal do Cypress para testes e2e. (Anteriormente importava os steps, mas isso foi removido pois o pré-processador os descobre).
    *   `commands.js`: Para adicionar comandos customizados do Cypress.
    *   `step_definitions/`: Contém os arquivos de implementação dos steps (`.steps.js`).
        *   `api/starwars.steps.js`: Implementação dos steps para a feature `api_star_wars.feature`.
*   `package.json`: Define os scripts do projeto e as dependências.
*   `README.md`: Este arquivo.

## Como Rodar os Testes

Você pode executar os testes de várias maneiras:

1.  **Abrir o Cypress Test Runner (Interface Gráfica):**
    Este comando abre a UI do Cypress, onde você pode ver seus arquivos de feature e executá-los interativamente.
    ```bash
    npm run cypress:run
    ```
    Ou diretamente:
    ```bash
    npx cypress open
    ```

2.  **Rodar todos os testes em modo headless (via linha de comando):**
    Este comando executa todos os arquivos de feature encontrados na pasta `cypress/e2e/` em segundo plano.
    ```bash
    npm run cypress:run
    ```
    Ou diretamente:
    ```bash
    npx cypress run
    ```

3.  **Rodar uma feature específica em modo headless:**
    Use este comando para executar apenas a feature `api_star_wars.feature`.
    ```bash
    npm run test:api
    ```
    Isso utiliza o script definido no `package.json`:
    `"test:api": "cypress run --spec \"cypress/e2e/api_star_wars.feature\""`

## Relatórios de Teste

A configuração atual do Cucumber (`cypress.config.js`) está definida para gerar um relatório HTML em `cucumber-report.html` na raiz do projeto após a execução dos testes. (Nota: esta formatação de relatório é mais comum em setups de Cucumber-js puro; com `@badeball/cypress-cucumber-preprocessor`, a geração de relatórios Cucumber distintos pode exigir configuração adicional ou o uso de reporters JSON do Cucumber que podem ser processados por ferramentas externas).

Para relatórios mais integrados ao Cypress, você pode explorar os reporters nativos do Cypress ou plugins de reporting do Cypress.

## Troubleshooting

*   **Erro "Expected to find a global registry"**: 
    Este erro geralmente ocorre com `@badeball/cypress-cucumber-preprocessor` se os steps estão sendo definidos ou importados de maneira incorreta (por exemplo, diretamente no `cypress/support/e2e.js`). A solução geralmente é remover tais imports e deixar o pré-processador descobrir os steps, ou configurar corretamente os caminhos de `stepDefinitions` se necessário.

*   **Erro de parsing Gherkin (ex: `expected: #TagLine, #FeatureLine, #Comment, #Empty, got ...`)**:
    Verifique a formatação do seu arquivo `.feature`. Erros comuns incluem linhas em branco inesperadas, indentação incorreta ou caracteres invisíveis. A linha `# language: pt` deve estar no topo, seguida por tags e depois `Feature: ...`.

*   **`npm test` não funciona ou `cucumber-js` não encontrado (para o setup anterior de Cucumber.js puro)**:
    Se você estava tentando rodar um setup de Cucumber.js (não-Cypress) e encontrou problemas, isso geralmente está relacionado a problemas de instalação de dependências (`npm install` não criando links em `node_modules/.bin`) ou configurações do `npm`/`nvm`. O projeto atual está focado no Cypress.

## Dependências Chave

*   `cypress`: Framework principal de testes.
*   `@badeball/cypress-cucumber-preprocessor`: Pré-processador para permitir o uso de arquivos Gherkin/Cucumber com Cypress.
*   `@bahmutov/cypress-esbuild-preprocessor`: Bundler ESBuild usado pelo pré-processador Cucumber.
*   `chai`: Biblioteca de asserção (usada nos arquivos de steps).
*   `axios`: Cliente HTTP (se você precisar fazer requisições fora do `cy.request()` nos seus steps, embora para testes de API com Cypress, `cy.request()` seja o preferido). # tray-qa-api-test
