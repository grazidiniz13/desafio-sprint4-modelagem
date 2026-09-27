# 🚀 Projeto de Modelagem Física, Otimização e Segurança - Sprint 4

Este repositório apresenta a entrega da **Sprint 4** de Modelagem de Banco de Dados, focando na implementação física da modelagem desenvolvida anteriormente.

---

## 📋 Sumário dos Critérios Atendidos

### 1. Introdução
* **Resumo do Projeto**: Este projeto dá continuidade à modelagem relacional estruturada na Sprint 3, realizando a migração e implementação completa do modelo lógico para um ambiente de banco de dados relacional robusto utilizando o **PostgreSQL**. O foco desta etapa recai sobre a otimização de performance, segurança transacional (ACID) e controle estrito de acesso aos dados.

### 2. Justificativa dos Tipos de Dados
* **`INT GENERATED ALWAYS AS IDENTITY`**: Utilizado nas chaves primárias para garantir a geração automática e segura de identificadores únicos, impedindo inserções manuais indevidas.
* **`TIMESTAMPTZ`**: Empregado nas colunas de data e hora para armazenar os registros com suporte a fuso horário, garantindo consistência temporal global.
* **`NUMERIC(10,2)`**: Escolhido para colunas de valores monetários e preços para assegurar exatidão matemática precisa, eliminando os erros de arredondamento comuns em tipos de ponto flutuante.
* **`VARCHAR`**: Utilizado para campos de texto de tamanho variável (como nomes e e-mails), otimizando o armazenamento e aplicando validações de tamanho.

### 3. Estratégia de Indexação
* **Seleção de Índices**: A criação de índices foi planejada de forma estratégica para evitar sobrecargas em operações de escrita (`INSERT`, `UPDATE`, `DELETE`).
* **Foco em Performance**: Foram aplicados índices em chaves estrangeiras (`FKs`) para acelerar as operações de junção (`JOIN`) e em colunas altamente utilizadas em cláusulas de filtro (`WHERE`) para otimizar as buscas no SGBD.

### 4. Transações (ACID)
* **Operações Críticas**: As transações foram implementadas para garantir a consistência em operações complexas que envolvem a inserção simultânea em múltiplas tabelas (como o cadastro de pedidos atrelados a clientes e itens).
* **Uso de `SAVEPOINT` e `RETURNING`**: O comando `SAVEPOINT` foi essencial para permitir pontos de reversão parciais dentro de um bloco transacional maior, enquanto o comando `RETURNING` viabilizou a captura imediata de chaves primárias geradas automaticamente (IDs) para uso imediato nas tabelas filhas.

### 5. Controle de Acesso
* **Usuários e Roles**: Foram criados usuários específicos para diferentes perfis de sistema (como o backend de aplicação e analistas de relatórios) associados a uma `ROLE` dedicada.
* **Princípio do Menor Privilégio**: As permissões foram rigorosamente aplicadas utilizando os comandos `GRANT` e `REVOKE`, garantindo que cada usuário possua acesso estritamente necessário para realizar suas funções, blindando dados sensíveis contra alterações ou exclusões indevidas.
