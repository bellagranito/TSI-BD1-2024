-- DELETAR O BANCO
DROP DATABASE IF EXISTS correios;

-- CRIAÇÃO DO BANCO DE DADOS COM CONFIGURAÇÃO DE ACENTOS
 CREATE DATABASE correios
 DEFAULT CHARSET = utf8 
 DEFAULT COLLATE = utf8_general_ci;

 -- SELECIONAR O BANCO DE DADOS
 USE correios;

 -- CRIAÇÃO TABELA CIDADE
 CREATE TABLE caixa_postal
 (    
    codigo_postal VARCHAR(8)  NOT NULL,
    localidade          VARCHAR(45) NOT NULL,
    PRIMARY KEY (codigo_postal)
 );

 INSERT INTO caixa_postal (codigo_postal, localidade)
 VALUES (17830000, 'Adamantina');

 INSERT INTO caixa_postal (codigo_postal, localidade)
 VALUES (16204278, 'Birigui');

 INSERT INTO caixa_postal (codigo_postal, localidade)
 VALUES (17800000, 'Guararapes');

 CREATE TABLE pessoa
 (    
    codigo        INT NOT NULL AUTO_INCREMENT,
    cpf           VARCHAR(11) NOT NULL UNIQUE,
    nome          VARCHAR(60) NOT NULL, 
    idade         INT CHECK (idade > 0),
    codigo_postal VARCHAR(8) NOT NULL,    
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo_postal) REFERENCES caixa_postal (codigo_postal)
 );

INSERT INTO pessoa (nome, cpf, idade, codigo_postal)
VALUES('Murilo Silva','123.123.123-87', 39, 17830000);

INSERT INTO pessoa (nome, cpf, idade, codigo_postal)
VALUES('Cassio Stersi','311.123.123-87', 45, 16204278);

INSERT INTO pessoa (nome, cpf, idade, codigo_postal)
VALUES('Valtemir Neto Stersi','111.123.123-87', 49, 17800000);


CREATE TABLE telefone
(    
    codigo           INT NOT NULL,
    tel_residencial  VARCHAR(15),
    tel_celular      VARCHAR(15),
    tel_comercial    VARCHAR(15),
    tel_recado       VARCHAR(15) NOT NULL,
    PRIMARY KEY (codigo),
    FOREIGN KEY (codigo) REFERENCES pessoa (codigo)
);

INSERT INTO telefone (codigo, tel_residencial, tel_celular, 
    tel_comercial, tel_recado)
VALUES (1, null, '(18) 3622-9046', '(99) 9999-9999','(99) 9999-9999') ;


INSERT INTO telefone (codigo, tel_residencial, tel_celular, 
    tel_comercial, tel_recado)
VALUES (2,  '(99) 9999-9999', '(18) 3622-9046', null, '(99) 9999-9999') ;

INSERT INTO telefone (codigo, tel_residencial, tel_celular, 
    tel_comercial, tel_recado)
VALUES (3, '(99) 9999-9999', '(18) 3622-9046', null,'(99) 9999-9999') ;