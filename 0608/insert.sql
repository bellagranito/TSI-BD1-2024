-- CIDADES
INSERT INTO cidade (nome, estado) VALUES ('Araçatuba', 'SP');
INSERT INTO cidade (nome, estado) VALUES ('Birigui', 'SP');
INSERT INTO cidade (nome, estado) VALUES ('Belo Horizonte', 'MG');

-- CLIENTES
INSERT INTO cliente (nome, telefone, endereco, numero, bairro, idcidade)
VALUES ('Eduardo Silva', '(18) 998512-2555', 'Rua Pedro Cavalo','55', 'Centro', 2);
INSERT INTO cliente (nome, telefone, endereco, numero, bairro, idcidade)
VALUES ('Murilo Sauro', '(18) 08100-8588', 'Rua Sem Saída','105', 'Portal', 1);
INSERT INTO cliente (nome, telefone, endereco, numero, bairro, idcidade)
VALUES ('Pedro Bonini', '(18) 08100-8588', 'Rua Valtão','105', 'Portal', 3);

-- FORNECEDORES
INSERT INTO fornecedor (nome, telefone, endereco, numero, bairro, idcidade)
VALUES ('Coca Cola do Brasil', '(11) 998512-2555', 'Avenida Paulista','55', 'Centro', 3);
INSERT INTO fornecedor (nome, telefone, endereco, numero, bairro, idcidade)
VALUES ('Heineken Cervejaria', '(21) 08100-8588', 'Rua Sem Saída','4778', 'Moema', 1);
INSERT INTO fornecedor (nome, telefone, endereco, numero, bairro, idcidade)
VALUES ('GM do Brasil', '(21) 08100-8588', 'Rua consolação','111', 'Centro', 2);

-- CARROS 
INSERT INTO carro (marca, modelo, placa, km) VALUES ('Fiat', 'Toro', 'ABC1234', 55123);
INSERT INTO carro (marca, modelo, placa, km) VALUES ('Jeep', 'Renegade', 'CYO8524', 10055);
INSERT INTO carro (marca, modelo, placa, km) VALUES ('GM', 'Onix', 'ERT8745', 55);
INSERT INTO carro (marca, modelo, placa, km) VALUES ('FORD', 'Ka', 'TUY8456', 0);

-- CARGOS
INSERT INTO cargo (descricao, salario) VALUES ('Vendedor', 3500);
INSERT INTO cargo (descricao, salario) VALUES ('Gerente', 15000);
INSERT INTO cargo (descricao, salario) VALUES ('Mecanico', 4500);
INSERT INTO cargo (descricao, salario) VALUES ('Serviços Gerais', 1500);
INSERT INTO cargo (descricao, salario) VALUES ('Contador', 9000);

-- FUNCIONARIOS
INSERT INTO funcionario (nome, telefone, endereco, numero, bairro, idcidade, dataadmissao, datademissao, idcargo)
VALUES ('Manoel Cardoso', '(11) 98512-2555', 'Avenida Paulista','55', 'Centro', 1, '2024-01-01', null, 3);
INSERT INTO funcionario (nome, telefone, endereco, numero, bairro, idcidade, dataadmissao, datademissao, idcargo)
VALUES ('Eduardo Shigueo', '(18) 98512-2555', 'Rua Brasil','1234', 'Centro', 2, '2020-07-10', null, 1);
INSERT INTO funcionario (nome, telefone, endereco, numero, bairro, idcidade, dataadmissao, datademissao, idcargo)
VALUES ('Cassio Stersi', '(18) 98512-2555', 'Avenida sumaré','66', 'Centro', 3, '2018-07-10', '2024-07-01', 4);
INSERT INTO funcionario (nome, telefone, endereco, numero, bairro, idcidade, dataadmissao, datademissao, idcargo)
VALUES ('Jair Bolsonaro', '(12) 98512-2555', 'Avenida sumaré','66', 'Centro', 3, '2019-01-01', '2023-12-31', 2);

