-- Exercicios - criandoAgrupamentosNoSql

use ContosoRetailDW;

-- Os exerc�cios abaixo est�o divididos de acordo com uma determinada tabela do Banco de Dados


-- FACTSALES

/*
1.

a) Fa�a um resumo da quantidade vendida (SalesQuantity) de acordo com o canal de vendas (channelkey).

b) Fa�a um agrupamento mostrando a quantidade total vendida (SalesQuantity) e quantidade 
total devolvida (Return Quantity) de acordo com o ID das lojas (StoreKey).

c) Fa�a um resumo do valor total vendido (SalesAmount) para cada canal de venda, mas apenas para o ano de 2007.

*/

select * from FactSales;

-- a)
select
	channelKey as 'Canal de Vendas',
	sum(SalesQuantity) as 'N�mero de Vendas'
from
	FactSales
group by
	channelKey;

-- b)
select
	StoreKey,
	sum(SalesQuantity) as 'Quantidade de Vendas',
	sum(ReturnQuantity) as 'Quantidade de Devolu��es'
from
	FactSales
group by
	StoreKey;

-- c)select	channelKey,	sum(SalesAmount) as 'Valor Total Vendido'from	FactSaleswhere	year(DateKey)=2007 -- quando o filtro NAO for no agrupamento sera feito no WHERE 	--DateKey between '20070101' and '20071231' -- tambem pode ser feito dessa maneira ano=2007group by	channelKey;/*2. Voc� precisa fazer uma an�lise de vendas por produtos. O objetivo final � descobrir o valor
total vendido (SalesAmount) por produto (ProductKey).

a) A tabela final dever� estar ordenada de acordo com a quantidade vendida e, al�m disso,
mostrar apenas os produtos que tiveram um resultado final de vendas maior do que
$5.000.000.

b) Fa�a uma adapta��o no exerc�cio anterior e mostre os Top 10 produtos com mais vendas.
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

a) Voc� deve fazer uma consulta � tabela FactOnlineSales e descobrir qual � o ID
(CustomerKey) do cliente que mais realizou compras online (de acordo com a coluna
SalesQuantity).

b) Feito isso, fa�a um agrupamento de total vendido (SalesQuantity) por ID do produto
e descubra quais foram os top 3 produtos mais comprados pelo cliente da letra a).

*/

-- a)
select top(1)
	CustomerKey,
	sum(SalesQuantity) as 'Quantidade de Vendas'
from
	FactOnlineSales
group by
	CustomerKey
order by
	sum(SalesQuantity) desc;

-- b)
select top (3)
	ProductKey,
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




/*
DIMPRODUCT

4.

a) Fa�a um agrupamento e descubra a quantidade total de produtos por marca.

b) Determine a m�dia do pre�o unit�rio (UnitPrice) para cada ClassName.

c) Fa�a um agrupamento de cores e descubra o peso total que cada cor de produto possui.

*/

-- a)
select
	BrandName as 'Marca do Produto',
	count(BrandName) 'N�mero de Produtos por Marca'
from
	DimProduct
group by
	BrandName;

-- b)
select
	ClassName,
	avg(UnitPrice) as 'M�dia do Pre�o Unit�rio'
from
	DimProduct
group by
	ClassName;

-- c)
select
	ColorName as 'Nome da Cor',
	sum(Weight) as 'Peso Total'
from
	DimProduct
group by
	ColorName;




/*
5. Voc� dever� descobrir o peso total para cada tipo de produto (StockTypeName).

A tabela final deve considerar apenas a marca �Contoso� e ter os seus valores classificados em
ordem decrescente.*/select	StockTypeName as 'Tipo de Produto',	sum(Weight) as 'Peso Total'from	DimProductwhere	BrandName='Contoso'group by	StockTypeNameorder by	sum(Weight) desc;/*6. Voc� seria capaz de confirmar se todas as marcas dos produtos possuem � disposi��o todas as
16 op��es de cores?*/select	BrandName as 'Marca do Produto',	count(distinct ColorName) as 'N�mero de Cores da Marca'from	DimProductgroup by	BrandName;-- mostrando as cores existentes para cada uma das marcasselect	distinct BrandName as 'Marca do Produto',	ColorName as 'Cores da Marca'from	DimProductorder by	BrandName;/*DIMCUSTOMER

7. Fa�a um agrupamento para saber o total de clientes de acordo com o Sexo e tamb�m a m�dia
salarial de acordo com o Sexo. Corrija qualquer resultado �inesperado� com os seus
conhecimentos em SQL.

*/

select
	Gender as 'Sexo',
	count(Gender) as 'N�mero de Clientes',
	avg(YearlyIncome) as 'M�dia Salarial' 
from
	DimCustomer
where
	Gender is not null
group by
	Gender;




/*
8. Fa�a um agrupamento para descobrir a quantidade total de clientes e a m�dia salarial de
acordo com o seu n�vel escolar. Utilize a coluna Education da tabela DimCustomer para fazer
esse agrupamento.

*/

select
	Education as 'N�vel Escolar',
	count(Education) as 'Quantidade por N�vel Escolar',
	avg(YearlyIncome) as 'M�dia Salarial'
from
	DimCustomer
where
	Education is not null
group by
	Education;




/*
DIMEMPLOYEE

9. Fa�a uma tabela resumo mostrando a quantidade total de funcion�rios de acordo com o
Departamento (DepartmentName). Importante: Voc� dever� considerar apenas os
funcion�rios ativos

*/

select
	DepartmentName as 'Nome do Departamento',
	count(DepartmentName) as 'N�mero de Funcion�rios'
from
	DimEmployee
where
	EndDate is null
	--Status is not null
group by
	DepartmentName;




/*
10. Fa�a uma tabela resumo mostrando o total de VacationHours para cada cargo (Title). Voc�
deve considerar apenas as mulheres, dos departamentos de Production, Marketing,
Engineering e Finance, para os funcion�rios contratados entre os anos de 1999 e 2000.

*/

select
	Title as 'Cargo',
	sum(VacationHours) as 'Horas de F�rias'
from
	DimEmployee
where
	Gender='F' and DepartmentName in ('Production','Marketing','Engineering','Finance')
	and year(HireDate) in (1999,2000)
group by
	Title;