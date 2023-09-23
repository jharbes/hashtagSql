-- 16-multiplosJoins

select ProductKey, ProductName, ProductSubcategoryKey from DimProduct;

select ProductSubcategoryKey, ProductSubcategoryName, ProductCategoryKey from DimProductSubcategory;

select ProductCategoryKey,ProductCategoryName from DimProductCategory;


-- faremos uma relacao entre as tres tabelas para trazer o NOME DA CATEGORIA para a tabela de produto,
-- pois a tabela do produto em si nao possui a chave estrangeira ProductCategoryKey, porem possui a chave
-- estrangeira ProductSubcategoryKey que por sua vez em sua tabela possui a chave estrangeira desejada

select
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName,
	DimProductSubcategory.ProductCategoryKey,
	ProductCategoryName
from
	DimProduct
inner join
	DimProductSubcategory
on	DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey
inner join
	DimProductCategory
on
	DimProductSubcategory.ProductCategoryKey=DimProductCategory.ProductCategoryKey;