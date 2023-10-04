-- [SQL Server] Vari�veis
-- Aula 4 de 23: SQL_VARIANT_PROPERTY - Identificando o tipo de um dado

SELECT 10 AS 'N�mero'
SELECT 49.50 AS 'Decimal'
SELECT 'Marcus' AS 'Nome'
SELECT '20/06/2021' AS 'Data'

SELECT SQL_VARIANT_PROPERTY(10, 'BaseType')
SELECT SQL_VARIANT_PROPERTY(49.50, 'BaseType')
SELECT SQL_VARIANT_PROPERTY('Marcus', 'BaseType')
SELECT SQL_VARIANT_PROPERTY('20/06/2021', 'BaseType')