-- exercicios - manipulando_strings_e_datas

use ContosoRetailDW;


-- MÓDULO 11: EXERCÍCIOS

/*
1. Quando estamos manipulando tabelas, é importante pensar em como os dados serão
apresentados em um relatório. Imagine os nomes dos produtos da tabela DimProduct. Os
textos são bem grandes e pode ser que mostrar os nomes completos dos produtos não seja a
opção mais interessante, pois provavelmente não vão caber em um gráfico e a visualização
ficará ruim.

a) Seu gestor te pede para listar todos os produtos para que seja criado um gráfico para ser
apresentado na reunião diária de equipe. Faça uma consulta à tabela DimProduct que
retorne (1) o nome do produto e (2) a quantidade de caracteres que cada produto tem,
e ordene essa tabela do produto com a maior quantidade de caracteres para a menor.

b) Qual é a média de caracteres dos nomes dos produtos?

c) Analise a estrutura dos nomes dos produtos e verifique se seria possível reduzir o tamanho
do nome dos produtos. (Dica: existem informações redundantes nos nomes dos produtos?
Seria possível substituí-las?)

d) Qual é a média de caracteres nesse novo cenário?

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
	avg(len(ProductName)) as 'Média de Caracteres no Nome dos Produtos'
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
	AVG(LEN(RTRIM(REPLACE(LTRIM(REPLACE(ProductName, BrandName, '')), ColorName, '')))) as 'Média de Caracteres Reduzido'
from
	DimProduct;



/*
2. A coluna StyleName da tabela DimProduct possui alguns códigos identificados por números
distintos, que vão de 0 até 9, como pode ser visto no exemplo abaixo.

Porém, o setor de controle decidiu alterar a identificação do StyleName, e em vez de usar
números, a ideia agora é passar a usar letras para substituir os números, conforme exemplo
abaixo:

0 -> A, 1 -> B, 2 -> C, 3 -> D, 4 -> E, 5 -> F, 6 -> G, 7 -> H, 8 -> I, 9 - J

É de sua responsabilidade alterar os números por letras na coluna StyleName da tabela
DimProduct. Utilize uma função que permita fazer essas substituições de forma prática e rápida.

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
3. O setor de TI está criando um sistema para acompanhamento individual de cada funcionário da
empresa Contoso. Cada funcionário receberá um login e senha. O login de cada funcionário será
o ID do e-mail, como no exemplo abaixo:

Já a senha será o FirstName + o dia do ano em que o funcionário nasceu, em MAIÚSCULA. Por
exemplo, o funcionário com E-mail: mark0@contoso.com e data de nascimento 15/01/1990
deverá ter a seguinte senha:

Login: mark0
Senha: MARK15

O responsável pelo TI pediu a sua ajuda para retornar uma tabela contendo as seguintes colunas
da tabela DimEmployee: Nome completo (FirstName + LastName), E-mail, ID do e-mail e Senha.

Portanto, faça uma consulta à tabela DimEmployee e retorne esse resultado

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