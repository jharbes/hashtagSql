-- [SQL Server] Variáveis
-- Aula 6 de 23: FORMAT - Formatação de dados personalizada

--FORMAT: Função para formatação de valores no SQL

-- ***ESTRUTURA GERAL:
-- SELECT FORMAT(valor, formato)
-- POR PADRÃO O RETORNO DO FORMAT SEMPRE SERÁ DE TEXTO

-- a) Numéricos:

-- transforma em formato de numero
SELECT FORMAT(1000, 'N') -- 1.000,00 (criando uma formatacao para o numero, deixa de ser numerico)
SELECT SQL_VARIANT_PROPERTY(FORMAT(1000, 'N'), 'BaseType') -- nvarchar

-- transforma em formato geral
SELECT FORMAT(1000, 'G') -- 1000 (mantem a formatacao basica numerica, deixa de ser numerica)
SELECT SQL_VARIANT_PROPERTY(FORMAT(1000, 'G'), 'BaseType') -- nvarchar

-- b) Personalizados:
SELECT FORMAT(123456789, '###-##-####') -- 123-45-6789
SELECT SQL_VARIANT_PROPERTY(FORMAT(123456789, '###-##-####'), 'BaseType') -- nvarchar

-- c) Data:
SELECT FORMAT(CAST('21/03/2021' AS DATETIME), 'dd/MM/yyyy') -- 21/03/2021 (mudando para nvarchar, porem com formato diferente)
SELECT FORMAT(CAST('21/03/2021' AS DATETIME), 'dd/MMM/yyyy') -- 21/mar/2021 (observe que o M a mais mudou o formato da data, porem com formato diferente)
SELECT FORMAT(CAST('21/03/2021' AS DATETIME), 'dd/MMMM/yyyy') -- 21/março/2021 (observe que o MM a mais mudou o formato da data, porem com formato diferente)
select format(cast('21/03/2021' as datetime), 'dddd') -- domingo
select format(cast('21/03/2021' as datetime), 'MMMM') -- março

SELECT SQL_VARIANT_PROPERTY(FORMAT(CAST('21/03/2021' AS DATETIME), 'dd/MM/yyyy'), 'BaseType') -- nvarchar
SELECT SQL_VARIANT_PROPERTY(FORMAT(CAST('21/03/2021' AS DATETIME), 'dd/MMM/yyyy'), 'BaseType') -- nvarchar
SELECT SQL_VARIANT_PROPERTY(FORMAT(CAST('21/03/2021' AS DATETIME), 'dd/MMMM/yyyy'), 'BaseType') -- nvarchar

-- SQL_VARIANT_PROPERTY
SELECT SQL_VARIANT_PROPERTY('31/05/2014', 'BaseType') -- varchar

SELECT CAST('31/05/2014' AS datetime) -- 2014-05-31 00:00:00.000
SELECT SQL_VARIANT_PROPERTY(CAST('31/05/2014' AS datetime), 'BaseType') -- datetime


-- Exercicio 3:

select 'A data de validade do produto é: ' + FORMAT(cast('17/04/2022' as datetime), 'dd/MMM/yyyy') -- A data de validade do produto é: 17/abr/2022
select 'A data de validade do produto é: ' + FORMAT(cast('17/04/2022' as datetime), 'dd/MMM/yy') -- A data de validade do produto é: 17/abr/22
select 'A data de validade do produto é: ' + FORMAT(cast('17/04/2022' as datetime), 'dddd, dd/MMM/yy') -- A data de validade do produto é: domingo, 17/abr/22
