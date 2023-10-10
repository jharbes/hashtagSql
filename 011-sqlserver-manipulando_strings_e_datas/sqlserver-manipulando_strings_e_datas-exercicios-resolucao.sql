-- exercicios - manipulando_strings_e_datas

use ContosoRetailDW;


-- M�DULO 11: EXERC�CIOS

/*
1. Quando estamos manipulando tabelas, � importante pensar em como os dados ser�o
apresentados em um relat�rio. Imagine os nomes dos produtos da tabela DimProduct. Os
textos s�o bem grandes e pode ser que mostrar os nomes completos dos produtos n�o seja a
op��o mais interessante, pois provavelmente n�o v�o caber em um gr�fico e a visualiza��o
ficar� ruim.

a) Seu gestor te pede para listar todos os produtos para que seja criado um gr�fico para ser
apresentado na reuni�o di�ria de equipe. Fa�a uma consulta � tabela DimProduct que
retorne (1) o nome do produto e (2) a quantidade de caracteres que cada produto tem,
e ordene essa tabela do produto com a maior quantidade de caracteres para a menor.

b) Qual � a m�dia de caracteres dos nomes dos produtos?

c) Analise a estrutura dos nomes dos produtos e verifique se seria poss�vel reduzir o tamanho
do nome dos produtos. (Dica: existem informa��es redundantes nos nomes dos produtos?
Seria poss�vel substitu�-las?)

d) Qual � a m�dia de caracteres nesse novo cen�rio?

*/

-- a)
select * from DimProduct;

select
	ProductName as 'Nome do Produto',
	LEN(ProductName) as 'Tamanho do Nome do Produto'
from
	DimProduct
order by LEN(ProductName) desc;


-- b)
select
	avg(len(ProductName)) as 'M�dia de Caracteres no Nome dos Produtos'
from
	DimProduct;


-- c)
select
	ProductName as 'Nome do Produto',
	RTRIM(REPLACE(LTRIM(REPLACE(ProductName, BrandName, '')), ColorName, '')) as 'Nome do Produto Reduzido'
from
	DimProduct;


-- d)
select
	AVG(LEN(RTRIM(REPLACE(LTRIM(REPLACE(ProductName, BrandName, '')), ColorName, '')))) as 'M�dia de Caracteres Reduzido'
from
	DimProduct;



/*
2. A coluna StyleName da tabela DimProduct possui alguns c�digos identificados por n�meros
distintos, que v�o de 0 at� 9, como pode ser visto no exemplo abaixo.

Por�m, o setor de controle decidiu alterar a identifica��o do StyleName, e em vez de usar
n�meros, a ideia agora � passar a usar letras para substituir os n�meros, conforme exemplo
abaixo:

0 -> A, 1 -> B, 2 -> C, 3 -> D, 4 -> E, 5 -> F, 6 -> G, 7 -> H, 8 -> I, 9 - J

� de sua responsabilidade alterar os n�meros por letras na coluna StyleName da tabela
DimProduct. Utilize uma fun��o que permita fazer essas substitui��es de forma pr�tica e r�pida.

*/

select * from DimProduct;

select
	ProductKey,
	ProductName,
	StyleName,
	REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(StyleName, '0', 'A'), '1', 'B'), '2', 'C'), '3', 'D'), '4', 'E'), '5', 'F'), '6', 'G'), '7', 'H'), '8', 'I'), '9', 'J') as 'StyleName Alterado'
from
	DimProduct;

-- ou

select
	ProductKey,
	ProductName,
	StyleName,
	TRANSLATE(StyleName, '0123456789', 'ABCDEFGHIJ') as 'StyleName Alterado'
from
	DimProduct;



/*
3. O setor de TI est� criando um sistema para acompanhamento individual de cada funcion�rio da
empresa Contoso. Cada funcion�rio receber� um login e senha. O login de cada funcion�rio ser�
o ID do e-mail, como no exemplo abaixo:

J� a senha ser� o FirstName + o dia do ano em que o funcion�rio nasceu, em MAI�SCULA. Por
exemplo, o funcion�rio com E-mail: mark0@contoso.com e data de nascimento 15/01/1990
dever� ter a seguinte senha:

Login: mark0
Senha: MARK15

O respons�vel pelo TI pediu a sua ajuda para retornar uma tabela contendo as seguintes colunas
da tabela DimEmployee: Nome completo (FirstName + LastName), E-mail, ID do e-mail e Senha.

Portanto, fa�a uma consulta � tabela DimEmployee e retorne esse resultado

*/

select * from DimEmployee;

select
	CONCAT(FirstName, ' ', LastName) as 'Nome Completo',
	EmailAddress as 'E-Mail',
	SUBSTRING(EmailAddress, 1, CHARINDEX('@', EmailAddress) - 1) as 'ID do E-Mail',
	CONCAT(UPPER(FirstName), DAY(BirthDate)) as 'Senha'
from
	DimEmployee;

-- ou

select
	FirstName + ' ' + LastName as 'Nome Completo',
	EmailAddress as 'E-Mail',
	LEFT(EmailAddress, CHARINDEX('@', EmailAddress) - 1) as 'ID do E-Mail',
	UPPER(FirstName) + DATENAME(DAY, BirthDate) as 'Senha'
from
	DimEmployee;