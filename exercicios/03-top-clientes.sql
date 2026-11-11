-- =====================================================
-- EXERCÍCIO 03/10 — PRIORIZAÇÃO DE CLIENTES POR RENDA
-- Nível: 3 — Fácil/Intermediário
-- SQL | PostgreSQL
-- =====================================================

-- CONTEXTO EMPRESARIAL:
-- O departamento de inteligência comercial de uma rede
-- varejista está planejando uma campanha direcionada
-- ao público de maior poder aquisitivo.

-- DEMANDA DO DIRETOR COMERCIAL:
-- Identificar os 20 clientes com maior renda mensal,
-- apresentando código de identificação, nome completo,
-- cidade e renda mensal, em ordem decrescente de renda.

-- OBJETIVO DA ANÁLISE:
-- Identificar e priorizar os clientes de maior renda
-- para apoiar o planejamento de campanhas comerciais.

-- RESOLUÇÃO:

SELECT
    customer_id AS "Identificação",
    first_name || ' ' || last_name AS "Nome Completo",
    city AS "Cidade",
    income AS "Renda Mensal"

FROM sales.customers

ORDER BY income DESC

LIMIT 20;
