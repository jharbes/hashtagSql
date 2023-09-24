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

select * from DimProductCategory;
select * from DimProductSubcategory;

select
	ProductSubcategoryKey as 'ID da Subcategoria',
	ProductSubcategoryName as 'Nome da Subcategoria',
	ProductSubcategoryDescription as 'Descri��o da Subcategoria',
	DimProductSubcategory.ProductCategoryKey 'ID da Categoria',
	ProductCategoryName as 'Nome da Categoria'
from
	DimProductSubcategory
left join DimProductCategory
	on DimProductSubcategory.ProductCategoryKey=DimProductCategory.ProductCategoryKey;




/*
3. Para cada loja da tabela DimStore, descubra qual o Continente e o Nome do Pa�s associados
(de acordo com DimGeography). Seu SELECT final deve conter apenas as seguintes colunas:
StoreKey, StoreName, EmployeeCount, ContinentName e RegionCountryName. Utilize o LEFT
JOIN neste exerc�cio

*/

select * from DimStore;
select * from DimGeography;

select
	StoreKey as 'ID da Loja',
	StoreName as 'Nome da Loja',
	EmployeeCount as 'N�mero de Funcion�rios',
	ContinentName as 'Nome do Continente',
	RegionCountryName as 'Nome do Pa�s'
from
	DimStore
left join DimGeography
	on DimStore.GeographyKey=DimGeography.GeographyKey;