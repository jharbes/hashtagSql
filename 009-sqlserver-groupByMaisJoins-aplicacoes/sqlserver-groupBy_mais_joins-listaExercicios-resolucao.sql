-- exercicios - groupBy mais joins - aplicacoes

use ContosoRetailDW;


-- Os exerc�cios abaixo est�o divididos de acordo com uma determinada tabela do Banco de Dados.
-- Voc� pode utilizar o INNER JOIN para resolver todas as quest�es.

-- FACT SALES


/*
1. 

a) Fa�a um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal
de vendas (ChannelName). Voc� deve ordenar a tabela final de acordo com SalesQuantity,
em ordem decrescente.

b) Fa�a um agrupamento mostrando a quantidade total vendida (Sales Quantity) e
quantidade total devolvida (Return Quantity) de acordo com o nome das lojas
(StoreName).

c) Fa�a um resumo do valor total vendido (Sales Amount) para cada m�s
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
	CalendarMonthLabel as 'M�s',
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
