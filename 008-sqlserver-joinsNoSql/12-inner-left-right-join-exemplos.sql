-- 12-inner-left-right-join-exemplos

select ProductKey, ProductName, ProductSubcategoryKey from DimProduct;
select ProductSubcategoryKey, ProductSubcategoryName from DimProductSubcategory;


select
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
from
	DimProduct
inner join
	DimProductSubcategory
on
	DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey;