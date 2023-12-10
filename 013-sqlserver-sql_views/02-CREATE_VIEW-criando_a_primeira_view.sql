-- [SQL Server] Views
-- Aula 2 de 13: CREATE VIEW - Criando a primeira View

/*
Quando falamos em Views, existem 3 a�oes envolvidas:

1- Cria��o de uma View;
2- Altera��o de uma View;
3- Exclus�o de uma View.

Para cada uma dessas a��es temos um comando associado:

1- CREATE VIEW
2- ALTER VIEW
3- DROP VIEW

*/

-- CREATE VIEW

-- 1. Exemplos
-- a) Crie uma view contendo as seguintes informa��es da tabela DimCustomer: FirstName, EmailAddress e BirthDate. Chame essa view de vwClientes

CREATE VIEW vwClientes AS
SELECT
	FirstName AS 'Nome',
	EmailAddress AS 'E-mail',
	BirthDate AS 'Data Nascimento'
FROM 
	DimCustomer;

select * from vwClientes;

-- b) Crie uma View contendo as seguintes informa��es da tabela DimProduct: ProductKey, ProductName, BrandName e UnitPrice. Chame essa view de vwProdutos

CREATE VIEW vwProdutos AS
SELECT
	ProductKey AS 'ID Produto',
	ProductName AS 'Nome do Produto',
	ProductSubcategoryKey AS 'ID Subcategoria',
	BrandName AS 'Marca',
	UnitPrice AS 'Pre�o Unit�rio'
FROM DimProduct;

select * from vwProdutos;