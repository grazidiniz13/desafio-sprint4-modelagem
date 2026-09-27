-- Índice na FK de pedidos para acelerar buscas de pedidos por cliente
CREATE INDEX idx_pedidos_cliente_id ON pedidos(cliente_id);

-- Índices na tabela associativa itens_pedido para agilizar JOINs entre pedidos e produtos
CREATE INDEX idx_itens_pedido_pedido_id ON itens_pedido(pedido_id);
CREATE INDEX idx_itens_pedido_produto_id ON itens_pedido(produto_id);

-- Índice para otimizar buscas e filtros baseados no status dos pedidos
CREATE INDEX idx_pedidos_status ON pedidos(status);