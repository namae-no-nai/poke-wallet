# Descrição do problema

Sua tarefa é construir uma calculadora de trades de pokémon, para que o usuário possa
calcular se sua carteira de Pokémon está valorizando e como.
Um pesquisador descobriu uma correlação monetária inesperada com relação a estes
monstros virtuais. Com a alta do interesse por estes, após a criação do Pokémon Go, e o crescimento
do uso de criptomoedas, blockchain e NFTs, este fato ficou cada vez mais evidente. A teoria é que a
base de experiência (“base_experience”) de um Pokémon possui uma relação direta com sua cotação
em Bitcoin (BTC). De forma que um ponto de experiência equivale a um satoshi (0.00000001 BTC).
Sua missão é controlar a carteira de pokémon e seu valor ao longo do tempo. De forma que o
usuário consiga controlar a valoração de sua carteira.

# Notas

- Permitir que o investidor registre a aquisição de novos pokémon;

- Permitir que o investidor registre a venda de novos pokémon;

- Permitir que o investidor acompanhe a valorização de sua carteira em USD;

- Permitir visualizar o histórico de operações realizadas.

  
  

##  Lista de Conteúdos

  

[Descrição](#descrição)

  

[Gems instaladas](#gems-instaladas)

  

[Rodando a aplicação](#rodando-a-aplicação-arrow_forward)

  

[Rodando os testes](#rodando-os-testes-memo)
  

[Considerações](#considerações)

  
  

##  Descrição

<p  align="justify"> A Poke-wallet é um app que visa, a princípio, permitir que um usuário cadastre as suas compras e vendas de pokemons convertidas de bitcoin para dólar americano, podendo observar as mudanças de valor na página inicial e consultar o seu log de preço de compra ou venda, na página de histórico de vendas em que as operções estão ordenadas por data, da mais antiga para a mais recente. 
</p>

  

##  Gems instaladas


<p  align="justify"> As gems instaladas nessa aplição e suas dependências podem ser encontradas no arquivo Gemfile e Gemfile.lock respctivamente

  

* ruby '3.0.3'

  

* rails '7.0.3.1'

  
* factory_bot_rails, para auxiliar na criação de testes

* rspec-rails, para a execução de testes

* rubocop utilizado como linter

* simplecov, garantir uma cobertura adqueada de testes

 </p>

  

##  Rodando a aplicação

  
1. Clone o repositório

```
git clone https://github.com/namae-no-nai/poke-wallet
```

2. Setup do banco de dados, criação, aplicação das migrações e a seed
```
docker-compose rails db:create db:setup
```

3. Execute a aplicação
```
rails s
```

A aplicação rodará na porta local 30000 => http://localhost:3000.

  

##  Rodando os testes

  
<p  align="justify">Para a rodar os testes é necessário executar</p>
 
 ```
rspec
```

<p  align="justify">Além dos testes ele deverá exibir a cobertura de testes fornecida pelo simplecov</p>

<p  align="justify">Outros comandos úteis são</p>

```
rubocop
```
<p  align="justify">Faz o lint do código da aplicação e </p>

```
rails c
```

<p  align="justify">Permite o acesso ao console da aplicação </p>

![simplecov](simplecov.png)

##  Considerações

<p  align="justify">O código foi feito com intuíto de rodar uma aplicação simples, portanto sem maiores preocupações em relação a escalabilidade, tendo em vista o número de chamadas feitas as Apis necessárias, numa abordagem desse tipo seria melhor uma implementação levando em considerdação o uso de filas, cache e outras técnicas que diminuiríam o tempo de acesso do usuário assim como evitaria a queda do aplicativo.
Outro ponto que poderia ser considerado, seria o design pattern aplicado, tendo em vista que modelos como o hexagonal permitem um maior e mais fácil descoplamento da regra de negócio e dos adapters, que poderiam ser fácilmente trocados para atender uma maior demanda 
</p>
