-- [SQL Server] Ordenando e filtrando dados
-- Aula 15 de 27: Where mais Between - Filtrando entre valores

-- 1. Selecione os funcion�rios que t�m a data de contrata��o entre '01-01-2000' e '31-12-2000'.

SELECT * FROM DimEmployee
WHERE HireDate BETWEEN '2000-01-01' AND '2000-12-31'