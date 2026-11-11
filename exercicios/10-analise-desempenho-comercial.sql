
-- =====================================================
-- EXERCÍCIO 10/10 — ANÁLISE DE DESEMPENHO COMERCIAL
-- Nível: Avançado
-- SQL | PostgreSQL
-- =====================================================

-- CONTEXTO EMPRESARIAL:
-- A diretoria comercial precisa identificar os clientes
-- que geram maior receita para a empresa.

-- DEMANDA DA DIRETORIA:
-- Consolidar o histórico de compras pagas e classificar
-- os clientes conforme o valor financeiro gerado.
--
-- Apresentar:
-- 1. ID do cliente.
-- 2. Nome completo.
-- 3. Estado.
-- 4. Quantidade de compras pagas.
-- 5. Valor total gerado.
-- 6. Classificação financeira.
--
-- REGRAS DE CLASSIFICAÇÃO:
-- Baixo: total inferior a R$ 1.000.
-- Médio: total entre R$ 1.000 e R$ 5.000, inclusive.
-- Alto: total superior a R$ 5.000.
--
-- OBJETIVO DA ANÁLISE:
-- Identificar os clientes de maior contribuição financeira
-- para apoiar estratégias de relacionamento, retenção
-- e fidelização.

-- RESOLUÇÃO:

SELECT
    cus.customer_id AS "ID do Cliente",

    cus.first_name || ' ' || cus.last_name
        AS "Nome Completo",

    cus.state AS "Estado",

    COUNT(fun.paid_date)
        AS "Quantidade de Compras Pagas",

    ROUND(SUM(pro.price), 2)
        AS "Valor Total Gerado em Compras",

    CASE
        WHEN SUM(pro.price) < 1000
            THEN 'Baixo'

        WHEN SUM(pro.price) <= 5000
            THEN 'Médio'

        ELSE 'Alto'
    END AS "Classificação Financeira"

FROM sales.customers AS cus

INNER JOIN sales.funnel AS fun
    ON cus.customer_id = fun.customer_id

INNER JOIN sales.products AS pro
    ON pro.product_id = fun.product_id

WHERE fun.paid_date IS NOT NULL

GROUP BY
    cus.customer_id,
    cus.first_name,
    cus.last_name,
    cus.state

ORDER BY
    SUM(pro.price) DESC;
