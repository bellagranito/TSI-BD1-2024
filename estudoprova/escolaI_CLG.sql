create database Escola_isabella;
use Escola_isabella;

create table departamento
(
    nome VARCHAR(35),
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    telefone numeric(11),
    centro VARCHAR(35)
);

create table aluno
(
    nome VARCHAR(35),
    matricula INT AUTO_INCREMENT PRIMARY KEY,
    CPF numeric(11),
    endereco varchar (35),
    telefones numeric(20),
    datanasc varchar(35),
    sexo varchar(10),
    departamento varchar(35) NOT NULL,
    curso varchar(10)
    FOREIGN KEY (departamento) REFERENCES departamento(codigo)
);