-- Criação do banco de dados
CREATE DATABASE LojaDB;
GO
USE LojaDB;
GO

-- Tabela Pessoa
CREATE TABLE Pessoa (
    id_pessoa INT PRIMARY KEY,
    nome NVARCHAR(100),
    endereco NVARCHAR(200),
    contato NVARCHAR(100),
    tipo CHAR(1) -- F para Física, J para Jurídica
);

-- Tabela Pessoa Física
CREATE TABLE PessoaFisica (
    id_pessoa INT PRIMARY KEY,
    cpf CHAR(11),
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa)
);

-- Tabela Pessoa Jurídica
CREATE TABLE PessoaJuridica (
    id_pessoa INT PRIMARY KEY,
    cnpj CHAR(14),
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa)
);

-- Tabela Usuário
CREATE TABLE Usuario (
    id_usuario INT IDENTITY PRIMARY KEY,
    username NVARCHAR(50),
    senha NVARCHAR(50)
);

-- Tabela Produto
CREATE TABLE Produto (
    id_produto INT IDENTITY PRIMARY KEY,
    nome NVARCHAR(100),
    quantidade INT,
    preco_venda DECIMAL(10, 2)
);

-- Tabela Movimentação
CREATE TABLE Movimentacao (
    id_movimentacao INT IDENTITY PRIMARY KEY,
    tipo CHAR(1), -- E para entrada, S para saída
    id_usuario INT,
    id_produto INT,
    quantidade INT,
    preco_unitario DECIMAL(10, 2),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);
GO


