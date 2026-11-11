
-- =====================================================
-- EXERCÍCIO 05/10 — ANÁLISE DE CLIENTES POR ESTADO
-- Nível: 5 — Intermediário
-- SQL | PostgreSQL
-- =====================================================

-- CONTEXTO EMPRESARIAL:
-- A empresa está estudando a expansão de suas campanhas
-- comerciais para diferentes regiões do Brasil.

-- DEMANDA DO DIRETOR COMERCIAL:
-- Apresentar um relatório com a quantidade de clientes,
-- renda média mensal e soma total das rendas mensais
-- agrupadas por estado.
--
-- O relatório deve apresentar somente os estados com
-- mais de 100 clientes cadastrados, em ordem decrescente
-- de quantidade de clientes.

-- OBJETIVO DA ANÁLISE:
-- Identificar os estados com maior concentração de
-- clientes e avaliar o potencial comercial de cada
-- região com base na renda mensal dos consumidores.

-- RESOLUÇÃO:

SELECT
    state AS "Estado",

    COUNT(customer_id)
        AS "Quantidade de Clientes",

    ROUND(AVG(income), 2)
        AS "Renda Média Mensal",

    ROUND(SUM(income), 2)
        AS "Soma Total das Rendas Mensais"

FROM sales.customers

GROUP BY state

HAVING COUNT(customer_id) > 100

ORDER BY "Quantidade de Clientes" DESC;
