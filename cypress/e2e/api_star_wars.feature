@api
Feature: Testes da API Star Wars

  Scenario: Validar se a request retorna JSON válido
    When o usuário realiza uma requisição para "https://swapi.py4e.com/api/films/?format=json"
    Then o status da resposta deve ser 200
    And o corpo da resposta deve estar no formato JSON

  Scenario: Validar retorno para URL inválida
    When o usuário realiza uma requisição para "https://swapi.py4e.com/api/people/?format=jsonx"
    Then o status da resposta deve ser 404

  Scenario: Validar se o filme com ID 10 existe
    When o usuário realiza uma requisição para "https://swapi.py4e.com/api/films/10/"
    Then o status da resposta deve ser 404

  Scenario: Validar se o filme com ID 2 existe
    When o usuário realiza uma requisição para "https://swapi.py4e.com/api/films/2/"
    Then o status da resposta deve ser 200
    And o título do filme deve ser "The Empire Strikes Back"

  Scenario: Validar o nome correto do episódio 1
    When o usuário realiza uma requisição para "https://swapi.py4e.com/api/films/1/"
    Then o título do filme deve ser "A New Hope"

  Scenario: Validar o ID do episódio e o tipo de dado
    When o usuário realiza uma requisição para "https://swapi.py4e.com/api/films/1/"
    Then o campo "episode_id" deve ser do tipo número
    And o valor do campo "episode_id" deve ser 4

  Scenario: Validar o formato de data americana
    When o usuário realiza uma requisição para "https://swapi.py4e.com/api/films/1/"
    Then o campo "release_date" deve estar no formato "YYYY-MM-DD"

  Scenario: Validar altura, peso e filmes do personagem C-3PO
    When o usuário realiza uma requisição para "https://swapi.py4e.com/api/people/2/"
    Then o campo "name" deve ser "C-3PO"
    And o campo "height" deve ser "167"
    And o campo "mass" deve ser "75"
    And o campo "films" deve conter pelo menos 1 item 