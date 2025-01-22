consultas

SELECT p.*, pf.cpf 
FROM Pessoa p
INNER JOIN PessoaFisica pf ON p.id_pessoa = pf.id_pessoa;

dados pessoas juridicas

SELECT p.*, pj.cnpj 
FROM Pessoa p
INNER JOIN PessoaJuridica pj ON p.id_pessoa = pj.id_pessoa;


movimentações entrada

SELECT m.*, p.nome AS produto 
FROM Movimentacao m
INNER JOIN Produto p ON m.id_produto = p.id_produto
WHERE tipo = 'E';


movimentações saída

SELECT m.*, p.nome AS produto 
FROM Movimentacao m
INNER JOIN Produto p ON m.id_produto = p.id_produto
WHERE tipo = 'S';


Valor total das entradas por produto

SELECT p.nome, SUM(m.quantidade * m.preco_unitario) AS total
FROM Movimentacao m
INNER JOIN Produto p ON m.id_produto = p.id_produto
WHERE m.tipo = 'E'
GROUP BY p.nome;


Valor total das saídas por produto

SELECT p.nome, SUM(m.quantidade * m.preco_unitario) AS total
FROM Movimentacao m
INNER JOIN Produto p ON m.id_produto = p.id_produto
WHERE m.tipo = 'S'
GROUP BY p.nome;



Operadores que não efetuaram movimentações de entrada

SELECT u.username 
FROM Usuario u
WHERE u.id_usuario NOT IN (
    SELECT DISTINCT m.id_usuario 
    FROM Movimentacao m
    WHERE m.tipo = 'E'
);



Valor total de entrada, agrupado por operador:

SELECT u.username, SUM(m.quantidade * m.preco_unitario) AS total
FROM Movimentacao m
INNER JOIN Usuario u ON m.id_usuario = u.id_usuario
WHERE m.tipo = 'E'
GROUP BY u.username;

Valor médio de venda por produto (média ponderada)


SELECT p.nome, 
       SUM(m.quantidade * m.preco_unitario) / SUM(m.quantidade) AS preco_medio
FROM Movimentacao m
INNER JOIN Produto p ON m.id_produto = p.id_produto
WHERE m.tipo = 'S'
GROUP BY p.nome;

