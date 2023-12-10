-- exercicios - sql_views

use ContosoRetailDW;


-- MÓDULO 13: EXERCÍCIOS

/*
1. a) A partir da tabela DimProduct, crie uma View contendo as informações de
ProductName, ColorName, UnitPrice e UnitCost, da tabela DimProduct. Chame essa View
de vwProdutos.

b) A partir da tabela DimEmployee, crie uma View mostrando FirstName, BirthDate,
DepartmentName. Chame essa View de vwFuncionarios.

c) A partir da tabela DimStore, crie uma View mostrando StoreKey, StoreName e
OpenDate. Chame essa View de vwLojas
*/

-- a)

go
create view vwProdutos as
select
	ProductName,
	ColorName,
	UnitPrice,
	UnitCost
from DimProduct;
go

select * from vwProdutos;


-- b)

go
create view vwFuncionarios as
select
	FirstName,
	BirthDate,
	DepartmentName
from DimEmployee;
go

select * from vwFuncionarios;


-- c)

go
create view vwLojas as
select
	StoreKey,
	StoreName,
	OpenDate
from DimStore;
go

select * from vwLojas;




/*
2. Crie uma View contendo as informações de Nome Completo (FirstName +
LastName), Gênero (por extenso), E-mail e Renda Anual (formatada com R$).
Utilize a tabela DimCustomer. Chame essa View de vwClientes.
*/

select * from DimCustomer;

go
create view vwClientes as
select 
	CONCAT(FirstName, ' ', LastName) as 'Nome Completo',
	case
		when Gender='M' then 'Masculino'
		else 'Feminino'
	end as 'Gênero',
	EmailAddress as 'E-Mail',
	FORMAT(YearlyIncome,'C') as 'Renda Anual'
from DimCustomer;
go

select * from vwClientes;




/*
3. a) A partir da tabela DimStore, crie uma View que considera apenas as lojas ativas. Faça
um SELECT de todas as colunas. Chame essa View de vwLojasAtivas.

b) A partir da tabela DimEmployee, crie uma View de uma tabela que considera apenas os
funcionários da área de Marketing. Faça um SELECT das colunas: FirstName, EmailAddress
e DepartmentName. Chame essa de vwFuncionariosMkt.

c) Crie uma View de uma tabela que considera apenas os produtos das marcas Contoso e
Litware. Além disso, a sua View deve considerar apenas os produtos de cor Silver. Faça
um SELECT de todas as colunas da tabela DimProduct. Chame essa View de
vwContosoLitwareSilver.*/-- a)select * from DimStore;gocreate view vwLojasAtivas asselect 	*from DimStorewhere CloseDate is null;goselect * from vwLojasAtivas;-- b)gocreate view vwFuncionariosMkt asselect	FirstName,	EmailAddress,	DepartmentNamefrom DimEmployeewhere DepartmentName='Marketing';goselect * from vwFuncionariosMkt;-- c)gocreate view vwContosoLitwareSilver asselect	*from DimProductwhere BrandName in ('Contoso','Litware') and ColorName='Silver';goselect * from vwContosoLitwareSilver;/*4. Crie uma View que seja o resultado de um agrupamento da tabela FactSales. Este
agrupamento deve considerar o SalesQuantity (Quantidade Total Vendida) por Nome do
Produto. Chame esta View de vwTotalVendidoProdutos.

OBS: Para isso, você terá que utilizar um JOIN para relacionar as tabelas FactSales e
DimProduct.*/select top(10) * from FactSales;gocreate view vwTotalVendidoProdutos asselect	ProductName as 'Nome do Produto',	SUM(SalesQuantity) as 'Quantidade Total Vendida'from FactSalesleft join DimProduct on FactSales.ProductKey=DimProduct.ProductKeygroup by ProductName;goselect * from vwTotalVendidoProdutos;/*5. Faça as seguintes alterações nas tabelas da questão 1.

a. Na View criada na letra a da questão 1, adicione a coluna de BrandName.
b. Na View criada na letra b da questão 1, faça um filtro e considere apenas os
funcionários do sexo feminino.
c. Na View criada na letra c da questão 1, faça uma alteração e filtre apenas as lojas
ativas. 
*/

-- a)

go
alter view vwProdutos as
select
	ProductName,
	ColorName,
	UnitPrice,
	UnitCost,
	BrandName
from DimProduct;
go

select * from vwProdutos;


-- b)

go
alter view vwFuncionarios as
select
	FirstName,
	BirthDate,
	DepartmentName,
	Gender
from DimEmployee
where Gender='F';
go

select * from vwFuncionarios;


-- c)

go
alter view vwLojas as
select
	StoreKey,
	StoreName,
	OpenDate
from DimStore
where CloseDate is null;
go

select * from vwLojas;




/*
6. a) Crie uma View que seja o resultado de um agrupamento da tabela DimProduct. O
resultado esperado da consulta deverá ser o total de produtos por marca. Chame essa
View de vw_6a.

b) Altere a View criada no exercício anterior, adicionando o peso total por marca. Atenção:
sua View final deverá ter então 3 colunas: Nome da Marca, Total de Produtos e Peso Total.

c) Exclua a View vw_6a.
*/

-- a)

