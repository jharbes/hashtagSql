-- [SQL Server] Criando agrupamentos no SQL
-- Aula 4 de 18: Group By + Order By


--SELECT * FROM DimStore

SELECT
	StoreType,
	SUM(EmployeeCount) AS 'Qtd. Total Funcion�rios'
FROM
	DimStore
GROUP BY StoreType
ORDER BY SUM(EmployeeCount) DESC

-- ou, com mesmo resultado:

SELECT
	StoreType,
	SUM(EmployeeCount) AS 'Qtd. Total Funcion�rios'
FROM
	DimStore
GROUP BY StoreType
ORDER BY 'Qtd. Total Funcion�rios' DESC
