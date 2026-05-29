-- Tecnologias utilizadas:
-- PostgreSQL
-- SQL
--
-- Técnicas aplicadas:
-- JOIN
-- CASE WHEN
-- EXTRACT
-- TO_CHAR
-- COALESCE
-- INTERVAL
-- GROUP BY
-- ORDER BY


-- ==========================================
-- PROJETO 01 - ANALISE ESTRATEGICA E-COMMERCE
-- Autor: Wesley
-- Objetivo:
-- Entender comportamento dos clientes,
-- compras e conversao do e-commerce
-- ==========================================


-- DEMANDA 01
-- A diretoria quer saber:
-- Quais estados possuem mais clientes?
--
-- Mostrar:
-- estado
-- quantidade de clientes
--
-- Ordenar:
-- do maior para o menor


select
	state as "Estado",
	count(distinct customer_id) as "Quantidade de Clientes"

from sales.customers

group by "Estado"

order by "Quantidade de Clientes" desc;



-- ==========================================
-- DEMANDA 02
-- O CRM quer segmentar clientes por renda
--
-- Regras:
-- abaixo de 5k → baixa renda
-- 5k a 10k → média renda
-- acima de 10k → alta renda
--
-- Mostrar:
-- cliente
-- renda
-- classificação

select
	first_name || ' ' || last_name as "Cliente",
	income as "Renda",

	case 
		when income < 5000 then 'Baixa Renda'
		when income >= 5000 and income < 10000 then 'Media Renda'
		else 'Alta Renda'

		end as "Clientes Por Renda"

from sales.customers;



-- ==========================================
-- DEMANDA 03
-- A empresa quer saber:
-- qual status profissional aparece mais?
--
-- Mostrar:
-- status profissional
-- quantidade de clientes
--
-- Ordenar:
-- do maior para o menor

select
	professional_status as "Status Profissional",
	count(customer_id) as "Cliente"

from sales.customers

group by "Status Profissional"

order by "Cliente" desc;



-- ==========================================
-- DEMANDA 04
-- A diretoria quer descobrir:
-- qual mês possui mais compras?
--
-- Mostrar:
-- mês
-- quantidade de compras
--
-- Mostrar apenas compradores
--
-- Ordenar:
-- do maior para o menor


select
	
	trim(
	to_char(paid_date, 'TMMonth')
	) as "Mês",
	count(*) as "Quantidade de Compras"
	
from sales.funnel

where paid_date is not null

group by "Mês"
order by "Quantidade de Compras" desc;
	


-- ==========================================
-- DEMANDA 05
-- O marketing quer descobrir:
-- qual horário recebe mais compras?
--
-- Mostrar:
-- hora
-- quantidade de compras
--
-- Mostrar apenas compradores
--
-- Ordenar:
-- do maior volume para o menor


select
	extract(hour from paid_date) as "Hora",
	count(*) as "Quantidade de Compras"

from sales.funnel

where paid_date is not null

group by "Hora"

order by "Quantidade de Compras" desc;



-- ==========================================
-- DEMANDA 06
-- O time executivo quer descobrir:
-- qual trimestre recebe mais visitas?
--
-- Mostrar:
-- trimestre
-- quantidade de visitas
--
-- Mostrar apenas quem visitou
--
-- Ordenar:
-- do maior volume para o menor


select
	extract(quarter from visit_page_date)
	as "Trimestre",

	count(*)
	as "Quantidade de Visitas"

from sales.funnel

where visit_page_date is not null

group by "Trimestre"

order by "Quantidade de Visitas" desc;
	
	
-- ==========================================
-- DEMANDA 07
-- O time executivo quer descobrir:
-- qual ano possui mais visitas no site?
--
-- Mostrar:
-- ano
-- quantidade de visitas
--
-- Mostrar apenas quem visitou
--
-- Ordenar:
-- do maior volume para o menor


select	
	extract(year from visit_page_date)
	as "Ano",

	count(*) as "Quantidade de Visitas"

from sales.funnel

where visit_page_date is not null

group by "Ano"

order by "Quantidade de Visitas" desc;

	
-- ==========================================
-- DEMANDA 08
-- O time de CRM quer descobrir:
-- quanto tempo os clientes levam entre:
-- adicionar ao carrinho → compra
--
-- Mostrar:
-- cliente
-- data do carrinho
-- data da compra
-- quantidade de dias até comprar
--
-- Mostrar apenas quem comprou


select
	cus.first_name || ' ' || cus.last_name as "Cliente",

	fun.add_to_cart_date
	as "Data do Carrinho",

	fun.paid_date 
	as "Data da Compra",

	fun.paid_date - fun.add_to_cart_date
	as "Dias até a Compra"

from sales.funnel as fun
left join sales.customers as cus
on cus.customer_id = fun.customer_id

where fun.paid_date is not null;



-- ==========================================
	-- DEMANDA 09
	-- O time comercial quer entender:
	-- qual dia da semana recebe mais compras?
	--
	-- Mostrar:
	-- dia da semana
	-- quantidade de compras
	--
	-- Mostrar apenas quem comprou
	--
	-- Ordenar:
	-- do maior volume para o menor
	
	
select
	trim( 
		to_char(paid_date, 'TMDay')

	) as "Dia da Semana",

	count(*)
	as "Quantidade de Compra"

	from sales.funnel

	where paid_date is not null

	group by "Dia da Semana"

	order by "Quantidade de Compra" desc;



-- ==========================================
-- DEMANDA 10
-- O time de relacionamento quer programar
-- um follow-up automático.
--
-- Mostrar:
-- cliente
-- data da compra
-- data do próximo contato:
-- 30 dias após a compra
--
-- Mostrar apenas quem comprou


select
	first_name || ' ' || last_name as "Cliente",

	fun.paid_date
	as "Data da Compra",

	fun.paid_date
	+ interval '30 days'
	as "Contato pós Compra"

from sales.customers as cus
left join sales.funnel as fun
on cus.customer_id = fun.customer_id

where fun.paid_date is not null;



-- ==========================================
-- DEMANDA 11
-- O time de CRM quer analisar
-- o comportamento de visita dos clientes.
--
-- Mostrar:
-- cliente
-- data da visita ao site
--
-- Mas:
-- quando não houver visita,
-- mostrar:
-- 'Não Visitou'
--
-- Mostrar todos os clientes

select
	cus.first_name || ' ' || cus.last_name as "Cliente",
	
	coalesce(fun.visit_page_date::text,'Não Visitou')
		as "Status de Visita"

from sales.customers as cus
left join sales.funnel as fun
on cus.customer_id = fun.customer_id;


	


















































































































































