SELECT * FROM produtos;
SELECT * FROM clientes;
SELECT * FROM vendas;

SELECT
 SUM(v.quantidade * p.preco) AS faturamento_total
FROM produtos p
JOIN vendas v ON p.id_produto = v.id_venda;


SELECT 
p.nome,
p.quantidade_estoque,
v.id_usuario,
v.id_venda
FROM vendas v
INNER JOIN produtos p ON p.id_produto = v.id_produto
ORDER BY id_usuario;







-- clientes e vendas e produtos

SELECT 
    v.id_venda,
    c.nome AS clientes,
    p.nome AS produtos,
    v.id_venda AS vendas,
    p.categoria,
    p.marca,
    p.modelo,
    v.quantidade,
    p.preco,
    v.id_venda,
    (v.quantidade * p.preco) AS valor_total
FROM vendas v
LEFT JOIN clientes c ON v.id_usuario = c.id_cliente
LEFT JOIN produtos p ON v.id_produto = p.id_produto
ORDER BY v.id_venda;

-- total de vendas por clientes

SELECT
    c.id_cliente,
    c.nome AS cliente,
    SUM(v.quantidade) AS total_itens_comprados
FROM vendas v
JOIN clientes c ON v.id_usuario = c.id_cliente
GROUP BY c.id_cliente, c.nome
ORDER BY total_itens_comprados DESC;

-- total de vendas por produtos

SELECT
    p.id_produto,
    p.nome AS produto,
    SUM(v.quantidade) AS total_vendido
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.id_produto, p.nome
ORDER BY total_vendido DESC;

-- vendas detalhas com valores

SELECT
    v.id_venda,
    c.nome AS cliente,
    p.nome AS produto,
    v.quantidade,
    p.preco,
    (v.quantidade * p.preco) AS valor_total
FROM vendas v
JOIN clientes c ON v.id_usuario = c.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto
ORDER BY v.id_venda;

-- arrecadação

SELECT
    SUM(v.quantidade * p.preco) AS faturamento_total
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto;

-- produtos maius vendidos

SELECT
    p.nome AS produto,
    SUM(v.quantidade) AS total_vendido
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.nome
ORDER BY total_vendido DESC;




