-- [SQL Server] Fun��es Condicionais
-- Aula 6 de 18: CASE com os operadores l�gicos AND e OR

-- Fa�a uma consulta � tabela DimProduct e retorne as colunas ProductName, BrandName, ColorName, UnitPrice e uma coluna de pre�o com desconto.

-- a) Caso o produto seja da marca Contoso E da cor Red, o desconto do produto ser� de 10%. Caso contr�rio, n�o ter� nenhum desconto.


SELECT
	ProductName,
	BrandName,
	ColorName,
	UnitPrice,
	CASE
		WHEN BrandName = 'Contoso' AND ColorName = 'Red' THEN 0.1
		ELSE 0
	END AS 'Pre�o com desconto'
FROM
	DimProduct


SELECT
	ProductName,
	BrandName,
	ColorName,
	UnitPrice,
	CASE
		WHEN BrandName = 'Contoso' AND ColorName = 'Red' THEN UnitPrice*0.9
		ELSE UnitPrice
	END AS 'Pre�o com desconto'
FROM
	DimProduct


-- b) Caso o produto seja da marca Litware OU Fabrikam, ele receber� um desconto de 5%. Caso contr�rio, n�o ter� nenhum desconto.

SELECT
	ProductName,
	BrandName,
	ColorName,
	UnitPrice,
	CASE
		WHEN BrandName = 'Litware' OR BrandName = 'Fabrikam' THEN 0.05
		ELSE 0
	END AS 'Pre�o com desconto'
FROM
	DimProduct



SELECT
	ProductName,
	BrandName,
	ColorName,
	UnitPrice,
	CASE
		WHEN BrandName = 'Litware' OR BrandName = 'Fabrikam' THEN UnitPrice*0.95
		ELSE UnitPrice
	END AS 'Pre�o com desconto'
FROM
	DimProduct