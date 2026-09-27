-- Remove tabelas se existirem (em ordem reversa por causa das FKs)
DROP TABLE IF EXISTS itens_pedido CASCADE;
DROP TABLE IF EXISTS pedidos CASCADE;
DROP TABLE IF EXISTS produtos CASCADE;
DROP TABLE IF EXISTS clientes CASCADE;

-- 1. Tabela de Clientes
CREATE TABLE clientes (
    cliente_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    cpf CHAR(11) UNIQUE NOT NULL,
    data_cadastro TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    ativo BOOLEAN DEFAULT TRUE
);

-- 2. Tabela de Produtos
CREATE TABLE produtos (
    produto_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_produto VARCHAR(120) NOT NULL,
    preco NUMERIC(10, 2) NOT NULL CHECK (preco > 0),
    estoque INT NOT NULL DEFAULT 0 CHECK (estoque >= 0),
    criado_em TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- 3. Tabela de Pedidos (Possui FK para Clientes)
CREATE TABLE pedidos (
    pedido_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) NOT NULL DEFAULT 'PENDENTE' CHECK (status IN ('PENDENTE', 'PAGO', 'ENVIADO', 'CANCELADO')),
    valor_total NUMERIC(12, 2) DEFAULT 0.00 CHECK (valor_total >= 0),
    CONSTRAINT fk_pedidos_cliente FOREIGN KEY (cliente_id) 
        REFERENCES clientes(cliente_id) 
        ON DELETE RESTRICT
);

-- 4. Tabela de Itens do Pedido (Tabela Associativa com FK para Pedidos e Produtos)
CREATE TABLE itens_pedido (
    item_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL CHECK (quantidade > 0),
    preco_unitario NUMERIC(10, 2) NOT NULL CHECK (preco_unitario > 0),
    CONSTRAINT fk_itens_pedido FOREIGN KEY (pedido_id) 
        REFERENCES pedidos(pedido_id) 
        ON DELETE CASCADE,
    CONSTRAINT fk_itens_produto FOREIGN KEY (produto_id) 
        REFERENCES produtos(produto_id) 
        ON DELETE RESTRICT
);