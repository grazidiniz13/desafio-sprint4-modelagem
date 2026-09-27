-- 1. Criação de uma ROLE (Papel/Grupo) para analistas de relatórios
CREATE ROLE papel_relatorios;

-- 2. Criação de pelo menos 2 utilizadores com senhas seguras
CREATE USER app_backend_user WITH PASSWORD 'SenhaForteBackend#2026';
CREATE USER analista_bi_user WITH PASSWORD 'SenhaForteBI#2026';

-- 3. Concedendo permissões para o sistema/backend (Precisa ler e escrever nas tabelas transacionais)
GRANT SELECT, INSERT, UPDATE ON clientes, produtos, pedidos, itens_pedido TO app_backend_user;

-- 4. Concedendo permissões para o analista de BI / Relatórios (Aplicando menor privilégio: apenas leitura nas tabelas)
GRANT SELECT ON clientes, produtos, pedidos, itens_pedido TO papel_relatorios;

-- Atribuindo a ROLE ao utilizador de BI
GRANT papel_relatorios TO analista_bi_user;

-- 5. Revogando privilégios indevidos por segurança (garantindo que analistas não possam alterar ou apagar dados)
REVOKE INSERT, UPDATE, DELETE ON clientes, produtos, pedidos, itens_pedido FROM papel_relatorios;