-- [SQL Server] Ordenando e filtrando dados
-- Aula 14 de 27: Where mais Like - Filtro especial para textos

-- 1. Selecione todos os produtos que possuem o texto 'MP3 Player' contido na nome do produto.

SELECT * FROM DimProduct
WHERE ProductName LIKE '%MP3 Player%';


-- 2. Selecione todos os produtos que t�m a descri��o do nome come�ando por 'Type'.

SELECT * FROM DimProduct
WHERE ProductDescription LIKE 'Type%';


-- 3. Selecione todos os produtos que t�m a descri��o do nome terminando em 'WMA'.

SELECT * FROM DimProduct
WHERE ProductDescription LIKE '%WMA';
