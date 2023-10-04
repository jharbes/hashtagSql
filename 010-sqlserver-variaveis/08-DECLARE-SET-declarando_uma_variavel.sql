-- [SQL Server] Variáveis
-- Aula 8 de 23: DECLARE e SET Declarando uma variável

/* 
Declarando Variáveis 

1) O que é uma variável?
Uma variável é um objeto que armazena o valor de um dado.

2. Estrutura

DECLARE @var tipo
ou
DECLARE @var as tipo

SET @var = valor


DECLARE @var1 INT, @var2 INT,
	 @texto VARCHAR(MAX), -- é opcional usar o argumento do VARCHAR como MAX para o maximo possivel de caracteres
	 @data DATETIME
	
SET @var1 = 10
SET @var1 = 45
SET @texto = 'Um texto qualquer'
SET @data = '18/02/2021'

select @data -- 2021-02-18 00:00:00.000


declare @numero float
set @numero = 2360

select @numero -- 2360
select @numero * @numero -- 5569600
select format(@numero * @numero, 'n') -- 5.569.600,00

*/

SELECT 100 * 8.99 AS 'faturamento'

DECLARE @quantidade as int, @preco AS float
SET @quantidade = 100
SET @preco = 8.99

SELECT @quantidade * @preco AS 'faturamento'



-- Exemplo 1: Declare uma variável chamada 'idade' e armazene o valor 30

DECLARE @idade AS INT

SET @idade = 30

SELECT @idade

--

DECLARE @idade1 AS TINYINT

SET @idade1 = 30

SELECT @idade1



-- Exemplo 2: Declare uma variável chamada 'preco' e armazene o valor 10.89

DECLARE @preco1 AS float
SET @preco1 = 10.89
SELECT @preco1

DECLARE @preco2 AS decimal(5, 2)
SET @preco2 = 10.89
SELECT @preco2



-- Exemplo 3: Declare uma variável chamada 'nome' e armazene o valor 'Mateus'

DECLARE @nome AS varchar(max)
SET @nome = 'Mateus'
SELECT @nome



-- Exemplo 4: Declare uma variável chamada 'data' e armazene a data de hoje.

DECLARE @data AS datetime
SET @data = '15/06/2021'
SELECT @data -- 2021-06-15 00:00:00.000

SELECT DAY(@data) -- 15


declare @data1 as date
set @data1 = '2000-05-10'
select @data1 -- 2000-05-10


declare @data2 as datetime
set @data2 = '2000-05-10'
select @data2 -- 2000-10-05 00:00:00.000 (observe a inversao da data)



-- maneira de declarar data da maneira padrao e depois transforma-la em datetime
DECLARE @date date = '2016-12-21';  
DECLARE @datetime datetime = @date;  

SELECT @datetime AS '@datetime', @date AS '@date';
/*
@datetime					@date
2016-12-21 00:00:00.000		2016-12-21
*/

