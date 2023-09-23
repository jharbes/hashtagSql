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



-- nesse caso o resultado do 'inner join' foi igual ao resultado do 'left join'
-- ou seja, todos os produtos tem uma subcategoria associada
select
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
from
	DimProduct
left join
	DimProductSubcategory
on
	DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey;



-- nesse caso o resultado é diferente do 'inner join' e do 'left join', pois existem
-- subcategorias que não tem nenhum produto associado (no fim da consulta)
-- (resultado maior que as ultimas duas consultas)
select
	ProductKey,
	ProductName,
	DimProduct.ProductSubcategoryKey,
	ProductSubcategoryName
from
	DimProduct
right join
	DimProductSubcategory
on
	DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey;