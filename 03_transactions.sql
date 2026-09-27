-- Transação 1: Cadastro de Cliente e Criação de um Pedido Inicial
BEGIN;

-- Passo A: Insere o cliente e captura o ID gerado usando RETURNING
INSERT INTO clientes (nome, email, cpf)
VALUES ('Carlos Eduardo', 'carlos.eduardo@email.com', '12345678909')
RETURNING cliente_id;

-- Criamos um ponto de salvamento (Savepoint)
SAVEPOINT sp_cliente_inserido;

-- Passo B: Insere um pedido para este cliente recém-criado (utilizando o ID 1 gerado)
INSERT INTO pedidos (cliente_id, status, valor_total)
VALUES (1, 'PENDENTE', 150.00)
RETURNING pedido_id;

-- Se tudo ocorreu perfeitamente, efetivamos a transação:
COMMIT;


-- Transação 2: Criação de um Pedido Completo com Itens e Savepoint
BEGIN;

-- Passo A: Inserir um novo pedido para um cliente já existente
INSERT INTO pedidos (cliente_id, status, valor_total)
VALUES (1, 'PAGO', 350.00)
RETURNING pedido_id;

-- Savepoint após criar o pedido
SAVEPOINT sp_pedido_criado;

-- Passo B: Inserir os itens vinculados a esse pedido (ex: pedido_id = 2)
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario)
VALUES (2, 1, 2, 100.00);

INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario)
VALUES (2, 2, 1, 150.00);

-- Confirmando a transação inteira:
COMMIT;