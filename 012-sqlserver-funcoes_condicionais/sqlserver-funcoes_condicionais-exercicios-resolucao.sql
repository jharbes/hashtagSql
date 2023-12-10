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

