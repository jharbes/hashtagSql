-- [SQL Server] Ordenando e filtrando dados
-- Aula 16 de 27: Where mais Is Null e Is Not Null - Filtrando valores nulos

-- 1. Selecione os clientes que s�o pessoa f�sica.

SELECT * FROM DimCustomer
WHERE CompanyName IS NULL;


-- 2. Selecione os clientes que s�o pessoa jur�dica.

SELECT * FROM DimCustomer
WHERE CompanyName IS NOT NULL;


-- 3. Selecione os funcion�rios que est�o em atividade

SELECT * FROM DimEmployee
WHERE EndDate IS NULL;


-- 4. Selecione os funcion�rios que N�O est�o em atividade

SELECT * FROM DimEmployee
WHERE EndDate IS NOT NULL;