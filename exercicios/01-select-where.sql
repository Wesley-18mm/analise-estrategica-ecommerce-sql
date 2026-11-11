
-- =====================================================
-- EXERCÍCIO 01/10 — LEVANTAMENTO DA BASE DE CLIENTES
-- Nível: 1 — Fácil
-- SQL | PostgreSQL
-- =====================================================

-- CONTEXTO EMPRESARIAL:
-- Empresa de varejo com operação de vendas online.
-- O gerente comercial solicitou um levantamento inicial
-- da base de clientes cadastrados no sistema.

-- DEMANDA DO GERENTE:
-- Apresentar o código de identificação, nome, sobrenome,
-- cidade, estado e renda de todos os clientes cadastrados.

-- OBJETIVO:
-- Consultar e apresentar os dados cadastrais dos clientes
-- de maneira organizada.

-- RESOLUÇÃO:

SELECT
    customer_id AS "Identificação",
    first_name AS "Nome",
    last_name AS "Sobrenome",
    city AS "Cidade",
    state AS "Estado",
    income AS "Renda"

FROM sales.customers;
