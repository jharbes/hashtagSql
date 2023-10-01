-- 01-groupBy_mais_innerJoin

/*
1-

a) Crie um agrupamento mostrando o total de vendas (SalesQuantity) por ano (CalendarYear).

b) Considere apenas o mês (CalendarMonthLabel) de 'January'.

c) Na tabela resultante, mostre apenas os anos com um total de vendas maior ou igual a 1.200.000

*/

select top(100) * from FactSales;
select * from DimDate;

-- a)
select
	CalendarYear as Ano,
	sum(SalesQuantity) as 'Total Vendido'
from
	FactSales
inner join DimDate
	on FactSales.DateKey=DimDate.Datekey
group by
	CalendarYear;

-- b)
select
	CalendarYear as 'Janeiro do Ano',
	sum(SalesQuantity) as 'Total Vendido'
from
	FactSales
inner join DimDate
	on FactSales.DateKey=DimDate.Datekey
where
	CalendarMonthLabel='January'
group by
	CalendarYear;

-- c)
select
	CalendarYear as 'Janeiro do Ano',
	sum(SalesQuantity) as 'Total Vendido acima de 1.200.000'
from
	FactSales
inner join DimDate
	on FactSales.DateKey=DimDate.Datekey
where
	CalendarMonthLabel='January'
group by
	CalendarYear
having
	sum(SalesQuantity)>=1200000;