-- Exercicios - criandoAgrupamentosNoSql

use ContosoRetailDW;

-- Os exercícios abaixo estão divididos de acordo com uma determinada tabela do Banco de Dados


-- FACTSALES

/*
1.
*/

select * from FactSales;

-- a) Faça um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas (channelkey).
select
	channelKey as 'Canal de Vendas',
	sum(SalesQuantity) as 'Número de Vendas'
from
	FactSales
group by channelKey;

-- b) Faça um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade 
-- total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).
select
	StoreKey,
	sum(SalesQuantity) as 'Quantidade de Vendas',
	sum(ReturnQuantity) as 'Quantidade de Devoluções'
from
	FactSales
group by
	StoreKey;

-- c) Faça um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas para o ano de 2007.select	channelKey,	sum(SalesAmount) as 'Total Vendido'from	FactSaleswhere	year(DateKey)=2007group by	channelKey;