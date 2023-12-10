-- exercicios - funcoes_condicionais

use ContosoRetailDW;


-- M�DULO 12: EXERC�CIOS

/*
1. O setor de vendas decidiu aplicar um desconto aos produtos de acordo com a sua classe. O
percentual aplicado dever� ser de:

Economy -> 5%
Regular -> 7%
Deluxe -> 9%

a) Fa�a uma consulta � tabela DimProduct que retorne as seguintes colunas: ProductKey,
ProductName, e outras duas colunas que dever�o retornar o % de Desconto e UnitPrice com
desconto.

b) Fa�a uma adapta��o no c�digo para que os % de desconto de 5%, 7% e 9% sejam facilmente
modificados (dica: utilize vari�veis).

*/

select * from DimProduct;

-- a) e b)
declare @desconto_economy float = 0.05;
declare @desconto_regular float = 0.07;
declare @desconto_deluxe float = 0.09;

select
	p.ProductKey,
	p.ProductName,
	p.ClassName,
	p.UnitPrice,
	p.Desconto,
	p.UnitPrice * (1 - p.Desconto) as 'Pre�o com Desconto'
from (
	select
		ProductKey,
		ProductName,
		UnitPrice,
		ClassName,
		case
			when ClassName='Economy' then @desconto_economy
			when ClassName='Regular' then @desconto_regular
			when ClassName='Deluxe' then @desconto_deluxe
			else 0.00
		end as Desconto
	from DimProduct
) as p;


-- ou


declare @desconto_economy1 float = 0.05;
declare @desconto_regular1 float = 0.07;
declare @desconto_deluxe1 float = 0.09;

select
	ProductKey,
	ProductName,
	UnitPrice,
	ClassName,
	case
		when ClassName='Economy' then @desconto_economy1
		when ClassName='Regular' then @desconto_regular1
		when ClassName='Deluxe' then @desconto_deluxe1
		else 0.00
	end as Desconto,
	case
		when ClassName='Economy' then UnitPrice * (1 - @desconto_economy1)
		when ClassName='Regular' then UnitPrice * (1 - @desconto_regular1)
		when ClassName='Deluxe' then UnitPrice * (1 - @desconto_deluxe1)
		else UnitPrice
	end as 'Pre�o com Desconto'
from DimProduct;




/*
2. Voc� ficou respons�vel pelo controle de produtos da empresa e dever� fazer uma an�lise da
quantidade de produtos por Marca.

A divis�o das marcas em categorias dever� ser a seguinte:
CATEGORIA A: Mais de 500 produtos
CATEGORIA B: Entre 100 e 500 produtos
CATEGORIA C: Menos de 100 produtos

Fa�a uma consulta � tabela DimProduct e retorne uma tabela com um agrupamento de Total de
Produtos por Marca, al�m da coluna de Categoria, conforme a regra acima.
*/

select 
	BrandName as Marca,
	count(BrandName) as 'N�mero de Produtos',
	case
		when count(BrandName) > 500 then 'CATEGORIA A'
		when count(BrandName) < 100 then 'CATEGORIA C'
		else 'CATEGORIA B'
	end as Categoria
from DimProduct group by BrandName;




/*
3. Ser� necess�rio criar uma categoriza��o de cada loja da empresa considerando a quantidade de
funcion�rios de cada uma. A l�gica a ser seguida ser� a l�gica abaixo:

EmployeeCount >= 50; 'Acima de 50 funcion�rios'
EmployeeCount >= 40; 'Entre 40 e 50 funcion�rios'
EmployeeCount >= 30; 'Entre 30 e 40 funcion�rios'
EmployeeCount >= 20; 'Entre 20 e 30 funcion�rios'
EmployeeCount >= 40; 'Entre 10 e 20 funcion�rios'
Caso contr�rio: 'Abaixo de 10 funcion�rios'

Fa�a uma consulta � tabela DimStore que retorne as seguintes informa��es: StoreName,
EmployeeCount e a coluna de categoria, seguindo a regra acima.
*/

select
	StoreName,
	EmployeeCount,
	case
		when EmployeeCount >= 50 then 'Acima de 50 funcion�rios'
		when EmployeeCount >= 40 then 'Entre 40 e 50 funcion�rios'
		when EmployeeCount >= 30 then 'Entre 30 e 40 funcion�rios'
		when EmployeeCount >= 20 then 'Entre 20 e 30 funcion�rios'
		when EmployeeCount >= 10 then 'Entre 10 e 20 funcion�rios'
		else 'Abaixo de 10 funcion�rios'
	end as Categoria
