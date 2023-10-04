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
	CalendarYear as 'Ano',
	CalendarMonthLabel as 'M�s',
	sum(SalesAmount) as 'Valor Total Vendido'
from
	FactSales
inner join DimDate
	on FactSales.DateKey=DimDate.Datekey
group by
	CalendarYear, FiscalMonth, CalendarMonthLabel
order by
	CalendarYear, FiscalMonth;



/*
2. Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor
total vendido (SalesQuantity) por produto.

a) Descubra qual � a cor de produto que mais � vendida (de acordo com SalesQuantity).

b) Quantas cores tiveram uma quantidade vendida acima de 3.000.000.

*/

-- a)
select top(10) * from FactSales;
select * from DimProduct;

select
	ColorName,
	sum(SalesQuantity) as 'Quantidade Vendida'
from
	FactSales
inner join DimProduct
	on FactSales.ProductKey=DimProduct.ProductKey
group by ColorName
order by sum(SalesQuantity) desc;

-- b)
select
	ColorName,
	sum(SalesQuantity) as 'Quantidade Vendida'
from
	FactSales
inner join DimProduct
	on FactSales.ProductKey=DimProduct.ProductKey
group by ColorName
having sum(SalesQuantity)>3000000
order by sum(SalesQuantity) desc;


select
	@@ROWCOUNT as 'Cores com Vendas acima de 3.000.000'
from
	FactSales
inner join DimProduct
	on FactSales.ProductKey=DimProduct.ProductKey
--group by ColorName
having sum(SalesQuantity)>3000000
order by sum(SalesQuantity) desc;



/*
3. Crie um agrupamento de quantidade vendida (SalesQuantity) por categoria do produto
(ProductCategoryName). Obs: Voc� precisar� fazer mais de 1 INNER JOIN, dado que a rela��o
entre FactSales e DimProductCategory n�o � direta.

*/

select top(10) * from FactSales;
select * from DimProduct;
select * from DimProductCategory;
select * from DimProductSubcategory;

select
	ProductCategoryName as Categoria,
	sum(SalesQuantity) as 'Qtd. Vendida'
from
	FactSales
inner join DimProduct
	on FactSales.ProductKey=DimProduct.ProductKey
inner join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey
inner join DimProductCategory
	on DimProductSubcategory.ProductCategoryKey=DimProductCategory.ProductCategoryKey
group by ProductCategoryName;



/*
FACTONLINESALES

4. 
a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o nome completo
do cliente que mais realizou compras online (de acordo com a coluna SalesQuantity).

b) Feito isso, fa�a um agrupamento de produtos e descubra quais foram os top 10 produtos mais
comprados pelo cliente da letra a, considerando o nome do produto.
*/

-- a)
select top(10) * from FactOnlineSales;
select  * from DimCustomer;

select
	top(1)
	DimCustomer.CustomerKey,
	CONCAT(firstname, ' ', lastname) as 'Nome Completo',
	sum(SalesQuantity) as 'N�mero de Compras Online'
from FactOnlineSales
inner join DimCustomer
	on FactOnlineSales.CustomerKey=DimCustomer.CustomerKey
where CustomerType='Person'
group by DimCustomer.CustomerKey, CONCAT(firstname, ' ', lastname)
order by sum(SalesQuantity) desc;

-- b)
select
	top(10)
	DimCustomer.CustomerKey,
	CONCAT(firstname, ' ', lastname) as 'Nome Completo',
	ProductName,
	sum(SalesQuantity) as 'N�mero de Compras Online'
from FactOnlineSales
inner join DimCustomer
	on FactOnlineSales.CustomerKey=DimCustomer.CustomerKey
inner join DimProduct
	on FactOnlineSales.ProductKey=DimProduct.ProductKey
where CustomerType='Person' and DimCustomer.CustomerKey=7665
group by DimCustomer.CustomerKey, CONCAT(firstname, ' ', lastname), ProductName
order by sum(SalesQuantity) desc, ProductName;

------------------------------------------------------------------

select
	top(10)
	CONCAT(firstname, ' ', lastname) as 'Nome Completo',
	ProductName,
	sum(SalesQuantity) as 'N�mero de Compras Online'
from FactOnlineSales
inner join DimCustomer
	on FactOnlineSales.CustomerKey=DimCustomer.CustomerKey
inner join DimProduct
	on FactOnlineSales.ProductKey=DimProduct.ProductKey
where CustomerType='Person' and DimCustomer.CustomerKey=
(

select
	top(1)
	DimCustomer.CustomerKey
from FactOnlineSales
inner join DimCustomer
	on FactOnlineSales.CustomerKey=DimCustomer.CustomerKey
where CustomerType='Person'
group by DimCustomer.CustomerKey
order by sum(SalesQuantity) desc

)
group by DimCustomer.CustomerKey, CONCAT(firstname, ' ', lastname), ProductName
order by sum(SalesQuantity) desc, ProductName;



/*
5. Fa�a um resumo mostrando o total de produtos comprados (Sales Quantity) de acordo com o
sexo dos clientes.

*/

select top(10) * from FactOnlineSales;
select  * from DimCustomer;

select
	Gender as 'Sexo',
	sum(SalesQuantity) as 'Total de Produtos Comprados'
from
	FactOnlineSales
inner join DimCustomer
on FactOnlineSales.CustomerKey=DimCustomer.CustomerKey
where Gender is not null
group by Gender;



/*
FACTEXCHANGERATE

6. Fa�a uma tabela resumo mostrando a taxa de c�mbio m�dia de acordo com cada
CurrencyDescription. A tabela final deve conter apenas taxas entre 10 e 100.

*/

select top(10) * from FactExchangeRate;
select * from DimCurrency;

select
	FactExchangeRate.CurrencyKey 'ID da Moeda',
	CurrencyDescription as 'Moeda',
	avg(AverageRate) as 'Taxa de C�mbio M�dia'
from
	FactExchangeRate
inner join DimCurrency
on FactExchangeRate.CurrencyKey=DimCurrency.CurrencyKey
group by FactExchangeRate.CurrencyKey, CurrencyDescription
having avg(AverageRate)>=10 and avg(AverageRate)<=100
-- ou
-- having avg(AverageRate) between 10 and 100
order by FactExchangeRate.CurrencyKey;



/*
FACTSTRATEGYPLAN

7. Calcule a SOMA TOTAL de AMOUNT referente � tabela FactStrategyPlan destinado aos
cen�rios: Actual e Budget.

Dica: A tabela DimScenario ser� importante para esse exerc�cio.

*/

select top(10) * from FactStrategyPlan;
select * from DimScenario;

select
	ScenarioDescription as 'Cen�rio',
	sum(Amount) as 'Montante Total'
from
	FactStrategyPlan
inner join DimScenario
on FactStrategyPlan.ScenarioKey=DimScenario.ScenarioKey
where ScenarioDescription in ('Actual', 'Budget')
group by ScenarioDescription;