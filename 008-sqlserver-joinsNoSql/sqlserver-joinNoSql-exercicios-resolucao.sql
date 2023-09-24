-- Exercicios - joinsNoSql

/*
Os Joins têm como principal objetivo deixar as tabelas mais informativas, permitindo buscar
dados de uma tabela para outra, de acordo com uma coluna em comum que permita essa
relação.
Dito isso, faça os seguintes exercícios:
*/

use ContosoRetailDW;

/*
1. Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela
DimProductSubcategory para a tabela DimProduct.

*/

select
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	DimProductSubcategory.ProductSubcategoryName
from
	DimProduct
inner join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductCategoryKey;