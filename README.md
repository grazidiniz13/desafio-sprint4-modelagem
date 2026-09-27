# 🚀 Desafio Sprint 4 - Modelagem Física e Otimização em PostgreSQL

Este repositório contém a entrega da **Sprint 4** de Modelagem de Banco de Dados. O projeto consiste na transição do Modelo Lógico (desenvolvido na Sprint 3) para a **Modelagem Física** utilizando o **PostgreSQL**, com foco em otimização de performance, integridade transacional (ACID) e controle de segurança e acesso.

---

## 📁 Estrutura do Repositório

O projeto está organizado na seguinte estrutura de diretórios dentro da pasta `sql/`:

```text
desafio-sprint4-modelagem/
├── sql/
│   ├── 01_ddl_schema.sql          # Criação do banco, tabelas e restrições (DDL)
│   ├── 02_indexes.sql             # Criação de índices estratégicos para otimização
│   ├── 03_transactions.sql        # Transações ACID com SAVEPOINT e RETURNING
│   ├── 04_explain_analyze.sql     # Análises de performance com EXPLAIN ANALYZE
│   └── 05_security.sql            # Controle de acesso (Users, Roles, GRANT/REVOKE)
└── README.md                      # Documentação técnica do projeto
