-- [SQL Server] Ordenando e filtrando dados
-- Aula 15 de 27: Where mais Between - Filtrando entre valores

-- 1. Selecione os funcion�rios que t�m a data de contrata��o entre '01-01-2000' e '31-12-2000'.

SELECT * FROM DimEmployee
WHERE HireDate BETWEEN '2000-01-01' AND '2000-12-31';


SELECT * FROM DimEmployee
WHERE EmployeeKey BETWEEN 223 AND 229;


SELECT * FROM DimProduct
WHERE UnitPrice BETWEEN 50 AND 100;


SELECT * FROM DimProduct
WHERE UnitPrice NOT BETWEEN 50 AND 100;