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

