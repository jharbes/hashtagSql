-- [SQL Server] [Subqueries e CTE's] Aula 12 e 13 de 28: Subquery aninhada

-- Exemplo: Descubra os nomes dos clientes que ganham o segundo maior sal�rio.

SELECT * FROM DimCustomer
WHERE CustomerType = 'Person'
ORDER BY YearlyIncome DESC

SELECT DISTINCT TOP(2) YearlyIncome FROM DimCustomer
WHERE CustomerType = 'Person'
ORDER BY YearlyIncome DESC

SELECT
	CustomerKey,
	FirstName,
	LastName,
	YearlyIncome
FROM DimCustomer
WHERE YearlyIncome = 160000


--1. Descobrir o maior sal�rio
--2. Descobrir o segundo maior sal�rio
--3. Descobrir os nomes dos clientes que ganham o segundo maior sal�rio



SELECT
	CustomerKey,
	FirstName,
	LastName,
	YearlyIncome
FROM DimCustomer
WHERE YearlyIncome = (
	SELECT
		MAX(YearlyIncome)
	FROM DimCustomer
	WHERE
		YearlyIncome < (
			SELECT 
				MAX(YearlyIncome) 
			FROM DimCustomer	
			WHERE CustomerType = 'Person'
	)
)

