-- [SQL Server] Fun��es Condicionais
-- Aula 11 de 18: ISNULL - Tratando valores nulos

-- Exemplo: Fa�a uma consulta que substitua todos os valores nulos de CityName da tabela DimGeography pelo texto 'Local desconhecido'.

SELECT
	GeographyKey,
	ContinentName,
	CityName,
	ISNULL(CityName, 'Local desconhecido')
FROM
	DimGeography