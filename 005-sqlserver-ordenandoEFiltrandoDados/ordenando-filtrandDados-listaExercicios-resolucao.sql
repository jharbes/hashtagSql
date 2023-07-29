-- Exercicios - ordenando-filtrandoDados

use ContosoRetailDW;

/*
1. Voc� � o gerente da �rea de compras e precisa criar um relat�rio com as TOP 100 vendas, de
acordo com a quantidade vendida. Voc� precisa fazer isso em 10min pois o diretor de compras
solicitou essa informa��o para apresentar em uma reuni�o.

Utilize seu conhecimento em SQL para buscar essas TOP 100 vendas, de acordo com o total
vendido (SalesAmount).
*/

select top(100) * from FactSales
order by SalesAmount desc;



/*
2. Os TOP 10 produtos com maior UnitPrice possuem exatamente o mesmo pre�o. Por�m, a
empresa quer diferenciar esses pre�os de acordo com o peso (Weight) de cada um.

O que voc� precisar� fazer � ordenar esses top 10 produtos, de acordo com a coluna de
UnitPrice e, al�m disso, estabelecer um crit�rio de desempate, para que seja mostrado na
ordem, do maior para o menor.

Caso ainda assim haja um empate entre 2 ou mais produtos, pense em uma forma de criar
um segundo crit�rio de desempate (al�m do peso).
*/

select top(10) * from DimProduct
order by UnitPrice desc, Weight desc, ProductName;



/*
3. Voc� � respons�vel pelo setor de log�stica da empresa Contoso e precisa dimensionar o
transporte de todos os produtos em categorias, de acordo com o peso.

Os produtos da categoria A, com peso acima de 100kg, dever�o ser transportados na primeira
leva.

Fa�a uma consulta no banco de dados para descobrir quais s�o estes produtos que est�o na
categoria A.

a) Voc� dever� retornar apenas 2 colunas nessa consulta: Nome do Produto e Peso.

b) Renomeie essas colunas com nomes mais intuitivos.

c) Ordene esses produtos do mais pesado para o mais leve.
*/

-- a)
select ProductName,Weight from DimProduct where weight >= 100;

-- b)
select
	ProductName as 'Nome do Produto',
	Weight as 'Peso do Produto'
from
	DimProduct
where
	weight >= 100;

-- c)
select
	ProductName as 'Nome do Produto',
	Weight as 'Peso do Produto'
from
	DimProduct
where
	weight >= 100
order by weight desc;



/*
4. Voc� foi alocado para criar um relat�rio das lojas registradas atualmente na Contoso.

a) Descubra quantas lojas a empresa tem no total. Na consulta que voc� dever� fazer � tabela
DimStore, retorne as seguintes informa��es: StoreName, OpenDate, EmployeeCount

b) Renomeeie as colunas anteriores para deixar a sua consulta mais intuitiva.

c) Dessas lojas, descubra quantas (e quais) lojas ainda est�o ativas.
*/

-- a)
select StoreName,OpenDate,EmployeeCount from DimStore;
select count(*) as 'N�mero de Lojas' from DimStore;

-- b)
select
	StoreName as 'Nome da Loja',
	OpenDate as 'Data de Abertura',
	EmployeeCount as 'N�mero de Funcion�rios'
from
	DimStore;

-- c)
select
	count(*) as 'N�mero de Lojas Ativas'
from
	DimStore
where
	Status='On' and StoreType='Store';

select
	StoreName as 'Nome da Loja',
	OpenDate as 'Data de Abertura',
	EmployeeCount as 'N�mero de Funcion�rios'
from
	DimStore
where
	Status='On' and StoreType='Store';