-- CONTAS A PAGAR
INSERT INTO contapagar (dataemissao, idfornecedor, valor, datapgto, situacao)
VALUES ('2024-01-01', 1, 1500.55, null, 'Aberto');
INSERT INTO contapagar (dataemissao, idfornecedor, valor, datapgto, situacao)
VALUES ('2024-01-01', 2, 879.33, '2024-07-13', 'Pago');
INSERT INTO contapagar (dataemissao, idfornecedor, valor, datapgto, situacao)
VALUES ('2024-03-12', 3, 965.15, '2024-07-13', 'Pago');
INSERT INTO contapagar (dataemissao, idfornecedor, valor, datapgto, situacao)
VALUES ('2024-05-03', 2, 489.55, null, 'Aberto');

-- CONTAS A RECEBER
INSERT INTO contareceber (dataemissao, idcliente, valor, datapgto, situacao)
VALUES ('2024-01-01', 2, 875.21, null, 'Aberto');
INSERT INTO contareceber (dataemissao, idcliente, valor, datapgto, situacao)
VALUES ('2024-01-01', 1, 8578.00, '2024-05-13', 'Pago');
INSERT INTO contareceber (dataemissao, idcliente, valor, datapgto, situacao)
VALUES ('2024-03-12', 3, 456.15, '2024-08-18', 'Pago');
INSERT INTO contareceber (dataemissao, idcliente, valor, datapgto, situacao)
VALUES ('2024-05-03', 1, 88.89, null, 'Aberto');

-- PRODUTOS
INSERT INTO produto (descricao, precovenda, estoque) VALUES ('Coca cola', 10.55 , 150);
INSERT INTO produto (descricao, precovenda, estoque) VALUES ('Heineken 600 ml', 18.00 , 450);
INSERT INTO produto (descricao, precovenda, estoque) VALUES ('Arroz Solito', 10.55 , 780);
INSERT INTO produto (descricao, precovenda, estoque) VALUES ('Picanha', 55.00 , 8548);

-- VENDA E VENDA PRODUTO
-- VENDA 01
INSERT INTO VENDA (datavenda, idcliente, idfuncionario, situacao) VALUES ('2024-03-21', 1, 1, 'Faturada');
INSERT INTO vendaproduto (idvenda, idproduto, quantidade) VALUES (1,1,10);
INSERT INTO vendaproduto (idvenda, idproduto, quantidade) VALUES (1,2,5);
INSERT INTO vendaproduto (idvenda, idproduto, quantidade) VALUES (1,2,2);

-- VENDA 02
INSERT INTO VENDA (datavenda, idcliente, idfuncionario, situacao) VALUES ('2024-01-10', 3, 2, 'Faturada');
INSERT INTO vendaproduto (idvenda, idproduto, quantidade) VALUES (2,3,10);
INSERT INTO vendaproduto (idvenda, idproduto, quantidade) VALUES (2,2,5);
INSERT INTO vendaproduto (idvenda, idproduto, quantidade) VALUES (2,1,55);

-- VENDA 03
INSERT INTO VENDA (datavenda, idcliente, idfuncionario, situacao) VALUES ('2024-07-13', 3, 2, 'Faturada');
INSERT INTO vendaproduto (idvenda, idproduto, quantidade) VALUES (3,3,10);
INSERT INTO vendaproduto (idvenda, idproduto, quantidade) VALUES (3,2,5);
INSERT INTO vendaproduto (idvenda, idproduto, quantidade) VALUES (3,1,55);
INSERT INTO vendaproduto (idvenda, idproduto, quantidade) VALUES (3,4,1);

-- nome funcionario, cargo e salario

SELECT f.nome, c.descricao, c.salario
FROM funcionario f, cargo c, cidade ci
WHERE f.idcargo = c.idcargo
 and f.idcidade = ci.idcidade;
