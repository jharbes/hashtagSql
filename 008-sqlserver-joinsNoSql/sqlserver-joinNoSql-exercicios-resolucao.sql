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




/*
4. Complementa a tabela DimProduct com a informa��o de ProductCategoryDescription. Utilize
o LEFT JOIN e retorne em seu SELECT apenas as 5 colunas que considerar mais relevantes

*/

select * from DimProduct;
select * from DimProductCategory;
select * from DimProductSubcategory;

select
	ProductKey,
	ProductName,
	ProductDescription,
	ProductSubcategoryName,
	ProductCategoryName
from
	DimProduct
left join DimProductSubcategory
	on DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey
left join DimProductCategory
	on DimProductSubcategory.ProductCategoryKey=DimProductCategory.ProductCategoryKey;




/*
5. A tabela FactStrategyPlan resume o planejamento estrat�gico da empresa. Cada linha
representa um montante destinado a uma determinada AccountKey.

a) Fa�a um SELECT das 100 primeiras linhas de FactStrategyPlan para reconhecer a tabela.

b) Fa�a um INNER JOIN para criar uma tabela contendo o AccountName para cada
AccountKey da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:
� StrategyPlanKey
� DateKey
� AccountName
� Amount

*/

-- a)
select top(100) * from FactStrategyPlan;

-- b)
select * from DimAccount;

select
	StrategyPlanKey,
	Datekey,
	AccountName,
	Amount
from
	FactStrategyPlan
inner join DimAccount
	on FactStrategyPlan.AccountKey=DimAccount.AccountKey;




/*
6. Vamos continuar analisando a tabela FactStrategyPlan. Al�m da coluna AccountKey que
identifica o tipo de conta, h� tamb�m uma outra coluna chamada ScenarioKey. Essa coluna
possui a numera��o que identifica o tipo de cen�rio: Real, Or�ado e Previs�o.

Fa�a um INNER JOIN para criar uma tabela contendo o ScenarioName para cada ScenarioKey
da tabela FactStrategyPlan. O seu SELECT final deve conter as colunas:

� StrategyPlanKey
� DateKey
� ScenarioName
� Amount

*/

select top(100) * from FactStrategyPlan;
select * from DimScenario;

select
	StrategyPlanKey,
	Datekey,
	ScenarioName,
	Amount
from
	FactStrategyPlan
inner join DimScenario
	on FactStrategyPlan.ScenarioKey=DimScenario.ScenarioKey;




/*
7. Algumas subcategorias n�o possuem nenhum exemplar de produto. Identifique que
subcategorias s�o essas.

*/

select * from DimProduct;
select * from DimProductSubcategory;

select
	DimProductSubcategory.ProductSubCategoryKey,
	ProductSubcategoryName,
	ProductKey
from
	DimProductSubcategory
left join DimProduct
	on DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey
where
	ProductKey is null;




/*
8. A tabela abaixo mostra a combina��o entre Marca e Canal de Venda, para as marcas Contoso,
Fabrikam e Litware. Crie um c�digo SQL para chegar no mesmo resultado

*/

select * from DimChannel;
select top(10) * from FactSales;
select * from DimProduct;

select
	distinct BrandName,
	ChannelName
from
	DimProduct
inner join FactSales
	on DimProduct.ProductKey=FactSales.ProductKey
inner join DimChannel
	on FactSales.channelKey=DimChannel.ChannelKey
where BrandName in ('Contoso','Fabrikam','Litware');

-- ou

select
	distinct BrandName,
	ChannelName
from
	DimProduct
cross join DimChannel
where
	BrandName in ('Contoso','Fabrikam','Litware');




/*
9. Neste exerc�cio, voc� dever� relacionar as tabelas FactOnlineSales com DimPromotion.
Identifique a coluna que as duas tabelas t�m em comum e utilize-a para criar esse
relacionamento.

Retorne uma tabela contendo as seguintes colunas:
� OnlineSalesKey
� DateKey
� PromotionName
� SalesAmount

A sua consulta deve considerar apenas as linhas de vendas referentes a produtos com
desconto (PromotionName <> �No Discount�). Al�m disso, voc� dever� ordenar essa tabela de
acordo com a coluna DateKey, em ordem crescente.

*/

select top(10) * from FactOnlineSales;
select * from DimPromotion;

select
	OnlineSalesKey,
	DateKey,
	PromotionName,
	SalesAmount
from
	FactOnlineSales
inner join DimPromotion
	on FactOnlineSales.PromotionKey=DimPromotion.PromotionKey
where
	PromotionName!='No Discount'
order by DateKey;




/*
10. A tabela abaixo � resultado de um Join entre a tabela FactSales e as tabelas: DimChannel,
DimStore e DimProduct.
Recrie esta consulta e classifique em ordem crescente de acordo com SalesAmount.

*/

