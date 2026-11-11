
-- =====================================================
-- EXERCÍCIO 07/10 — IDENTIFICAÇÃO DE CLIENTES SEM COMPRAS
-- Nível: 7 — Intermediário/Avançado
-- SQL | PostgreSQL
-- =====================================================

-- CONTEXTO EMPRESARIAL:
-- O departamento de marketing identificou que parte
-- dos clientes cadastrados pode nunca ter realizado
-- uma compra na empresa.

-- DEMANDA DO GERENTE DE MARKETING:
-- Identificar os clientes que estão cadastrados no
-- sistema, mas não possuem compras pagas registradas.
--
-- Apresentar código de identificação, nome completo,
-- cidade e estado.

-- OBJETIVO DA ANÁLISE:
-- Identificar clientes ainda não convertidos em
-- compradores para apoiar campanhas de ativação
-- e incentivo à primeira compra.

-- RESOLUÇÃO:

SELECT
    cus.customer_id AS "Código de Identificação",

    cus.first_name || ' ' || cus.last_name
        AS "Nome Completo",

    cus.city AS "Cidade",

    cus.state AS "Estado"

FROM sales.customers AS cus

LEFT JOIN sales.funnel AS fun
    ON cus.customer_id = fun.customer_id

GROUP BY
    cus.customer_id,
    cus.first_name,
    cus.last_name,
    cus.city,
    cus.state

HAVING COUNT(fun.paid_date) = 0

ORDER BY "Nome Completo";
