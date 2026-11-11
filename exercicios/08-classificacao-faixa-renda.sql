
-- =====================================================
-- EXERCÍCIO 08/10 — CLASSIFICAÇÃO DE CLIENTES POR FAIXA DE RENDA
-- Nível: 8 — Avançado
-- SQL | PostgreSQL
-- =====================================================

-- CONTEXTO EMPRESARIAL:
-- O departamento de inteligência comercial está
-- desenvolvendo uma estratégia de segmentação de clientes
-- para personalizar campanhas de marketing.

-- DEMANDA DO GERENTE DE MARKETING:
-- Classificar os clientes em três segmentos de renda:
-- Baixa Renda: renda inferior a R$ 3.000.
-- Média Renda: renda entre R$ 3.000 e R$ 7.000.
-- Alta Renda: renda superior a R$ 7.000.
--
-- Apresentar código de identificação, nome completo,
-- renda mensal e classificação correspondente.

-- OBJETIVO DA ANÁLISE:
-- Segmentar a base de clientes conforme seu poder
-- aquisitivo para apoiar estratégias comerciais
-- e campanhas de marketing direcionadas.

-- RESOLUÇÃO:

SELECT
    customer_id AS "Identificação do Cliente",

    first_name || ' ' || last_name
        AS "Nome Completo",

    income AS "Renda Mensal",

    CASE
        WHEN income < 3000 THEN 'Baixa Renda'
        WHEN income <= 7000 THEN 'Média Renda'
        WHEN income > 7000 THEN 'Alta Renda'
    END AS "Faixa Salarial"

FROM sales.customers;
