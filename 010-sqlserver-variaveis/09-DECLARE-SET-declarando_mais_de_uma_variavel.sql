-- Declarando mais de uma variável

-- OPÇÃO 1

declare @var1 int
declare @var2 int
declare @texto varchar(30)
declare @data datetime

set @var1=10
set @texto='Um texto qualquer'
set @data='18/02/2021'

select @var1, @texto, @data


-- OPÇÃO 2

declare @var3 int, @texto1 varchar(30), @data1 datetime

set @var3=50
set @texto1='Exemplo de texto'
set @data1='08/10/2023'

select @var3,@texto1,@data1


-- OPÇÃO 3

declare @var4 int=60, @texto2 varchar(30)='Outro texto', @data2 datetime='05/05/2005'

select @var4,@texto2,@data2



-- Exercício 1: A sua loja fez uma venda de 100 camisas, cada uma custando 89.99. Faça um 
-- SELECT para obter o resultado do faturamento (multiplicacao da quantidade x preço)

declare @quantidade int = 100, @preco float =89.99

select @quantidade * @preco as 'Faturamento'