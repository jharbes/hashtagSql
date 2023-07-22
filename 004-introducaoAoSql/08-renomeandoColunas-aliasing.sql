-- [SQL Server] Introdução ao SQL
-- Aula 8 de 15: Renomeando colunas (aliasing)

-- Comando AS: Renomeando colunas (aliasing)

-- Selecione as 3 colunas da tabela DimProduct: ProductName, BrandName e ColorName

SELECT
	ProductName AS Produto,
	BrandName AS Marca,
	ColorName AS Cor
FROM 
	DimProduct;


-- Podemos também suprimir o comando AS e ele funcionará da mesma maneira:

SELECT
	ProductName Produto,
	BrandName Marca,
	ColorName Cor
FROM 
	DimProduct;



-- Caso haja necessidade de coloca um nome do aliases composto (mais de duas palavras) precisaremos
-- colocar aspas simples('') ou aspas duplas("") no novo nome escolhido, o AS continua sendo opcional:

SELECT
	ProductName AS 'Nome do Produto',
	BrandName 'Nome da Marca',
	ColorName  AS 'Nome da Cor'
FROM 
	DimProduct;


SELECT
	ProductName AS "Nome do Produto",
	BrandName "Nome da Marca",
	ColorName "Nome da Cor"
FROM 
	DimProduct;