-- [SQL Server] Fun��es de Agrega��o
-- Aula 5 de 12: Fun��es MIN e MAX

-- 1. Fa�a uma consulta que retorna os valores m�ximo e m�nimo de UnitCost.

SELECT
	MAX(UnitCost) AS 'Custo M�ximo',
	MIN(UnitCost) AS 'Custo M�nimo'
FROM
	DimProduct

