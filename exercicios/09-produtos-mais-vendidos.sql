
-- =====================================================
-- EXERCÍCIO 09/10 — IDENTIFICAÇÃO DOS PRODUTOS MAIS VENDIDOS
-- Nível: 9 — Avançado
-- SQL | PostgreSQL
-- =====================================================

-- CONTEXTO EMPRESARIAL:
-- O departamento de compras está revisando o planejamento
-- de estoque e precisa identificar os produtos com maior
-- volume de vendas e faturamento.

-- DEMANDA DO GERENTE DE COMPRAS:
-- Apresentar o código do produto, nome, quantidade de
-- vendas pagas e faturamento total por produto.
--
-- Considerar somente vendas com pagamento confirmado
-- e apresentar os 10 produtos com maior faturamento,
-- em ordem decrescente.

-- OBJETIVO DA ANÁLISE:
-- Identificar os produtos que mais contribuem para
-- o faturamento da empresa, apoiando decisões de
-- estoque e planejamento de compras.

-- RESOLUÇÃO:

SELECT
    pro.product_id AS "Código do Produto",

    pro.model AS "Nome do Produto",

    COUNT(fun.paid_date)
        AS "Quantidade de Vendas Pagas",

    ROUND(SUM(pro.price), 2)
        AS "Faturamento Total por Produto"

FROM sales.products AS pro

INNER JOIN sales.funnel AS fun
    ON pro.product_id = fun.product_id

WHERE fun.paid_date IS NOT NULL

GROUP BY
    pro.product_id,
    pro.model

ORDER BY "Faturamento Total por Produto" DESC

LIMIT 10;
