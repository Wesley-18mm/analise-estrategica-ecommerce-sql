
-- =====================================================
-- EXERCÍCIO 04/10 — DIMENSIONAMENTO DA BASE DE CLIENTES
-- Nível: 4 — Intermediário
-- SQL | PostgreSQL
-- =====================================================

-- CONTEXTO EMPRESARIAL:
-- A diretoria está avaliando a expansão da operação
-- comercial e precisa conhecer o tamanho atual da
-- base de clientes.

-- DEMANDA DO GERENTE:
-- Apresentar cinco métricas:
-- 1. Quantidade de clientes cadastrados.
-- 2. Renda mensal média dos clientes.
-- 3. Menor renda registrada.
-- 4. Maior renda registrada.
-- 5. Soma total das rendas mensais cadastradas.

-- OBJETIVO DA ANÁLISE:
-- Dimensionar a base de clientes e compreender
-- a distribuição geral das rendas mensais.

-- RESOLUÇÃO:

SELECT
    COUNT(customer_id)
        AS "Quantidade de Cadastros",

    ROUND(AVG(income), 2)
        AS "Renda Média Mensal",

    ROUND(SUM(income), 2)
        AS "Soma Total das Rendas Mensais",

    MIN(income)
        AS "Menor Renda",

    MAX(income)
        AS "Maior Renda"

FROM sales.customers;
