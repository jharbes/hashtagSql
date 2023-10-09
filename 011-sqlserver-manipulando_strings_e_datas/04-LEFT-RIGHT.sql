-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 4 de 23: LEFT e RIGHT

-- LEFT ---> Extrai uma determinada quantidade de caracteres de um texto, da esquerda para a direita

select LEFT('12345678', 4); -- 1234


-- RIGHT ---> Extrai uma determinada quantidade de caracteres de um texto, da direita para a esquerda

select RIGHT('12345678', 4); -- 5678


-- Exemplo: Faça uma consulta à tabela DimProduct e divida a coluna de StyleName em 2 partes

SELECT * FROM DimProduct;

SELECT
	ProductKey as 'ID do Produto',
	ProductName AS 'Produto',
	UnitPrice AS 'Preço',
	StyleName,
	LEFT(StyleName, 7) AS 'Cod 1',
	RIGHT(StyleName, 7) AS 'Cod 2'
FROM
	DimProduct;
