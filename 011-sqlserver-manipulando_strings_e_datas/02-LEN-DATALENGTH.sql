-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 2 de 23: LEN e DATALENGTH

-- Exemplo: Descubra a quantidade de caracteres da palavra 'SQL Hashtag'

SELECT
	LEN('SQL Hashtag') AS 'Len', -- 11
	DATALENGTH('SQL Hashtag') AS 'Datalength' -- 11


-- a diferen�a entre o LEN e o DATALENGTH � que o DATALENGTH CONTABILIZA espa�os no FIM da string
-- observe que AMBOS contabilizam espa�os vazios no INICIO da string
-- observe o exemplo:

SELECT
	LEN('SQL Hashtag   ') AS 'Len', -- 11
	DATALENGTH('SQL Hashtag   ') AS 'Datalength' -- 14


SELECT
	LEN('  SQL Hashtag   ') AS 'Len', -- 13
	DATALENGTH('  SQL Hashtag   ') AS 'Datalength' -- 16