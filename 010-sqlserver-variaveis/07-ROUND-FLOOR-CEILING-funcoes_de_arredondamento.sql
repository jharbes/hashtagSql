-- [SQL Server] Variáveis
-- Aula 7 de 23: ROUND, FLOOR e CEILING - Funções de Arredondamento

-- Operações com números

SELECT 10+20
SELECT 20-5
SELECT 31*40
SELECT 431.0/23


-- ROUND (arredonda com o numero de casas decimais desejados)

-- SINTAXE
-- ROUND ( numeric_expression , length [ ,function ] )


SELECT ROUND(18.739130, 2) -- 18.740000
SELECT ROUND(18.739130, 2, 0) -- 18.740000 (observe que o 0 é o valor padrao para o terceiro argumento)

SELECT SQL_VARIANT_PROPERTY(ROUND(18.739130, 2), 'BaseType') -- numeric

SELECT ROUND(18.739130, 1) -- 18.700000
SELECT ROUND(18.739130, 0) -- 19.000000
SELECT ROUND(18.739130, -1) -- 20.000000
SELECT ROUND(18.739130, -2) -- 0.000000



-- ROUND (Trunca com o numero de casas decimais desejados)
-- o terceiro argumento=1 indica um truncamento

SELECT ROUND(18.739130, 2, 1) -- 18.730000
SELECT ROUND(18.739000, 3, 1) -- 18.730000
SELECT SQL_VARIANT_PROPERTY(ROUND(18.739130, 2, 1), 'BaseType') -- numeric


-- FLOOR = chão - truncamento (retorna o inteiro imediatamente inferior)

SELECT FLOOR(18.739130) -- 18
SELECT SQL_VARIANT_PROPERTY(FLOOR(18.739130), 'BaseType') -- numeric


-- CEILING = teto - arredondamento para o inteiro mais proximo

SELECT CEILING(18.739130) -- 19
SELECT SQL_VARIANT_PROPERTY(CEILING(18.739130), 'BaseType') -- numeric
