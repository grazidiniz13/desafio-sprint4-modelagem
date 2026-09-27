-- Consulta 1: Buscar todos os pedidos de um determinado cliente fazendo JOIN com clientes
-- Analisa se o SGBD utiliza os índices criados nas chaves estrangeiras e no email
EXPLAIN ANALYZE
SELECT p.pedido_id, p.data_pedido, p.status, c.nome, c.email
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.cliente_id
WHERE c.email = 'carlos.eduardo@email.com';

-- Consulta 2: Listar itens de um pedido específico com detalhes do produto
EXPLAIN ANALYZE
SELECT ip.item_id, pr.nome_produto, ip.quantidade, ip.preco_unitario
FROM itens_pedido ip
JOIN produtos pr ON ip.produto_id = pr.produto_id
WHERE ip.pedido_id = 2;