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
modificados (dica: utilize vari�veis).*/select * from DimProduct;-- a) e b)declare @desconto_economy float = 0.05;
declare @desconto_regular float = 0.07;
declare @desconto_deluxe float = 0.09;

select
	p.ProductKey,
	p.ProductName,
	p.Desconto,
	p.UnitPrice * (1 - p.Desconto) as 'Pre�o com Desconto'
from (
	select
		ProductKey,
		ProductName,
		UnitPrice,
		case
			when ClassName='Economy' then @desconto_economy
			when ClassName='Regular' then @desconto_regular
			when ClassName='Deluxe' then @desconto_deluxe
			else 0.00
		end as Desconto
	from DimProduct
) as p;