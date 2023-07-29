-- [SQL Server] Ordenando e filtrando dados
-- Aula 16 de 27: Where mais Is Null e Is Not Null - Filtrando valores nulos

-- 1. Selecione os clientes que são pessoa física.

SELECT * FROM DimCustomer
WHERE CompanyName IS NULL;


-- 2. Selecione os clientes que são pessoa jurídica.

SELECT * FROM DimCustomer
WHERE CompanyName IS NOT NULL;


-- 3. Selecione os funcionários que estão em atividade

SELECT * FROM DimEmployee
WHERE EndDate IS NULL;


-- 4. Selecione os funcionários que NÃO estão em atividade

SELECT * FROM DimEmployee
WHERE EndDate IS NOT NULL;