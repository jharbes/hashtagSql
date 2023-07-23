-- [SQL Server] Ordenando e filtrando dados
-- Aula 9 de 27: Where mais Or - Filtrando com mais de uma condição

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- Quais produtos são da marca 'Contoso' OU são da cor 'White'?

SELECT * FROM DimProduct
WHERE BrandName = 'Contoso' OR ColorName = 'White';

-- Observe que o retorno será de TODOS os produtos da marca 'Contoso' MAIS TODOS os produtos de cor 'White'


-- Retorna todos os produtos da marca 'Contoso' e da marca 'Fabrikam'
SELECT * FROM DimProduct
WHERE BrandName = 'Contoso' OR BrandName = 'Fabrikam';