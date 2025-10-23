-- Tabela de Clientes:
-- INSERTS: adicionando clientes a nossa tabela cliente
INSERT INTO cliente (nome, cpf, numero_telefone, endereco) VALUES ('Ana Silva', '43322964000', '11987654321', 'Rua A, 10');
INSERT INTO cliente (nome, cpf, numero_telefone, endereco) VALUES ('Bruno Costa', '35901670094', '14912345678', 'Av. B, 20');
INSERT INTO cliente (nome, cpf, numero_telefone, endereco) VALUES ('Carla Dias', '40620357070', '21955554444', 'Travessa C, 30');

-- SELECTS: consultas para visualizar os registros da tabela cliente.
	-- No primeiro caso, exibe toda a tabela.
	-- No segundo, exibe o nome e CPF do cliente caso o seu id seja igual a 1.
	-- No terceiro, exibe os clientes cujo nome começe com "Bruno".
SELECT * FROM cliente;
SELECT nome, cpf FROM cliente WHERE id_cliente = 1;
SELECT * FROM cliente WHERE nome LIKE 'Bruno%';

-- UPDATES: atualizando alguns clientes quando uma condição for verdadeira.
	-- No primeiro o telefone é atualizado caso o seu cpf seja igual a "43322964000".
	-- No segundo o endereço é atualizado caso o seu id seja igual a 2.
	-- No terceiro o nome é alterado para "Carla Dias Souza" caso se o nome for igual a "Carla Dias".
UPDATE cliente SET numero_telefone = '11999998888' WHERE cpf = '43322964000';
UPDATE cliente SET endereco = 'Av. B, 25 (Apto 1)' WHERE id_cliente = 2;
UPDATE cliente SET nome = 'Carla Dias Souza' WHERE nome = 'Carla Dias';

-- DELETE: deletando o cliente quando o seu id for igual a 3.
DELETE FROM cliente WHERE id_cliente = 3;


-- Tabela de Veículos
-- INSERTS: adicionando veículos à tabela veiculo.
INSERT INTO veiculo (id_cliente_ref, placa, renavam, marca, modelo, cor, ano_fabricacao)
VALUES (1, 'KLE8287', '38186947370', 'Fiat', 'Palio', 'Prata', '1998-01-01');
INSERT INTO veiculo (id_cliente_ref, placa, renavam, marca, modelo, cor, ano_fabricacao)
VALUES (2, 'JPU4750', '38563661752', 'Chevrolet', 'TRACKER', 'Preto', '2014-01-01');
INSERT INTO veiculo (id_cliente_ref, placa, renavam, marca, modelo, cor, ano_fabricacao)
VALUES (1, 'KIA0455', '86364448501', 'VolksWagen', 'Parati', 'Azul', '2005-01-01');

-- SELECTS: consultas para visualizar os registros da tabela veiculo.
	-- No primeiro caso, exibe todos os veículos cadastrados.
	-- No segundo, exibe placa, marca e modelo dos veículos caso o seu id do cliente seja igual a  1.
	-- No terceiro, exibe o veículo caso a placa seja igual a "JPU4750".
SELECT * FROM veiculo;
SELECT placa, marca, modelo FROM veiculo WHERE id_cliente_ref = 1;
SELECT * FROM veiculo WHERE placa = 'JPU4750';

-- UPDATES: atualizando informações dos veículos quando as condições são verdadeiras.
	-- O primeiro altera a cor do veículo caso o seu id seja igual a 1.
	-- O segundo altera o modelo do veículo caso o a placa seja igual a "JPU4750".
	-- O terceiro altera o ano de fabricação do veículo caso o seu id seja igual a 3.
UPDATE veiculo SET cor = 'Prata Metálico' WHERE id_veiculo = 1;
UPDATE veiculo SET modelo = 'Astra Hatch' WHERE placa = 'JPU4750';
UPDATE veiculo SET ano_fabricacao = '1985-03-15' WHERE id_veiculo = 3;

-- DELETE: deletando um veiculo caso o seu id seja igual a 3.
DELETE FROM veiculo WHERE id_veiculo = 3;


