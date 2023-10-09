-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 9 de 23: FORMAT


--SELECT * FROM DimCustomer


-- Formatação de Data

select FORMAT(CAST('2020-23-04' as datetime), 'dd/MM/yyyy'); -- 23/04/2020

select FORMAT(CAST('23/04/2020' as datetime), 'dd/MM/yyyy'); -- 23/04/2020

select FORMAT(CAST('23/04/2020' as datetime), 'dd/MMM/yyyy'); -- 23/abr/2020

select FORMAT(CAST('23/04/2020' as datetime), 'dd/MMM/yyyy', 'pt-BR'); -- 23/abr-2020

select FORMAT(CAST('23/04/2020' as datetime), 'dd/MMM/yyyy', 'en-US'); -- 23/Apr/2020

SELECT 
	GETDATE() AS 'Data', -- 2023-10-09 11:01:08.680
	FORMAT(GETDATE(),'dd/MMMM/yyyy','pt-br') AS 'Data Formatada'; -- 09/outubro/2023


-- DIA:

select FORMAT(CAST('23/04/2020' as datetime), 'dd'); -- 23

select FORMAT(CAST('23/04/2020' as datetime), 'ddd'); -- qui

select FORMAT(CAST('23/04/2020' as datetime), 'dddd'); -- quinta-feira

select FORMAT(CAST('23/04/2020' as datetime), 'ddd', 'en-US'); -- Thu

select FORMAT(CAST('23/04/2020' as datetime), 'dddd', 'en-US'); -- Thursday


-- MÊS

select FORMAT(CAST('23/04/2020' as datetime), 'MM'); -- 04

select FORMAT(CAST('23/04/2020' as datetime), 'MMM'); -- abr

select FORMAT(CAST('23/04/2020' as datetime), 'MMMM'); -- abril

select FORMAT(CAST('23/04/2020' as datetime), 'MMM', 'en-US'); -- Apr

select FORMAT(CAST('23/04/2020' as datetime), 'MMMM', 'en-US'); -- April


-- Formatação de Número

-- Número formatado na formatação GERAL
select FORMAT(5123, 'G'); -- 5123

-- Número formatado na formtação de NÚMERO
select FORMAT(5123, 'N'); -- 5.123,00

-- Número formatado como MOEDA 'CURRENCY'
select FORMAT(5123, 'C');

SELECT 
	50123 AS 'Número', -- 50123
	FORMAT(5123, '000000.00') AS 'Número Formatado'; -- 005123,00


-- Formatação de Moeda
SELECT 
	3670.5 AS 'Moeda', -- 3670.5
	FORMAT(5670.5, 'R$####.00') AS 'Moeda Formatada'; -- R$5670,50


-- Formatação Personalizada
select FORMAT(1234567, '##-##-###'); -- 12-34-567


-- Formatar as colunas de Data de Nascimento e Renda Anual da tabela DimCustomer, de acordo com as formatações aprendidas.

SELECT
	FirstName AS 'Nome',
	BirthDate AS 'Data de Nascimento',
	FORMAT(BirthDate, 'dd/MMMM/yyyy', 'pt-BR') AS 'Data Formatada',
	YearlyIncome AS 'Renda Anual',
	FORMAT(YearlyIncome, 'R$##,###.00') AS 'Renda Anual Formatada'
FROM
	DimCustomer;
