-- [SQL Server] Ordenando e filtrando dados
-- Aula 13 de 27: Where mais IN - Alternativa ao OR com m�ltiplas condi��es

-- Podemos utilizar o operador IN como alternativa aos m�ltiplos OR.
-- Em vez de utilizarmos diversas vezes o OR utilizaremos apenas um IN e enumeraremos as op��es conforme o exemplo abaixo

-- Exemplo: Selecione os funcion�rios que s�o de qualquer um desses 3 departamentos: Production, Marketing, Engineering.

-- Observe abaixo que ambas as linhas do WHERE resultar�o no mesmo resultado e s�o equivalentes

SELECT * FROM DimEmployee
WHERE DepartmentName IN ('Production', 'Marketing', 'Engineering');
--WHERE DepartmentName = 'Production' OR DepartmentName = 'Marketing' OR DepartmentName = 'Engineering';