-- Tabela de Serviços:
-- INSERTS: adicionando serviços à tabela servico.
INSERT INTO servico (nome, descricao, duracao, preco)
VALUES ('Troca de Óleo e Filtro', 'Troca de óleo sintético 15W40 + filtro de óleo', '00:30:00', 160.00);
INSERT INTO servico (nome, descricao, duracao, preco)
VALUES ('Alinhamento e Balanceamento', 'Alinhamento e balanceamento das 4 rodas', '01:30:00', 120.50);
INSERT INTO servico (nome, descricao, duracao, preco)
VALUES ('Troca de Pastilhas de Freio', 'Substituição das pastilhas de freio dianteiras', '01:20:00', 350.00);

-- SELECTS: exibindo registros da tabela servico.
	-- O primeiro irá exibir todos os serviços que estão cadastrados.
	-- O segundo irá mostrar o nome e preço dos serviços caso o valor seja acima de 130.
	-- O terceiro irá mostrar o serviço quando o nome for igual a “Alinhamento e Balanceamento”.
SELECT * FROM servico;
SELECT nome, preco FROM servico WHERE preco > 130.00;
SELECT * FROM servico WHERE nome = 'Alinhamento e Balanceamento';

-- UPDATES: atualizando registros da tabela servico.
	-- O primeiro altera o preço caso o seu o nome seja igual a "Troca de Óleo e Filtro".
	-- O segundo altera a descrição do serviço caso o seu id seja igual a 2.
	-- O terceiro ajusta a duração do serviço caso o seu id seja igual a 3.
UPDATE servico SET preco = 165.00 WHERE nome = 'Troca de Óleo e Filtro';
UPDATE servico SET descricao = 'Alinhamento e balanceamento (rodas aro 13-15)' WHERE id_servico = 2;
UPDATE servico SET duracao = '01:15:00' WHERE id_servico = 3;

-- DELETE: deletando um servico caso o seu id seja igual a 3.
DELETE FROM servico WHERE id_servico = 3;


-- Tabela de Agendamentos:
-- INSERTS: adicionando novos agendamentos à tabela agendamento.
INSERT INTO agendamento (id_cliente_ref, id_veiculo_ref, id_servico_ref, data, hora, observacao, finalizado)
VALUES (1, 1, 1, '2025-10-23', '09:00:00', 'Carro com risco na lateral.', FALSE);
INSERT INTO agendamento (id_cliente_ref, id_veiculo_ref, id_servico_ref, data, hora, observacao, finalizado)
VALUES (2, 2, 2, '2025-10-23', '10:30:00', 'Verificar desgaste do pneu dianteiro esquerdo.', FALSE);
INSERT INTO agendamento (id_cliente_ref, id_veiculo_ref, id_servico_ref, data, hora, observacao, finalizado)
VALUES (1, 1, 2, '2025-10-24', '14:00:00', '', FALSE);

-- SELECTS: consultas para visualizar os agendamentos.
	-- O primeiro irá exibir todos os agendamentos.
	-- O segundo vai mostrar os agendamentos caso sejam do dia 23/10/2025, e irá ordená-los por hora.
	-- O terceiro exibe os agendamentos que ainda não foram finalizados.
SELECT * FROM agendamento;
SELECT * FROM agendamento WHERE data = '2025-10-23' ORDER BY hora;
SELECT * FROM agendamento WHERE finalizado = FALSE;

-- UPDATES: atualizando agendamentos existentes.
	-- O primeiro marca o agendamento concluído caso o id seja igual a 1.
	-- O segundo altera o horário e adiciona observações no agendamento caso o id seja igual a 2.
	-- O terceiro muda a data do agendamento caso o id seja igual a 3.
UPDATE agendamento SET finalizado = TRUE WHERE id_agendamento = 1;
UPDATE agendamento SET hora = '11:00:00', observacao = 'Trocar Pneu, cliente permitiu a troca. Horário reagendado.' WHERE id_agendamento = 2;
UPDATE agendamento SET data = '2025-11-20' WHERE id_agendamento = 3;

-- DELETE: deletando um agendamento caso o seu id seja igual a 3.
DELETE FROM agendamento WHERE id_agendamento = 3;