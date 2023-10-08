-- exercicios - variaveis - aplicacoes

use ContosoRetailDW;


-- M�DULO 10: EXERC�CIOS

/*
1. Declare 4 vari�veis inteiras. Atribua os seguintes valores a elas:

valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7

a) Crie uma nova vari�vel para armazenar o resultado da soma entre valor1 e valor2. Chame
essa vari�vel de soma.

b) Crie uma nova vari�vel para armazenar o resultado da subtra��o entre valor3 e valor 4.
Chame essa vari�vel de subtracao.

c) Crie uma nova vari�vel para armazenar o resultado da multiplica��o entre o valor 1 e o
valor4. Chame essa vari�vel de multiplicacao.

d) Crie uma nova vari�vel para armazenar o resultado da divis�o do valor3 pelo valor4. Chame
essa vari�vel de divisao. Obs: O resultado dever� estar em decimal, e n�o em inteiro.

e) Arredonde o resultado da letra d) para 2 casas decimais.

*/

declare @valor1 int = 10, @valor2 int = 5, @valor3 int = 34, @valor4 int = 7

-- a)
declare @soma int
select @soma=@valor1+@valor2
select @soma
print @soma

--b)
declare @subtracao int = @valor3-@valor4
select @subtracao
print @subtracao

-- c)
declare @multiplicacao int=@valor1*@valor4
select @multiplicacao
print @multiplicacao

-- d)
declare @divisao decimal(5,2)
set @divisao=(cast(@valor3 as decimal(5,2)))/@valor4
select @divisao
print @divisao

-- e)

select ROUND(@divisao,2)