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



/*
5. O gerente da �rea de controle de qualidade notificou � Contoso que todos os produtos Home
Theater da marca Litware, disponibilizados para venda no dia 15 de mar�o de 2009, foram
identificados com defeitos de f�brica.

O que voc� dever� fazer � identificar os ID�s desses produtos e repassar ao gerente para que ele
possa notificar as lojas e consequentemente solicitar a suspens�o das vendas desses produtos.
*/

-- observe que a consulta teve seus valores na coluna de DATETIME (data e hora) alterados para
-- que a consulta pudesse retornar corretamente, tivemos que tirar os tra�os (-) da data.
select 
	*
from
	DimProduct
where
	BrandName = 'Litware' AND ProductName like '%Home Theater%' and AvailableForSaleDate='20090315';



/*
6. Imagine que voc� precise extrair um relat�rio da tabela DimStore, com informa��es de lojas.
Mas voc� precisa apenas das lojas que n�o est�o mais funcionando atualmente.

a) Utilize a coluna de Status para filtrar a tabela e trazer apenas as lojas que n�o est�o mais
funcionando.

b) Agora imagine que essa coluna de Status n�o existe na sua tabela. Qual seria a outra forma
que voc� teria de descobrir quais s�o as lojas que n�o est�o mais funcionando?*/-- a)select * from DimStore where Status='Off';-- b)select * from DimStore where CloseDate is not null;/*7. De acordo com a quantidade de funcion�rios, cada loja receber� uma determinada quantidade
de m�quinas de caf�. As lojas ser�o divididas em 3 categorias:

CATEGORIA 1: De 1 a 20 funcion�rios -> 1 m�quina de caf�
CATEGORIA 2: De 21 a 50 funcion�rios -> 2 m�quinas de caf�
CATEGORIA 3: Acima de 51 funcion�rios -> 3 m�quinas de caf�

Identifique, para cada caso, quais s�o as lojas de cada uma das 3 categorias acima (basta fazer
uma verifica��o).*/select * from DimStore where EmployeeCount<=20;select * from DimStore where EmployeeCount between 1 and 20;select * from DimStore where EmployeeCount>20 and EmployeeCount<=50;select * from DimStore where EmployeeCount between 21 and 50;select * from DimStore where EmployeeCount>50;select * from DimStore order by EmployeeCount;/*8. A empresa decidiu que todas as televis�es de LCD receber�o um super desconto no pr�ximo
m�s. O seu trabalho � fazer uma consulta � tabela DimProduct e retornar os ID�s, Nomes e
Pre�os de todos os produtos LCD existentes
*/

select
	ProductKey as ID,
	ProductName as Nome,
	UnitPrice as 'Pre�o'
from
	DimProduct
where
	ProductDescription like '%LCD%';



/*
9. Fa�a uma lista com todos os produtos das cores: Green, Orange, Black, Silver e Pink. Estes
produtos devem ser exclusivamente das marcas: Contoso, Litware e Fabrikam.
*/

select
	*
from
	DimProduct
where
		ColorName in ('Green','Orange','Black','Pink','Silver')
	and
		BrandName in ('Contoso','Litware','Fabrikam');