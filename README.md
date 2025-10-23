# DDL - Criação das tabelas
## Tabela de Clientes:

- **id_cliente**: vai ser a PK, para identificar o cliente dentro da nossa tabela, sendo incrementado automaticamente a cada inserção.  
- **nome**: não pode ser vazio, pois é um dado necessário para identificação dos clientes.  
- **cpf**: não pode ser usado como uma PK, pois apesar de ser único, é um dado sensível, tendo que ter cuidado. Além disso, não pode ser vazio, pois é responsável por diferenciar duas pessoas em caso de nomes iguais.  
- **numero_telefone**: não pode ser vazio, pois serve para entrar em contato com o cliente.  
- **endereco**: não pode ser vazio, pois serve para encontrar a casa do cliente em caso de deixar o veículo na residência.  

---

## Tabela de Veículos:

- **id_veiculo**: vai ser a PK, para identificar cada veículo na tabela, sendo incrementado automaticamente a cada inserção.  
- **id_cliente_ref**: campo que indica o id de quem é dono do veículo, no caso esse id é da tabela cliente, não podendo ser vazio.  
- **placa**: dado único de cada veículo, sendo obrigatório, pois ajuda na identificação do veículo.  
- **renavam**: dado único de cada veículo, sendo obrigatório, pois é um registro único para o veículo (“um CPF para os carros”).  
- **marca**: não pode ser vazia, pois define o fabricante do veículo, ajudando a identificar o veículo.  
- **modelo**: não pode ser vazio, pois diferencia o tipo do veículo dentro da marca.  
- **cor**: não pode ser vazia, pois é uma característica visual do veículo.  
- **ano_fabricacao**: armazena o ano de fabricação do veículo, sendo obrigatório, pois veículos podem ser diferentes devido ao ano de fabricação, mesmo sendo o mesmo modelo.  

---

## Tabela de Serviços:

- **id_servico**: vai ser a PK, usada para identificar cada tipo de serviço oferecido.  
- **nome**: deve ser único e obrigatório, pois define o nome do serviço no catálogo.  
- **descricao**: detalha o serviço que vai ser realizado.  
- **duracao**: indica o tempo médio estimado de execução do serviço.  
- **preco**: deve ser maior que zero, pois representa o valor cobrado pelo serviço e não pode ser um valor vazio.  

---

## Tabela de Agendamentos:

- **id_agendamento**: vai ser a PK, identificando cada agendamento na tabela de agenda da oficina.  
- **id_cliente_ref**: referência ao id do cliente que realizou o agendamento, da tabela cliente, não podendo ser vazio.  
- **id_veiculo_ref**: referência ao id do veículo que será atendido, da tabela veiculo, não podendo ser vazio.  
- **id_servico_ref**: referência ao id de serviço que será executado, da tabela servico, não podendo ser vazio.  
- **data**: data marcada para a realização do serviço, não podendo ser vazia.  
- **hora**: horário agendado para o início do atendimento, não podendo ser vazio.  
- **observacao**: comentários adicionais sobre o serviço e/ou observações do veículo.  
- **finalizado**: indica se o serviço já foi concluído, não podendo ser vazio.

## Relações de Cardinalidade:

- **cliente 1:N veiculo**: Um cliente pode possuir vários veículos, mas cada veículo pertence a um único cliente.
- **cliente 1:N agendamento**: Um cliente pode realizar vários agendamentos, mas cada agendamento pertence a um único cliente.
- **veiculo 1:N agendamento**: Um veículo pode ter vários agendamentos, mas cada agendamento está associado a um único veículo.
- **servico 1:N agendamento**: Um serviço pode ser executado em vários agendamentos, mas cada agendamento se refere a um único serviço.

---

# DML e DQL - Manipulação e exbição dos dados
