/* 1) Você foi contratado para montar um banco de dados em uma loja. Criar um banco chamado Mercado_SeuNome
Tabela Fornecedor
Campos                  Tipo        Chave primária          Característica
Codigo_fornec           Inteiro         Sim                     não nulo
Nome                    Texto[40]       não                     nulo
Fone                    Texto[20]
Endereco                Texto[40]
Cidade                  Texto[30]                           valor padrão Birigui
Estado                  Texto[2]                            valor padrão SP


Tabela Produto
Campos                  Tipo            Chave primária      Chave Estrangeira           Caracteristica


Cod_produto             inteiro             Sim                                     auto-incremento, não nulo

Nome                    Texto[40]                                                           não nulo

Cod_fornecedor          Inteiro                                     Sim                     não nulo

preço_unitario          Numérico(10,2)
qtde                    Inteiro
*/


create database mercado_mariaLuiza;
use mercado_mariaLuiza;

create table tabela_fornecedor (
    codigo_fornec   INT  NOT NULL,
    nome            VARCHAR(60) NOT NULL, 
    fone            VARCHAR(20),
    endereco        VARCHAR(40),
    cidade          VARCHAR(30) DEFAULT 'Birigui',
    estado          VARCHAR(2) DEFAULT 'SP',
    PRIMARY KEY (codigo_fornec)
);

create table Produto(
    cod_produto         INT NOT NULL AUTO_INCREMENT,
    nome                VARCHAR(60) NOT NULL,
    codigo_fornec  INT NOT NULL,
    preco_unitario      NUMERIC(10,2),
    qtde                INT,
    PRIMARY KEY (cod_produto),
    FOREIGN KEY (codigo_fornec) REFERENCES tabela_fornecedor (codigo_fornec)
);

show tables;
describe tabela_fornecedor;
describe Produto;

INSERT INTO tabela_fornecedor (codigo_fornec, nome, fone, endereco, cidade, estado)
VALUES('344', 'Alimentos do bem', '3345666', 'Rua Fundadores', 'São Paulo', 'SP');

INSERT INTO tabela_fornecedor (codigo_fornec, nome, fone, endereco, cidade, estado)
VALUES('78', 'Comidas', '8664545', 'Av dos Estados', 'Araçatuba', 'SP');

INSERT INTO tabela_fornecedor (codigo_fornec, nome, fone, endereco, cidade, estado)
VALUES('952', 'Rango Quente', '1327790', 'Rua Aclimação', 'Birigui', 'SP');

INSERT INTO tabela_fornecedor (codigo_fornec, nome, fone, endereco, cidade, estado)
VALUES('111', 'Queninhas', '5644234', 'Rua Teste', 'Belo Horizonte', 'MG');

describe tabela_fornecedor;

SELECT * FROM tabela_fornecedor;

INSERT INTO Produto (cod_produto, nome, codigo_fornec, preco_unitario, qtde)
VALUES('1', 'Arroz', '344', '20', '55');

INSERT INTO Produto (cod_produto, nome, codigo_fornec, preco_unitario, qtde)
VALUES('2', 'Feijao', '78', '16.5', '60');

INSERT INTO Produto (cod_produto, nome, codigo_fornec, preco_unitario, qtde)
VALUES('3', 'Macarrao', '78', '5', '15');

INSERT INTO Produto (cod_produto, nome, codigo_fornec, preco_unitario, qtde)
VALUES('4', 'Leite', '344', '3.5', '20');

INSERT INTO Produto (cod_produto, nome, codigo_fornec, preco_unitario, qtde)
VALUES('5', 'Farinha', '952', '5', '8');

SELECT * FROM Produto;
