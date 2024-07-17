/*
1. Criar um banco de daod schamado IFSP
2. Criar uma tabela 'cidade',
    com os seguintes campos: id(pk), nome, estado

3. criar uma tabela 'cliente',
    com os seguintes campos: id(pk), nome(nn), email,
    endereco, numero, bairro e data nascimento.
*/
CREATE DATABASE IFSP;
USE IFSP;


--Criação tabela "cidade"
CREATE TABLE cidade(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    estado VARCHAR(20) NOT NULL
       
);

CREATE TABLE cliente(
    id              INT AUTO_INCREMENT,
    nome            VARCHAR(50) NOT NULL,
    email           VARCHAR(50) NOT NULL,
    id_cidade       INT,
    endereco        VARCHAR(50) NOT NULL,
    numero          INT,
    bairro          VARCHAR(50) NOT NULL,
    data_nasc       DATETIME,
    PRIMARY KEY (id),
    CONSTRAINT fk_cliente_cidade
    FOREIGN KEY (id_cidade) REFERENCES cidade(id)
);

--Inserir dados na tabela cidade
INSERT INTO cidade (id, nome, estado) VALUES (1, 'Birigui', 'SP');
INSERT INTO cidade (id, nome, estado) VALUES (100, 'Araçatuba', 'SP');
INSERT INTO cidade (nome, estado) VALUES ('Guararapes', 'SP');
INSERT INTO cidade (nome) VALUES ('Rio de Janeiro');

--mostrra registros da tabela

SELECT * FROM cidade;

--inserir dados de tabela cliente
INSERT INTO cliente (nome, email, id_cidade, endereco, numero, bairro, data_nasc)
VALUES ('Murilo Silva', 'murilosilva@gmail.com', 100, 'rua Pedro Cavalo', 750, 'PORTAL DA PEROLA 2', '1999/01/15');

--mosrar registros de tabela cliente
SELECT * FROM cliente;

--ATUALIZAR TABELA CIDADE
UPDATE cidade SELECT
nome = 'Belo Horizonte',
estado = 'MG'
WHERE id = 1;

--ATUALIZAR TABELA cliente
UPDATE cidade SELECT
nome = 'cocao',
estado = 'cocao@mail.com'
id_cidade = 101
WHERE id = 2;

--deleta registro de uma tabela
DELETE FROM cidade WHERE id = 1;
