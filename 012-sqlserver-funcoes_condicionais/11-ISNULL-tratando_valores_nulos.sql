-- [SQL Server] Funções Condicionais
-- Aula 11 de 18: ISNULL - Tratando valores nulos


-- A função ISNULL servirá para substituir os valores que estejam como NULOS por outro de sua escolha

-- Funcionamento
-- ISNULL(<parametro_ou_coluna>,<valor_desejado_para_substituicao>)

-- Exemplo: Faça uma consulta que substitua todos os valores nulos de CityName da tabela DimGeography pelo texto 'Local desconhecido'.


select * from DimGeography;


SELECT
	GeographyKey,
	ContinentName,
	CityName,
	ISNULL(CityName, 'Local desconhecido')
FROM
	DimGeography;