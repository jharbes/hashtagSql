-- [SQL Server] Criando agrupamentos no SQL
-- Aula 3 de 18: Group By (Parte 2)


-- Consulta 1
SELECT * FROM DimStore

-- o group by automaticamente evoca o distinct para a coluna desejada


-- somatorio do numero total de funcionarios das lojas, porem dividos pelo tipos de lojas existentes
-- utilizamos a coluna do tipo de loja para facilitar o entendimento,identificacao e visualizacao
SELECT
	StoreType,
	SUM(EmployeeCount) AS 'Qtd. Total Funcionários'
FROM
	DimStore
GROUP BY StoreType



-- Consulta 2
SELECT * FROM DimProduct


-- boa pratica para facilitar a visualizacao/identificacao comecar o select pela
-- coluna que deseja agrupar
SELECT
	BrandName,
	AVG(UnitCost) AS 'Custo Médio'
FROM
	DimProduct
GROUP BY BrandName




-- Consulta 3
SELECT * FROM DimProduct



SELECT
	ClassName AS 'Classe do Produto',
	MAX(UnitPrice) AS 'Máximo Preço'
FROM
	DimProduct
GROUP BY ClassName
