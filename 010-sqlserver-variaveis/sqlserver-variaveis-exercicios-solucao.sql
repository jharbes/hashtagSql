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
-- ou
-- set @soma=@valor1+@valor2
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
print round(@divisao,2)



/*
2. Para cada declara��o das vari�veis abaixo, aten��o em rela��o ao tipo de dado que dever� ser
especificado.

a) Declare uma vari�vel chamada �produto� e atribua o valor de �Celular�.
b) Declare uma vari�vel chamada �quantidade� e atribua o valor de 12.
c) Declare uma vari�vel chamada �preco� e atribua o valor 9.99.
d) Declare uma vari�vel chamada �faturamento� e atribua o resultado da multiplica��o entre
�quantidade� e �preco�.
e) Visualize o resultado dessas 4 vari�veis em uma �nica consulta, por meio do SELECT.

*/

-- a)
declare @produto varchar(20)='Celular'
select @produto

-- b)
declare @quantidade int=12
select @quantidade

-- c)
declare @preco float=9.99
select @preco

-- d)
declare @faturamento float=@quantidade*@preco
select @faturamento

-- e)
select @produto as 'Produto', @quantidade as 'Quantidade', @preco as 'Pre�o', @faturamento as 'Faturamento'



/*
3. Voc� � respons�vel por gerenciar um banco de dados onde s�o recebidos dados externos de
usu�rios. Em resumo, esses dados s�o:
- Nome do usu�rio
- Data de nascimento
- Quantidade de pets que aquele usu�rio possui

Voc� precisar� criar um c�digo em SQL capaz de juntar as informa��es fornecidas por este
usu�rio. Para simular estes dados, crie 3 vari�veis, chamadas: nome, data_nascimento e
num_pets. Voc� dever� armazenar os valores �Andr�, �10/02/1998� e 2, respectivamente.

O resultado final a ser alcan�ado � mostrado no print abaixo:

Dica: voc� precisar� utilizar as fun��es CAST e FORMAT para chegar no resultado.

*/

