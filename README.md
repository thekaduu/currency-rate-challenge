# CurrencyRate é uma api de taxas de câmbio
[![Build Status](https://travis-ci.org/thekaduu/currency-rate-challenge.svg?branch=master)](https://travis-ci.org/thekaduu/currency-rate-challenge) [![Maintainability](https://api.codeclimate.com/v1/badges/ee0dde9714d99d6991f4/maintainability)](https://codeclimate.com/github/thekaduu/currency-rate-challenge/maintainability)

Foi desenvolvido utilizando as seguintes ferramentas:
* Ruby v 2.5.0
* Rspec v 3.7.0
* Sinatra v 2.0.1
* TravisCI para fazer a integração contínua e o CD
* Dotenv (para criar um arquivo de configuração utilizando as variáveis de ambiente)
* Rubocop como lint de código Ruby
* Simplecov para efetuar a cobertura de teste da aplicação


Possíveis features
------------------

Criar serviço externo que consultaria a api do jsonrate todos os dias e armazenaria o resultado em um banco NoSQL (Sugiro Elasticsearch).
Fazer com que a aplicação consulte o banco de dados ao invés de efetuar 7 requests a cada usuário que acessa a rota.
Implementação do [GraphQL](https://graphql.org/)


Este repositório faz o deploy automático para o [Heroku](https://www.heroku.com/) na seguinte url: [https://currency-rate-challenge.herokuapp.com/api/v1/currencyrate](https://currency-rate-challenge.herokuapp.com/api/v1/currencyrate)