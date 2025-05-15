import { When, Then } from '@badeball/cypress-cucumber-preprocessor';

let response; // variável compartilhada entre os steps

When('o usuário realiza uma requisição para {string}', (url) => {
  cy.request({
    url,
    failOnStatusCode: false, // permite capturar respostas como 404
  }).then((res) => {
    response = res;
  });
});

Then('o status da resposta deve ser {int}', (statusCode) => {
  expect(response.status).to.eq(statusCode);
});

Then('o corpo da resposta deve estar no formato JSON', () => {
  expect(response.headers['content-type']).to.include('application/json');
});

Then('o título do filme deve ser {string}', (titulo) => {
  expect(response.body.title || response.body.título).to.eq(titulo);
});

Then('o campo {string} deve ser do tipo número', (campo) => {
  expect(Number(response.body[campo])).to.be.a('number');
});

Then('o valor do campo {string} deve ser {int}', (campo, valor) => {
  expect(Number(response.body[campo])).to.eq(valor);
});

Then('o campo "release_date" deve estar no formato "YYYY-MM-DD"', () => {
  const data = response.body.release_date || response.body['data de lançamento'];
  const regex = /^\d{4}-\d{2}-\d{2}$/;
  expect(data).to.match(regex);
});

Then('o campo {string} deve ser {string}', (campo, valor) => {
  expect(response.body[campo]).to.eq(valor);
});

Then('o campo {string} deve conter pelo menos 1 item', (campo) => {
  expect(response.body[campo]).to.be.an('array').and.not.be.empty;
}); 