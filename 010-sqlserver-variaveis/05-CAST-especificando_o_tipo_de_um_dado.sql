-- [SQL Server] Variáveis
-- Aula 5 de 23: CAST - Especificando o tipo de um dado

-- 1) CAST: Função para especificar o tipo dos valores.
-- int: inteiro, float: decimal, varchar: string/texto, datetime: data e hora

SELECT CAST(21.45 AS int) -- o numero 21.45 será truncado em 21
SELECT SQL_VARIANT_PROPERTY(CAST(21.45 AS int), 'BaseType') -- int

SELECT CAST(21.45 AS float)
SELECT SQL_VARIANT_PROPERTY(CAST(21.45 AS float), 'BaseType') -- float

SELECT CAST(18.7 AS varchar)
SELECT SQL_VARIANT_PROPERTY(CAST(18.7 AS varchar), 'BaseType') -- varchar

SELECT CAST('15.6' AS float)
SELECT SQL_VARIANT_PROPERTY(CAST('15.6' AS float), 'BaseType') -- float

SELECT CAST('31/05/2014' AS datetime) -- 2014-05-31 00:00:00.000
SELECT SQL_VARIANT_PROPERTY(CAST('31/05/2014' AS datetime), 'BaseType') -- datetime




-- Exemplo 1: Crie uma consulta juntando o texto 'O preço do produto é: ' com o valor 30.99

SELECT 'O preço do produto é: ' + 30.99 -- ***  ERRO: o 30.99 sera lido como numeric e nao sera concatenado

SELECT 'O preço do produto é: ' + CAST(30.99 AS VARCHAR(30)) -- O preço do produto é: 30.99

select CONCAT('O preço do produto é: ',CAST(30.99 AS VARCHAR(30))) -- O preço do produto é: 30.99



-- Exemplo 2: Adicione 1 dia à data '20/06/2021'

-- operador de soma em date funcionará apenas para DATETIME dessa maneira

SELECT CAST('20/06/2021' AS DATE) + 1 -- *** ERRO: DATE nao suporta soma algebrica dessa maneira

SELECT CAST('20/06/2021' AS DATETIME) + 1 -- 2021-06-21 00:00:00.000
select datetimefromparts(2021,06,20,0,0,0,0) + 1 -- 2021-06-21 00:00:00.000
