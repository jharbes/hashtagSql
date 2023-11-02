-- [SQL Server] Fun��es Condicionais
-- Aula 10 de 18: ISNULL - Tratando valores nulos

-- Exemplo: Existem 3 tipos de estoque: High, Mid e Low. Fa�a um SELECT contendo as colunas de ProductKey, ProductName, StockTypeName e Nome do respons�vel pelo produto, de acordo com o tipo de estoque. A regra dever� ser a seguinte:
-- Jo�o � respons�vel pelos produtos High
-- Maria � respons�vel pelos produtos Mid
-- Luis � respons�vel pelos produtos Low

-- IIF Composto nada mais � do que um IIF dentro de outro IIF.

select * from DimProduct;

SELECT
	ProductKey,
	ProductName,
	StockTypeName,
	iif(
		StockTypeName = 'High',
		'Jo�o',
		IIF(
			StockTypeName = 'Mid',
			'Maria',
			'Luis')
			) AS 'Respons�vel'

FROM
	DimProduct;