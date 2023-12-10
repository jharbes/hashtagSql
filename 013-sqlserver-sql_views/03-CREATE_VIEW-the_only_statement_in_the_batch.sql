-- [SQL Server] Views
-- Aula 3 de 13: CREATE VIEW - The only statement in the batch

-- 1. Exemplos
-- a) Crie uma view contendo as seguintes informa��es da tabela DimCustomer: FirstName, EmailAddress e BirthDate. Chame essa view de vwClientes

CREATE VIEW vwClientes2 AS
SELECT
	FirstName AS 'Nome',
	EmailAddress AS 'E-mail',
	BirthDate AS 'Data Nascimento'
FROM 
	DimCustomer;
GO -- permite demarcar onde come�a e termina um determinado bloco de c�digos, observe que aqui como o inicio era o inicio do arquivo nao precisamos demarcar o inicio, porem caso exista codigo antes do inicio precisariamos de um GO no inicio, conforme exemplo abaixo



-- b) Crie uma View contendo as seguintes informa��es da tabela DimProduct: ProductKey, ProductName, BrandName e UnitPrice. Chame essa view de vwProdutos

GO -- permite demarcar onde come�a e termina um determinado bloco de c�digos
CREATE VIEW vwProdutos2 AS
SELECT
	ProductKey AS 'ID Produto',
	ProductName AS 'Nome do Produto',
	ProductSubcategoryKey AS 'ID Subcategoria',
	BrandName AS 'Marca',
	UnitPrice AS 'Pre�o Unit�rio'
FROM DimProduct;
GO -- permite demarcar onde come�a e termina um determinado bloco de c�digos


SELECT * FROM vwProdutos2;
select * from vwClientes2;