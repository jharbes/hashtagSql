-- [SQL Server] Vari�veis
-- Aula 11 de 23: Utilizando uma vari�vel em uma consulta (Parte 1)


-- Aplique um desconto de 10% em todos os pre�os dos produtos. Sua consulta final deve conter as colunas ProductKey, ProductName, UnitPrice e Pre�o com Desconto. 

-- observe no exemplo abaixo por meio do DECLARE e do SET que as variaveis, assim como os comandos
-- em SQL N�O S�O CASE SENSITIVE
DECLARE @varDesconto FLOAT
SET @vardesconto = 0.1

SELECT 
	ProductKey AS 'ID',
	ProductName AS 'Nome do Produto',
	UnitPrice AS 'Pre�o',
	UnitPrice * (1 - @varDesconto) AS 'Pre�o com Desconto'
FROM
	DimProduct
