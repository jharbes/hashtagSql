-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 15 de 23: GETDATE, SYSDATETIME, DATEPART e DATENAME

-- GETDATE: Retorna a data/hora atual do sistema
-- SYSDATETIME: Retorna a data/hora atual do sistema (mais preciso que a GETDATE)
-- DATENAME e DATEPART: Retornam informações (dia, mês, ano, semana, etc) de uma data

SELECT GETDATE(); -- 2023-10-09 15:23:50.390
SELECT SYSDATETIME(); -- 2023-10-09 15:23:50.3942775



-- DATENAME: Retorna o resultado em formato de TEXTO (nvarchar)

DECLARE @varData DATETIME;
SET @varData = GETDATE();

SELECT
	DATENAME(DAY, @varData) AS 'Dia', -- 9
	DATENAME(MONTH, @varData) AS 'Mês', -- Outubro
	DATENAME(YEAR, @varData) AS 'Ano', -- 2023
	DATENAME(DAYOFYEAR, @varData) AS 'Dia do ano'; -- 282



-- DATEPART: Retorna o resultado em formato de NÚMERO (int)

DECLARE @varData1 DATETIME;
SET @varData1 = GETDATE();

SELECT
	DATEPART(DAY, @varData1) AS 'Dia', -- 9
	DATEPART(MONTH, @varData1) AS 'Mês', -- 10
	DATEPART(YEAR, @varData1) AS 'Ano', -- 2023
	DATEPART(DAYOFYEAR, @varData1) AS 'Dia do ano'; -- 282

SELECT
	SQL_VARIANT_PROPERTY(DATENAME(DAY, @varData1), 'BaseType'), -- nvarchar
	SQL_VARIANT_PROPERTY(DATEPART(DAY, @varData1), 'BaseType'), -- int
	SQL_VARIANT_PROPERTY(DATENAME(DAYOFYEAR, @varData1), 'BaseType'), -- nvarchar
	SQL_VARIANT_PROPERTY(DATEPART(DAYOFYEAR, @varData1), 'BaseType'); -- int