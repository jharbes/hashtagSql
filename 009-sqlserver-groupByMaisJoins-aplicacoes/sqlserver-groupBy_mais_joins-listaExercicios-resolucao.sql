-- exercicios - groupBy mais joins - aplicacoes

use ContosoRetailDW;


-- Os exercícios abaixo estão divididos de acordo com uma determinada tabela do Banco de Dados.
-- Você pode utilizar o INNER JOIN para resolver todas as questões.

-- FACT SALES


/*
1. 

a) Faça um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal
de vendas (ChannelName). Você deve ordenar a tabela final de acordo com SalesQuantity,
em ordem decrescente.

b) Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) e
quantidade total devolvida (Return Quantity) de acordo com o nome das lojas
(StoreName).

c) Faça um resumo do valor total vendido (Sales Amount) para cada mês
(CalendarMonthLabel) e ano (CalendarYear).

*/

-- a)

select top(10) * from factsales;
select * from DimChannel;

select
	ChannelName as 'Canal de Vendas',
	sum(SalesQuantity) as 'Quantidade Total Vendida'
from
	FactSales
inner join DimChannel
	on FactSales.channelKey=DimChannel.ChannelKey
group by
	ChannelName
order by
	sum(SalesQuantity) desc;

-- b)
select
	StoreName as 'Loja',
	sum(SalesQuantity) as 'Quantidade Total Vendida',
	sum(ReturnQuantity) as 'Quantidade Total Devolvida'
from
	FactSales
inner join DimStore
	on FactSales.StoreKey=DimStore.StoreKey
group by
	StoreName;

-- c)
select
	CalendarMonthLabel as 'Mês',
	CalendarYear as 'Ano',
	sum(SalesAmount) as 'Valor Total Vendido'
from
	FactSales
inner join DimDate
	on FactSales.DateKey=DimDate.Datekey
group by
	CalendarYear, FiscalMonth, CalendarMonthLabel
order by
	CalendarYear, FiscalMonth;
