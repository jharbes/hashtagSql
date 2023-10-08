-- [SQL Server] Vari�veis
-- Aula 11 de 23: Utilizando uma vari�vel em uma consulta (Parte 1)


-- Aplique um desconto de 10% em todos os pre�os dos produtos. Sua consulta final deve conter as colunas ProductKey, ProductName, UnitPrice e Pre�o com Desconto. 

DECLARE @varDesconto FLOAT
SET @varDesconto = 0.1

SELECT 
	ProductKey AS 'ID',
	ProductName AS 'Nome do Produto',
	UnitPrice AS 'Pre�o',
	UnitPrice * (1 - @varDesconto) AS 'Pre�o com Desconto'
FROM
	DimProduct
