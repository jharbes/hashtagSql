-- Exercicios - funcoesAgregacao

use ContosoRetailDW;

/*
1. O gerente comercial pediu a você uma análise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.

Utilize uma função SQL para fazer essas consultas no seu banco de dados. Obs: Faça essa
análise considerando a tabela FactSales.
*/

select 
	sum(FactSales.SalesQuantity) as 'Quantidade Vendida Canal Loja',
	sum(FactSales.ReturnQuantity) as 'Quantidade Devolvida Canal Loja'
from
	FactSales
left join DimStore
on
	FactSales.StoreKey=DimStore.StoreKey
where
	DimStore.StoreType='Store';

-- ou

select 
	sum(FactSales.SalesQuantity) as 'Quantidade Vendida Canal Loja',
	sum(FactSales.ReturnQuantity) as 'Quantidade Devolvida Canal Loja'
from
	FactSales
where
	channelKey=1;