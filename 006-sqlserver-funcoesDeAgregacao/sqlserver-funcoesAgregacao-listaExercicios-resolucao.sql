-- Exercicios - funcoesAgregacao

use ContosoRetailDW;

/*
1. O gerente comercial pediu a voc� uma an�lise da Quantidade Vendida e Quantidade
Devolvida para o canal de venda mais importante da empresa: Store.

Utilize uma fun��o SQL para fazer essas consultas no seu banco de dados. Obs: Fa�a essa
an�lise considerando a tabela FactSales.
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



/*
2. Uma nova a��o no setor de Marketing precisar� avaliar a m�dia salarial de todos os clientes
da empresa, mas apenas de ocupa��o Professional. Utilize um comando SQL para atingir esse
resultado.
*/

select
	avg(YearlyIncome) as 'M�dia Salarial Anual Profiss�o Professional'
from
	DimCustomer
where
	Occupation='Professional';