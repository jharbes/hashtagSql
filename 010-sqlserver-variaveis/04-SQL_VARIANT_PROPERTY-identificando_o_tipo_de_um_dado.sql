-- [SQL Server] Variáveis
-- Aula 4 de 23: SQL_VARIANT_PROPERTY - Identificando o tipo de um dado

SELECT 10 AS 'Número'
SELECT 49.50 AS 'Decimal'
SELECT 'Marcus' AS 'Nome'
SELECT '20/06/2021' AS 'Data'

-- operador de soma em date funcionará apenas para datetime dessa maneira
SELECT datefromparts(2021,06,20) as 'Data 2'
select datetimefromparts(2021,06,20,0,0,0,0) + 1

SELECT SQL_VARIANT_PROPERTY(10, 'BaseType') -- int
SELECT SQL_VARIANT_PROPERTY(49.50, 'BaseType') -- numeric
SELECT SQL_VARIANT_PROPERTY('Marcus', 'BaseType') -- varchar
SELECT SQL_VARIANT_PROPERTY('20/06/2021', 'BaseType') -- varchar
SELECT SQL_VARIANT_PROPERTY(datefromparts(2021,06,20), 'BaseType') -- date