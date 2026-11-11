
-- =====================================================
-- EXERCÍCIO 06/10 — ANÁLISE DE VENDAS POR CLIENTE
-- Nível: 6 — Intermediário
-- SQL | PostgreSQL
-- =====================================================

-- CONTEXTO EMPRESARIAL:
-- O departamento de inteligência comercial precisa
-- identificar os clientes que efetivamente realizaram
-- compras para apoiar estratégias de relacionamento
-- e fidelização.

-- DEMANDA DO GERENTE COMERCIAL:
-- Apresentar o código de identificação, nome completo,
-- quantidade de compras pagas e valor total comprado
-- por cliente.
--
-- Exibir somente clientes com compras pagas,
-- ordenados pelo maior valor total de compras.

-- OBJETIVO DA ANÁLISE:
-- Identificar os clientes que mais compraram e avaliar
-- sua contribuição para o faturamento da empresa.

-- RESOLUÇÃO:

SELECT
    cus.customer_id AS "Código de Identificação",

    cus.first_name || ' ' || cus.last_name
        AS "Nome Completo",

    COUNT(fun.paid_date)
        AS "Quantidade de Compras",

    ROUND(SUM(pro.price), 2)
        AS "Valor Total de Compras"

FROM sales.customers AS cus

LEFT JOIN sales.funnel AS fun
    ON cus.customer_id = fun.customer_id

LEFT JOIN sales.products AS pro
    ON pro.product_id = fun.product_id

WHERE fun.paid_date IS NOT NULL

GROUP BY
    cus.customer_id,
    cus.first_name,
    cus.last_name

ORDER BY "Valor Total de Compras" DESC;
