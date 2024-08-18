create database empresa_isabella;
use empresa_isabella;

create table empregado 
(
    matricula INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(35),
    cargo VARCHAR(25),
    datanasc DATE,
    salario numeric(10),
    comissao numeric(10), 
    chefe int,
    depto int
);

create table departamento 
(
    depto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(25),
    local VARCHAR(25),
    orcamento numeric(10,2)
);

create table gradeSalarios 
(
    grade INT AUTO_INCREMENT PRIMARY KEY,
    menorSalario numeric(10,2),
    maiorSalario numeric(10,2)
);


