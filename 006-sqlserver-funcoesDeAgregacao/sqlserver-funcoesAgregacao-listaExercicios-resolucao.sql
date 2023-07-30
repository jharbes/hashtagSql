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



/*
4. A �rea de RH est� com uma nova a��o para a empresa, e para isso precisa saber a quantidade
total de funcion�rios do sexo Masculino e do sexo Feminino.

a) Descubra essas duas informa��es utilizando o SQL.
b) O funcion�rio e a funcion�ria mais antigos receber�o uma homenagem. Descubra as
seguintes informa��es de cada um deles: Nome, E-mail, Data de Contrata��o.
*/

-- a)
select top(1)
	(select
		count(Gender)
	from
		DimEmployee
	where Gender='M') as 'N�mero de Funcion�rios Homens',
	(select
		count(Gender)
	from
		DimEmployee
	where Gender='F') as 'N�mero de Funcion�rios Homens'
from
	DimEmployee;

-- ou

SELECT 
    SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) as 'N�mero de Funcion�rios Homens',
    SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) as 'N�mero de Funcion�rios Homens'
FROM 
    DimEmployee;


-- b)
select top(1)
	FirstName,
	EmailAddress,
	HireDate
from
	DimEmployee
where
	Gender='M'
order by
	HireDate;


select top(1)
	FirstName,
	EmailAddress,
	HireDate
from
	DimEmployee
where
	Gender='F'
order by
	HireDate;