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



/*
2. Uma nova ação no setor de Marketing precisará avaliar a média salarial de todos os clientes
da empresa, mas apenas de ocupação Professional. Utilize um comando SQL para atingir esse
resultado.
*/

select
	avg(YearlyIncome) as 'Média Salarial Anual Profissão Professional'
from
	DimCustomer
where
	Occupation='Professional';



/*
3. Você precisará fazer uma análise da quantidade de funcionários das lojas registradas na
empresa. O seu gerente te pediu os seguintes números e informações:

a) Quantos funcionários tem a loja com mais funcionários?
b) Qual é o nome dessa loja?
c) Quantos funcionários tem a loja com menos funcionários?
d) Qual é o nome dessa loja?
*/

-- a)
select max(EmployeeCount) as 'Maior número de funcionários' from DimStore;

-- b)
select StoreName,EmployeeCount from dimstore where EmployeeCount=(select max(EmployeeCount) from DimStore);

-- ou

select top(1) StoreName,EmployeeCount from DimStore order by EmployeeCount desc;


-- c)
select min(EmployeeCount) as 'Menor número de funcionários' from DimStore;


-- d)
select StoreName,EmployeeCount from dimstore where EmployeeCount=(select min(EmployeeCount) from DimStore); -- menor resultado

-- ou

select top(1) StoreName,EmployeeCount from DimStore order by EmployeeCount; -- resultado NULL
select top(1) StoreName,EmployeeCount from DimStore where EmployeeCount is not null order by EmployeeCount; -- menor resultado