  Table cliente { 
    id_cliente int [pk, increment] 
    nome varchar(100) [not null] 
    cpf char(11) [unique, not null] 
    numero_telefone varchar(20) [not null] 
    endereco char(100) [not null] 
  } 


  Table veiculo { 
    id_veiculo int [pk, increment] 
    id_cliente_ref int [not null, ref: > cliente.id_cliente] 
    placa char(7) [unique, not null] 
    renavam varchar(11) [unique, not null] 
    marca varchar(40) [not null] 
    modelo varchar(60) [not null] 
    cor varchar(30) [not null]  
    ano_fabricacao date [not null] 
  } 

 
  Table servico { 
    id_servico int [pk, increment] 
    nome varchar(80) [unique, not null] 
    descricao varchar(255)  
    duracao time 
    preco double [not null] 
  } 


  Table agendamento { 
    id_agendamento int [pk, increment] 
    id_cliente_ref int [not null, ref: > cliente.id_cliente] 
    id_veiculo_ref int [not null, ref: > veiculo.id_veiculo] 
    id_servico_ref int [not null, ref: > servico.id_servico] 
    data date [not null] 
    hora time [not null] 
    observacao varchar(255) 
    finalizado bool [not null] 
  } 