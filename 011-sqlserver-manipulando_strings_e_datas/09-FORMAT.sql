-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 9 de 23: FORMAT


--SELECT * FROM DimCustomer

-- Formata��o de Data
SELECT 
	GETDATE() AS 'Data',
	FORMAT(GETDATE(),'dd/MMMM/yyyy','pt-br') AS 'Data Formatada'

-- Formata��o de N�mero
SELECT 
	50123 AS 'N�mero',
	FORMAT(5123, '000000.00') AS 'N�mero Formatado'

-- Formata��o de Moeda
SELECT 
	3670.5 AS 'Moeda',
	FORMAT(5670.5, 'R$####.00') AS 'Moeda Formatada'


-- Formatar as colunas de Data de Nascimento e Renda Anual da tabela DimCustomer, de acordo com as formata��es aprendidas.

SELECT
	FirstName AS 'Nome',
	BirthDate AS 'Data de Nascimento',
	FORMAT(BirthDate, 'dd/MMMM/yyyy', 'pt-BR') AS 'Data Formatada',
	YearlyIncome AS 'Renda Anual',
	FORMAT(YearlyIncome, 'R$##,###.00') AS 'Renda Anual Formatada'
FROM
	DimCustomer
