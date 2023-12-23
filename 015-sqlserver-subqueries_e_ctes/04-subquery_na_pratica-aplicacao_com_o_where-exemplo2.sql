-- [SQL Server] [Subqueries e CTE's] Aula 4 de 28: Subquery na pr�tica - Aplica��o com o Where (Exemplo 2)

-- Para entender a ideia por tr�s das subqueries, vamos come�ar fazendo 3 exemplos com a aplica��o WHERE.

-- Exemplo 2: Fa�a uma consulta para retornar os produtos da categoria 'Televisions'. Tome cuidado pois n�o temos a informa��o de Nome da Subcategoria na tabela DimProduct. Dessa forma, precisaremos criar um SELECT que descubra o ID da categoria 'Televisions' e passar esse resultado como o valor que queremos filtrar dentro do WHERE.


SELECT * FROM DimProduct
WHERE ProductSubcategoryKey = 
	(SELECT ProductSubcategoryKey FROM DimProductSubcategory
		WHERE ProductSubcategoryName = 'Televisions')