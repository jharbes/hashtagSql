-- exercicios - variaveis - aplicacoes

use ContosoRetailDW;


-- MÓDULO 10: EXERCÍCIOS

/*
1. Declare 4 variáveis inteiras. Atribua os seguintes valores a elas:

valor1 = 10
valor2 = 5
valor3 = 34
valor4 = 7

a) Crie uma nova variável para armazenar o resultado da soma entre valor1 e valor2. Chame
essa variável de soma.

b) Crie uma nova variável para armazenar o resultado da subtração entre valor3 e valor 4.
Chame essa variável de subtracao.

c) Crie uma nova variável para armazenar o resultado da multiplicação entre o valor 1 e o
valor4. Chame essa variável de multiplicacao.

d) Crie uma nova variável para armazenar o resultado da divisão do valor3 pelo valor4. Chame
essa variável de divisao. Obs: O resultado deverá estar em decimal, e não em inteiro.

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
2. Para cada declaração das variáveis abaixo, atenção em relação ao tipo de dado que deverá ser
especificado.

a) Declare uma variável chamada ‘produto’ e atribua o valor de ‘Celular’.
b) Declare uma variável chamada ‘quantidade’ e atribua o valor de 12.
c) Declare uma variável chamada ‘preco’ e atribua o valor 9.99.
d) Declare uma variável chamada ‘faturamento’ e atribua o resultado da multiplicação entre
‘quantidade’ e ‘preco’.
e) Visualize o resultado dessas 4 variáveis em uma única consulta, por meio do SELECT.

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
select @produto as 'Produto', @quantidade as 'Quantidade', @preco as 'Preço', @faturamento as 'Faturamento'



/*
3. Você é responsável por gerenciar um banco de dados onde são recebidos dados externos de
usuários. Em resumo, esses dados são:
- Nome do usuário
- Data de nascimento
- Quantidade de pets que aquele usuário possui

Você precisará criar um código em SQL capaz de juntar as informações fornecidas por este
usuário. Para simular estes dados, crie 3 variáveis, chamadas: nome, data_nascimento e
num_pets. Você deverá armazenar os valores ‘André’, ‘10/02/1998’ e 2, respectivamente.

O resultado final a ser alcançado é mostrado no print abaixo:

Dica: você precisará utilizar as funções CAST e FORMAT para chegar no resultado.

*/

