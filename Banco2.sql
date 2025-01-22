-- Criação da sequência para ID de pessoas
CREATE SEQUENCE seq_pessoa AS INT START WITH 1 INCREMENT BY 1;

-- Inserção de Usuários
INSERT INTO Usuario (username, senha) VALUES ('op1', 'op1'), ('op2', 'op2');

-- Inserção de Produtos
INSERT INTO Produto (nome, quantidade, preco_venda) 
VALUES ('Produto A', 100, 10.00), ('Produto B', 50, 20.00);

-- Inserção de Pessoas
-- Pessoa Física
INSERT INTO Pessoa (id_pessoa, nome, endereco, contato, tipo)
VALUES (NEXT VALUE FOR seq_pessoa, 'João Silva', 'Rua A', '123456789', 'F');
INSERT INTO PessoaFisica (id_pessoa, cpf) VALUES (1, '12345678901');

-- Pessoa Jurídica
INSERT INTO Pessoa (id_pessoa, nome, endereco, contato, tipo)
VALUES (NEXT VALUE FOR seq_pessoa, 'Empresa XYZ', 'Rua B', '987654321', 'J');
INSERT INTO PessoaJuridica (id_pessoa, cnpj) VALUES (2, '12345678000199');

-- Inserção de Movimentações
-- Entrada (Compra)
INSERT INTO Movimentacao (tipo, id_usuario, id_produto, quantidade, preco_unitario)
VALUES ('E', 1, 1, 10, 8.00);

-- Saída (Venda)
INSERT INTO Movimentacao (tipo, id_usuario, id_produto, quantidade, preco_unitario)
VALUES ('S', 2, 1, 5, 10.00);
