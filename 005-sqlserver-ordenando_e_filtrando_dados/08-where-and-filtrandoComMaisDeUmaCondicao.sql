-- [SQL Server] Ordenando e filtrando dados
-- Aula 8 de 27: Where mais And - Filtrando com mais de uma condi��o

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- Quais produtos s�o da marca 'Fabrikam' E TAMB�M s�o da cor 'Black'?

SELECT * FROM DimProduct
WHERE BrandName = 'Fabrikam' AND ColorName = 'Black'