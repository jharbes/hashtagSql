-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 14 de 23: DAY, MONTH, YEAR e DATEFROMPARTS

-- Utilize as fun��es DAY, MONTH e YEAR para descobrir o dia, m�s e ano da data: 18/05/2020

DECLARE @varData DATETIME
SET @varData = '18/05/2020'

SELECT
	SQL_VARIANT_PROPERTY(@varData, 'BaseType') as 'Tipo de @varData', -- datetime
	DAY(@varData) AS 'Dia', -- 18
	SQL_VARIANT_PROPERTY(DAY(@varData), 'BaseType') as 'Tipo de DAY()', -- int
	MONTH(@varData) AS 'M�s', -- 5
	SQL_VARIANT_PROPERTY(MONTH(@varData), 'BaseType') as 'Tipo de MONTH()', -- int
	YEAR(@varData) AS 'Ano', -- 2020
	SQL_VARIANT_PROPERTY(YEAR(@varData), 'BaseType') as 'Tipo de YEAR()'; -- int


-- Utilize a fun��o DATEFROMPARTS para obter uma data a partir das informa��es de dia, m�s e ano

DECLARE @varDia INT, @varMes INT, @varAno INT
SET @varDia = 29
SET @varMes = 12
SET @varAno = 2020

SELECT
	DATEFROMPARTS(@varAno, @varMes, @varDia) AS 'Data', -- 2020-12-29
	SQL_VARIANT_PROPERTY(DATEFROMPARTS(@varAno, @varMes, @varDia), 'BaseType') as 'Tipo da Data'; -- date