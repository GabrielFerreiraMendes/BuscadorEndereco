# Consulta CEP

 O Consulta CEP é uma aplicação criada em Delphi apenas com componentes nativos da linguagem. Essa aplicação tem como objetivo demonstrar o uso do padrão MVC, testes unitários, serialização e desserialização de arquivos JSON, requisições web/Rest e o uso de interfaces.

 Ao informar o cep a aplicação realiza a consulta do endereço primeiramente no ViaCEP (https://viacep.com.br/), em caso de indiponibilidade do consula na sequência no APICep (https://apicep.com/api-de-consulta/) e se o também estiver indisponível é realizada uma consulta ao serviço da AwesomeAPI (https://docs.awesomeapi.com.br/api-cep).

## Padrão arquitetural
- MVC (Model, view, controller)
