-- [SQL Server] Ordenando e filtrando dados
-- Aula 5 de 27: Where (Pt. 2) - Filtrando colunas de texto

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- Quais produtos s�o da marca 'Fabrikam'?

SELECT * FROM DimProduct
WHERE BrandName = 'Fabrikam';

-- Quais produtos s�o da cor 'Black'?

SELECT * FROM DimProduct
WHERE ColorName = 'Black';

-- Quais produtos s�o da cor 'Black' e do fornecedor 'Fabrikam'?

SELECT * FROM DimProduct
WHERE ColorName = 'Black' and BrandName = 'Fabrikam';