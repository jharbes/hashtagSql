-- [SQL Server] Ordenando e filtrando dados
-- Aula 13 de 27: Where mais IN - Alternativa ao OR com m�ltiplas condi��es

-- Podemos utilizar o operador IN como alternativa aos m�ltiplos OR.

-- Exemplo: Selecione os funcion�rios que s�o de qualquer um desses 3 departamentos: Production, Marketing, Engineering.

SELECT * FROM DimEmployee
WHERE DepartmentName IN ('Production', 'Marketing', 'Engineering')