
-- =====================================================
-- EXERCÍCIO 02/10 — IDENTIFICAÇÃO DE CLIENTES POR LOCALIZAÇÃO
-- Nível: 2 — Fácil
-- SQL | PostgreSQL
-- =====================================================

-- CONTEXTO EMPRESARIAL:
-- O departamento comercial está planejando uma campanha
-- regional para aumentar as vendas no estado de São Paulo.

-- DEMANDA DO GERENTE:
-- Gerar uma relação de todos os clientes cadastrados
-- no estado de São Paulo, contendo código de identificação,
-- nome completo, cidade e renda mensal.

-- OBJETIVO DA ANÁLISE:
-- Identificar clientes de uma região específica para
-- apoiar o planejamento de uma campanha comercial.

-- RESOLUÇÃO:

SELECT
    customer_id AS "Identificação",
    first_name || ' ' || last_name AS "Nome Completo",
    city AS "Cidade",
    income AS "Renda mensal"

FROM sales.customers

WHERE state = 'SP'

ORDER BY "Nome Completo";
