-- [SQL Server] Ordenando e filtrando dados
-- Aula 10 de 27: Where mais Not - Negando o filtro utilizado

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- Quais funcion�rios N�O s�o do departamento de 'Marketing'?

SELECT * FROM DimEmployee
WHERE NOT DepartmentName = 'Marketing'