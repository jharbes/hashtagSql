-- Exercicios - joinsNoSql

/*
Os Joins t�m como principal objetivo deixar as tabelas mais informativas, permitindo buscar
dados de uma tabela para outra, de acordo com uma coluna em comum que permita essa
rela��o.
Dito isso, fa�a os seguintes exerc�cios:
*/

use ContosoRetailDW;

/*
1. Utilize o INNER JOIN para trazer os nomes das subcategorias dos produtos, da tabela
DimProductSubcategory para a tabela DimProduct.

*/

select * from DimProduct;
select * from DimProductSubcategory;

select
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	DimProductSubcategory.ProductSubcategoryName
from
	DimProduct
inner join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey;




/*
2. Identifique uma coluna em comum entre as tabelas DimProductSubcategory e
DimProductCategory. Utilize essa coluna para complementar informa��es na tabela
DimProductSubcategory a partir da DimProductCategory. Utilize o LEFT JOIN.

*/

