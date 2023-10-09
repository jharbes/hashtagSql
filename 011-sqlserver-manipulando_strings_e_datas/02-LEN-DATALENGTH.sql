-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 2 de 23: LEN e DATALENGTH

-- Exemplo: Descubra a quantidade de caracteres da palavra 'SQL Hashtag'

SELECT
	LEN('SQL Hashtag') AS 'Len', -- 11
	DATALENGTH('SQL Hashtag') AS 'Datalength' -- 11


-- a diferença entre o LEN e o DATALENGTH é que o DATALENGTH CONTABILIZA espaços no FIM da string
-- observe que AMBOS contabilizam espaços vazios no INICIO da string
-- observe o exemplo:

SELECT
	LEN('SQL Hashtag   ') AS 'Len', -- 11
	DATALENGTH('SQL Hashtag   ') AS 'Datalength' -- 14


SELECT
	LEN('  SQL Hashtag   ') AS 'Len', -- 13
	DATALENGTH('  SQL Hashtag   ') AS 'Datalength' -- 16