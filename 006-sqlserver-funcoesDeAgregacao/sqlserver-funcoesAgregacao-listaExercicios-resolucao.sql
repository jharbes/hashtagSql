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



/*
3. Voc� precisar� fazer uma an�lise da quantidade de funcion�rios das lojas registradas na
empresa. O seu gerente te pediu os seguintes n�meros e informa��es:

a) Quantos funcion�rios tem a loja com mais funcion�rios?
b) Qual � o nome dessa loja?
c) Quantos funcion�rios tem a loja com menos funcion�rios?
d) Qual � o nome dessa loja?
*/

-- a)
select max(EmployeeCount) as 'Maior n�mero de funcion�rios' from DimStore;

-- b)
select StoreName,EmployeeCount from dimstore where EmployeeCount=(select max(EmployeeCount) from DimStore);

-- ou

select top(1) StoreName,EmployeeCount from DimStore order by EmployeeCount desc;


-- c)
select min(EmployeeCount) as 'Menor n�mero de funcion�rios' from DimStore;


-- d)
select StoreName,EmployeeCount from dimstore where EmployeeCount=(select min(EmployeeCount) from DimStore); -- menor resultado

-- ou

select top(1) StoreName,EmployeeCount from DimStore order by EmployeeCount; -- resultado NULL
select top(1) StoreName,EmployeeCount from DimStore where EmployeeCount is not null order by EmployeeCount; -- menor resultado