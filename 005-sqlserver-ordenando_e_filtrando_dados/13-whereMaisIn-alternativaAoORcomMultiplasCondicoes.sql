-- [SQL Server] Ordenando e filtrando dados
-- Aula 13 de 27: Where mais IN - Alternativa ao OR com múltiplas condições

-- Podemos utilizar o operador IN como alternativa aos múltiplos OR.
-- Em vez de utilizarmos diversas vezes o OR utilizaremos apenas um IN e enumeraremos as opções conforme o exemplo abaixo

-- Exemplo: Selecione os funcionários que são de qualquer um desses 3 departamentos: Production, Marketing, Engineering.

-- Observe abaixo que ambas as linhas do WHERE resultarão no mesmo resultado e são equivalentes

SELECT * FROM DimEmployee
WHERE DepartmentName IN ('Production', 'Marketing', 'Engineering');
--WHERE DepartmentName = 'Production' OR DepartmentName = 'Marketing' OR DepartmentName = 'Engineering';