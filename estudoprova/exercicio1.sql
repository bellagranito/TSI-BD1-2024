create database revisao1;

use revisao1;

create table cidade
(
idCidade int not null,
nome varchar(50),
primary key (idCidade));
create table fornecedor(
cnpj varchar(14) not null,
razaoSocial varchar(50),
endereco varchar(20),
idCidade int,
primary key(cnpj),
foreign key (idCidade) references cidade (idCidade)
);

create table cliente
(
codigo int not null,
nome varchar(50),
endereco varchar(20),
idCidade int,
primary key(codigo),
foreign key (idCidade) references cidade(idCidade)
);

create table produto
(
codigo int not null,
descricao varchar(50),
estoque int,
valor real,
cnpjFornecedor varchar(14),
primary key(codigo),
foreign key(cnpjFornecedor)references fornecedor(cnpj)
);

create table nota
(
numero int not null,
data date,
tipo_pagamento varchar(10),
codigoCliente int,
primary key(numero),
foreign key(codigoCliente) references cliente(codigo)
);

create table item
(
numero_nota int,
codigo_produto int,
qtde int,
primary key(numero_nota,codigo_produto),
foreign key(numero_nota)references nota(numero),
foreign key(codigo_produto)references produto(codigo)
);

-- inserindo no banco
insert into cidade values(1,'Marilia');
insert into cidade values(2,'Bauru');
insert into cidade values(3,'Birigui');

insert into fornecedor values("17624092000185","Alpha Soluções em Informática","Rua 9
deJulho, 738",1);
insert into fornecedor values("47132482000176","MicroSystem Informática","Av. da
Saudade, 98",2);
insert into fornecedor values("56021482000112","J.W. Sistemas","Rua Paes Leme, 172",1);
insert into fornecedor values("27385372000136","ADABAS S/A","Rua 9 de Julho, 829",1);

insert into Cliente values(1,"Francisco Santos","Rua XV de Novembro, 16",null);
insert into Cliente values(2,"Claudete Pereira","Av. da Saudade, 98",null);
insert into Cliente values(3,"José Souza","Rua das Bromélias, 871",null);
insert into Cliente values(4,"Sônia Santos Oliveira ","Rua 9 de Julho, 829",2);

insert into produto values(100,"Micro Pentium IV",14,850.00,"56021482000112");
insert into produto values(200,"Impressora EPSON", 8,280.00,"27385372000136");
insert into produto values(300,"Scanner Genius", 9,190.00,null);
insert into produto values(400,"Disquete 3M", 30,10.00,"17624092000185");

insert into nota values(1001,'2002-05-18',"a vista",2);
insert into nota values(1002,"2002-05-18","a vista", null);
insert into nota values(1003,"2002-05-19","a prazo", 4);
insert into nota values(1004,"2002-05-20","a vista", 3);

insert into item values(1001, 100, 1);
insert into item values(1001, 400, 5);
insert into item values(1002, 200, 1);
insert into item values(1003, 300, 1);
insert into item values(1004, 200, 2);
insert into item values(1004, 300, 1);

-- A) Apresentar os fornecedores cadastrados, incluindo a cidade. (apresentar as 2 formas)
-- forma 1
SELECT 
    f.cnpj, 
    f.razaoSocial, 
    f.endereco, 
    c.nome AS cidade
FROM 
    fornecedor f
JOIN 
    cidade c ON f.idCidade = c.idCidade;

-- forma 2
SELECT 
    f.cnpj, 
    f.razaoSocial, 
    f.endereco, 
    (SELECT c.nome FROM cidade c WHERE c.idCidade = f.idCidade) AS cidade
FROM 
    fornecedor f;



-- B)Apresentar todos os clientes com suas cidades. Na consulta deve aparecer os clientes que não possuem cidade também.
SELECT 
    c.codigo, 
    c.nome, 
    c.endereco, 
    ci.nome AS cidade
FROM 
    cliente c
LEFT JOIN 
    cidade ci ON c.idCidade = ci.idCidade;

-- Apresentar todos os clientes com suas cidades que possuem ‘Santos’ no seu nome. Na consulta deve aparecer os clientes que não possuem cidade também.
SELECT 
    c.codigo, 
    c.nome, 
    c.endereco, 
    ci.nome AS cidade
FROM 
    cliente c
LEFT JOIN 
    cidade ci ON c.idCidade = ci.idCidade
WHERE 
    c.nome LIKE '%Santos%';

-- Faça uma consulta que mostre a descrição e o estoque do produto e o nome do fornecedor do produto. (apresentar as 2 formas).

--forma 1
SELECT 
    p.descricao, 
    p.estoque, 
    f.razaoSocial AS nome_fornecedor
FROM 
    produto p
JOIN 
    fornecedor f ON p.cnpjFornecedor = f.cnpj;

-- forma 2
SELECT 
    p.descricao, 
    p.estoque, 
    (SELECT f.razaoSocial FROM fornecedor f WHERE f.cnpj = p.cnpjFornecedor) AS nome_fornecedor
FROM 
    produto p;

--Faça uma consulta que mostre a descrição e o estoque do produto e o nome do fornecedor do produto, trazer também os produtos que não possuem o fornecedor.
SELECT 
    p.descricao, 
    p.estoque, 
    f.razaoSocial AS nome_fornecedor
FROM 
    produto p
LEFT JOIN 
    fornecedor f ON p.cnpjFornecedor = f.cnpj;



--Faça uma consulta que mostra o número, data, valor da nota e o nome do cliente de todas as notas. (apresentar as 2 formas)
SELECT 
    n.numero, 
    n.data, 
    n.tipo_pagamento,
    c.nome AS nome_cliente
FROM 
    nota n
JOIN 
    cliente c ON n.codigoCliente = c.codigo;


--Faça uma consulta que mostre o nome do cliente e a soma das notas desse cliente. (usar o join)
SELECT 
    c.nome AS nome_cliente, 
    COUNT(n.numero) AS soma_notas
FROM 
    cliente c
JOIN 
    nota n ON c.codigo = n.codigoCliente
GROUP BY 
    c.nome;


--Faça uma consulta que mostre os fornecedores que tenham produtos com estoque maior ou igual a 9. (apresentar as 2 formas)
SELECT DISTINCT
    f.cnpj,
    f.razaoSocial,
    f.endereco,
    f.idCidade
FROM 
    fornecedor f
WHERE 
    f.cnpj IN (
        SELECT 
            p.cnpjFornecedor
        FROM 
            produto p
        WHERE 
            p.estoque >= 9
    );



--Faça uma consulta que mostre o valor total das notas por tipo de pagamento.

SELECT 
    n.tipo_pagamento,
    SUM(i.qtde * p.valor) AS total_valor
FROM 
    nota n
JOIN 
    item i ON n.numero = i.numero_nota
JOIN 
    produto p ON i.codigo_produto = p.codigo
GROUP BY 
    n.tipo_pagamento;