from DimStore;




/*
4. O setor de log�stica dever� realizar um transporte de carga dos produtos que est�o no dep�sito
de Seattle para o dep�sito de Sunnyside.

N�o se tem muitas informa��es sobre os produtos que est�o no dep�sito, apenas se sabe que
existem 100 exemplares de cada Subcategoria. Ou seja, 100 laptops, 100 c�meras digitais, 100
ventiladores, e assim vai.

O gerente de log�stica definiu que os produtos ser�o transportados por duas rotas distintas. Al�m
disso, a divis�o dos produtos em cada uma das rotas ser� feita de acordo com as subcategorias (ou
seja, todos os produtos de uma mesma subcategoria ser�o transportados pela mesma rota):

Rota 1: As subcategorias que tiverem uma soma total menor que 1000 kg dever�o ser
transportados pela Rota 1.
Rota 2: As subcategorias que tiverem uma soma total maior ou igual a 1000 kg dever�o ser
transportados pela Rota 2.

Voc� dever� realizar uma consulta � tabela DimProduct e fazer essa divis�o das subcategorias por
cada rota. Algumas dicas:

- Dica 1: A sua consulta dever� ter um total de 3 colunas: Nome da Subcategoria, Peso Total e Rota.
- Dica 2: Como n�o se sabe quais produtos existem no dep�sito, apenas que existem 100
exemplares de cada subcategoria, voc� dever� descobrir o peso m�dio de cada subcategoria e
multiplicar essa m�dia por 100, de forma que voc� descubra aproximadamente qual � o peso total
dos produtos por subcategoria.
- Dica 3: Sua resposta final dever� ter um JOIN e um GROUP BY.
*/

select * from DimProduct;

select
	ProductSubcategoryName,
	round(avg(Weight)*100,2) as 'Peso Total',
	case
		when avg(Weight)*100 is null then 'Sem transporte'
		when avg(Weight)*100 < 1000 then 'Rota 1'
		else 'Rota 2'
	end as Rota
from DimProduct
left join DimProductSubcategory on DimProduct.ProductSubcategoryKey=DimProductSubcategory.ProductSubcategoryKey
group by ProductSubcategoryName;




/*
5. O setor de marketing est� com algumas ideias de a��es para alavancar as vendas em 2021. Uma
delas consiste em realizar sorteios entre os clientes da empresa.
Este sorteio ser� dividido em categorias:

�Sorteio M�e do Ano�: Nessa categoria v�o participar todas as mulheres com filhos.
�Sorteio Pai do Ano�: Nessa categoria v�o participar todos os pais com filhos.
�Caminh�o de Pr�mios�: Nessa categoria v�o participar todas os demais clientes (homens e
mulheres sem filhos).

Seu papel ser� realizar uma consulta � tabela DimCustomer e retornar 3 colunas:

- FirstName AS �Nome�
- Gender AS �Sexo�
- TotalChildren AS �Qtd. Filhos�
- EmailAdress AS �E-mail�
- A��o de Marketing: nessa coluna voc� dever� dividir os clientes de acordo com as categorias
�Sorteio M�e do Ano�, �Sorteio Pai do Ano� e �Caminh�o de Pr�mios�.
*/

select * from DimCustomer;

select
	FirstName as Nome,
	Gender as Sexo,
	TotalChildren as 'Quantidade Filhos',
	EmailAddress as 'E-mail',
	case
		when TotalChildren > 0 and Gender='M' then 'Sorteio Pai do Ano'
		when TotalChildren > 0 and Gender='F' then 'Sorteio M�e do Ano'
		else 'Caminh�o de Pr�mios'
	end as 'A��o de Marketing'
from DimCustomer;




/*
6. Descubra qual � a loja que possui o maior tempo de atividade (em dias). Voc� dever� fazer essa
consulta na tabela DimStore, e considerar a coluna OpenDate como refer�ncia para esse c�lculo.

Aten��o: lembre-se que existem lojas que foram fechadas.
*/

select * from DimStore;

select
	StoreName as Loja,
	OpenDate as 'Data de Abertura',
	CloseDate as 'Data de fechamento',
	case
		when CloseDate is null then DATEDIFF(DAY,OpenDate,getdate())
		else DATEDIFF(DAY,OpenDate,CloseDate)
	end as 'Tempo de Atividade'
from DimStore
order by 'Tempo de Atividade' desc;