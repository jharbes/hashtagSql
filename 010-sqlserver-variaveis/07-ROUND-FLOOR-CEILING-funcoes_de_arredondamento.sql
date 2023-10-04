-- [SQL Server] Variáveis
-- Aula 7 de 23: ROUND, FLOOR e CEILING - Funções de Arredondamento

-- Operações com números

SELECT 10+20
SELECT 20-5
SELECT 31*40
SELECT 431.0/23


-- ROUND (arredonda com o numero de casas decimais desejados)

SELECT ROUND(18.739130, 2) -- 18.740000
SELECT SQL_VARIANT_PROPERTY(ROUND(18.739130, 2), 'BaseType') -- numeric


-- ROUND (Trunca com o numero de casas decimais desejados)

SELECT ROUND(18.739130, 2, 1) -- 18.730000
SELECT SQL_VARIANT_PROPERTY(ROUND(18.739130, 2, 1), 'BaseType')


-- FLOOR - truncamento (retorna o inteiro imediatamente inferior)

SELECT FLOOR(18.739130) -- 18
SELECT SQL_VARIANT_PROPERTY(FLOOR(18.739130), 'BaseType') -- numeric


-- CEILING - arredondamento para o inteiro mais proximo

SELECT CEILING(18.739130) -- 19
SELECT SQL_VARIANT_PROPERTY(CEILING(18.739130), 'BaseType') -- numeric
