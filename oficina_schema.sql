-- Tabela de Clientes:
	-- id_cliente: vai ser a PK, para identificar ele dentro da nossa tabela,
	-- que vai ser incrementado automaticamente a cada inserção.
	-- nome: não pode ser vazio, pois e um dado necessário para identificação dos
	-- clientes.
	-- cpf: não pode ser usado como uma PK, pois apesar de ser único, é um dado
	-- sensível, tendo que ter um cuidado. Além disso não pode ser vazio, pois
	-- é reponsável por diferenciar duas pessoas em caso de nome iguais.
	-- numero_telefone: não pode ser vazio, pois serve para entrar em contato com
	-- cliente.
	-- endereco: não pode ser vazio, pois serve para encontrar a cas do cliente,
	-- em caso de deixar o veículo na residência.
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    numero_telefone VARCHAR(20) NOT NULL,
    endereco CHAR(100) NOT NULL
);

-- Tabela de Veículos:
	-- id_veiculo: vai ser a PK, para identificar cada veículo na tabela, sendo
	-- incrementando automaticamente a cada inserção.
	-- id_cliente_ref: campo que indica o id de quem é dono do veículo, no caso esse
	-- id e da tabela cliente, não podendo ser vazio.
	-- placa: dado único de cada veículo, sendo obrigatório, pois ajuda na identifica
    -- o veículo.
	-- renavam: dado único de cada veículo, sendo obrigatório, pois é um registro 
    -- único para os veículo "um cpf para os carros".
	-- marca: não pode ser vazia, pois define o fabricante do veículo, ajudando a
    -- identificar o veículo.
	-- modelo: não pode ser vazio, pois diferencia o tipo do veículo dentro da marca.
	-- cor: não pode ser vazia, pois é uma característica visual do veículo.
	-- ano_fabricacao: armazena o ano de fabricação do veículo, sendo obrigatório,
    -- pois veículos podem ser diferente devido o ano de fabricação, mesmo sendo o
    -- mesmo modelo.
CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente_ref INT NOT NULL,
    placa CHAR(7) UNIQUE NOT NULL,
    renavam VARCHAR(11) UNIQUE NOT NULL,
    marca VARCHAR(40) NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    cor VARCHAR(30) NOT NULL,
    ano_fabricacao DATE NOT NULL
);

-- Tabela de Serviços:
	-- id_servico: vai ser a PK, usada para identificar cada tipo de serviço oferecido.
	-- nome: deve ser único e obrigatório, pois define o nome do serviço no catálogo.
	-- descricao: detalha o serviço que vai ser realizado.
	-- duracao: indica o tempo médio estimado de execução do serviço.
	-- preco: deve ser maior que zero, pois representa o valor cobrado pelo serviço,
    -- e não pode ser um valor vazio.
CREATE TABLE servico (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) UNIQUE NOT NULL,
    descricao VARCHAR(255),
    duracao TIME,
    preco DOUBLE NOT NULL CHECK (preco > 0)
);

-- Tabela de Agendamentos:
	-- id_agendamento: vai ser a  PK, identificando cada agendamento na 
    -- tabela de agenda da oficina.
	-- id_cliente_ref: referencia ao id do cliente que realizou o agendamento,
    -- da tabela de cliente, não podendo ser vazio.
	-- id_veiculo_ref: referencia ao id do veículo que será atendido,
    -- da tabela de veiculo, não podendo ser vazio.
	-- id_servico_ref: referencia ao id de serviço que será executado,
    -- da tabela de serviço, não podendo ser vazio.
	-- data: data marcada para a realização do serviço, não podendo ser vazio.
	-- hora: horário agendado para o início do atendimento, não podendo ser vazio.
	-- observacao: comentários adicionais sobre o serviço e/ou observações do veículo.
	-- finalizado: indica se o serviço já foi concluído, não podendo ser vazio..
CREATE TABLE agendamento (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente_ref INT NOT NULL,
    id_veiculo_ref INT NOT NULL,
    id_servico_ref INT NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    observacao VARCHAR(255),
    finalizado BOOLEAN NOT NULL
);

-- Relações de Cardinalidade: 
-- cliente 1:N veiculo: Um cliente pode possuir vários veículos, mas cada 
-- veículo pertence a um único cliente.
-- cliente 1:N agendamento: Um cliente pode realizar vários agendamentos, mas 
-- cada agendamento pertence a um único cliente.
-- veiculo 1:N agendamento: Um veículo pode ter vários agendamentos, mas cada 
-- agendamento está associado a um único veículo.
-- servico 1:N agendamento: Um serviço pode ser executado em vários agendamentos, mas cada agendamento se refere a um único serviço.
