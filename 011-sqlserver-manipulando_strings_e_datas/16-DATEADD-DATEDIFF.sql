-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 16 de 23: DATEADD e DATEDIFF

-- DATEADD: Adiciona ou subtrai uma determinada quantidade de dias, meses ou anos a uma data
-- DATEDIFF: Calcula a diferença entre duas datas

DECLARE @varData1 DATETIME, @varData2 DATETIME, @varData3 DATETIME;
SET @varData1 = '10/07/2020';
SET @varData2 = '05/03/2020';
SET @varData3 = '14/11/2021';

-- DATEADD
SELECT
	DATEADD(MONTH, -1, @varData1), -- 2020-06-10 00:00:00.000
	DATEADD(year, 2, @varData2); -- 2022-03-05 00:00:00.000

-- DATEDIFF - calculo: segunda data (terceiro argumento) - primeira data (segundo argumento)
SELECT
	DATEDIFF(MONTH, @varData2, @varData3), -- 20
	datediff(year, @vardata2, @vardata3); -- 1


set @varData3=DATEADD(year,3,@vardata3);
print @vardata3; -- Nov 14 2024 12:00AM