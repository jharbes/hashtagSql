-- [SQL Server] Fun��es de Agrega��o
-- Aula 6 de 12: Fun��o AVG

-- 1. Fa�a uma consulta que retorna a m�dia de YearlyIncome (m�dia de sal�rio) da tabela DimCustomer.

SELECT
	AVG(YearlyIncome) AS 'M�dia Anual de Sal�rio'
FROM
	DimCustomer;


select max(YearlyIncome) from DimCustomer;
