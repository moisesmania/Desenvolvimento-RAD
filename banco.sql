CREATE DATABASE Prova;
USE Prova;

CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    idade INT
);

INSERT INTO alunos(nome,email,telefone,idade)
VALUES
('João Silva','joao@email.com','84999999999',20),
('Maria Souza','maria@email.com','84988888888',22);