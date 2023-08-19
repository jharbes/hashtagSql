-- Exercicios - criandoAgrupamentosNoSql

use ContosoRetailDW;

-- Os exercícios abaixo estão divididos de acordo com uma determinada tabela do Banco de Dados


-- FACTSALES

/*
1.

a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas (channelkey).

b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade 
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).

c) Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas para o ano de 2007.

*/

select * from FactSales;

-- a)
select
	channelKey as 'Canal de Vendas',
	sum(SalesQuantity) as 'Número de Vendas'
from
	FactSales
group by
	channelKey;

-- b)
select
	StoreKey,
	sum(SalesQuantity) as 'Quantidade de Vendas',
	sum(ReturnQuantity) as 'Quantidade de Devoluções'
from
	FactSales
group by
	StoreKey;

-- c)select	channelKey,	sum(SalesAmount) as 'Valor Total Vendido'from	FactSaleswhere	year(DateKey)=2007 -- quando o filtro NAO for no agrupamento sera feito no WHERE 	--DateKey between '20070101' and '20071231' -- tambem pode ser feito dessa maneira ano=2007group by	channelKey;/*2. Você precisa fazer uma análise de vendas por produtos. O objetivo final é descobrir o valor
total vendido (SalesAmount) por produto (ProductKey).

a) A tabela final deverá estar ordenada de acordo com a quantidade vendida e, além disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000.

b) Faça uma adaptação no exercício anterior e mostre os Top 10 produtos com mais vendas.
Desconsidere o filtro de $5.000.000 aplicado.

*/

-- a)
select
	ProductKey,
	sum(SalesAmount) as 'Total de Valor Vendido'
from
	FactSales
group by
	ProductKey
having -- o filtro eh feito no agrupamento, logo sera usado HAVING
	sum(SalesAmount)>=5000000
order by
	'Total de Valor Vendido' desc;

-- b)
select
	top(10) ProductKey,
	sum(SalesAmount) as 'Total de Valor Vendido'
from
	FactSales
group by
	ProductKey
order by
	'Total de Valor Vendido' desc;




/*
FACTONLINESALES

3. 

a) Você deve fazer uma consulta à tabela FactOnlineSales e descobrir qual é o ID
(CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna
SalesQuantity).

b) Feito isso, faça um agrupamento de total vendido (SalesQuantity) por ID do produto
e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).

*/

-- a)
select
	top(1) CustomerKey,
	sum(SalesQuantity) as 'Quantidade de Vendas'
from
	FactOnlineSales
group by
	CustomerKey
order by
	sum(SalesQuantity) desc;

-- b)
select
	top (3) ProductKey,
	sum(SalesQuantity) as 'Quantidade de Vendas'
from
	FactOnlineSales
where
	--CustomerKey=19037
	CustomerKey=(select
	top(1) CustomerKey
from
	FactOnlineSales
group by
	CustomerKey
order by
	sum(SalesQuantity) desc)
group by
	ProductKey
order by
	'Quantidade de Vendas' desc;