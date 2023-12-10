-- exercicios - funcoes_condicionais

use ContosoRetailDW;


-- MÓDULO 12: EXERCÍCIOS

/*
1. O setor de vendas decidiu aplicar um desconto aos produtos de acordo com a sua classe. O
percentual aplicado deverá ser de:

Economy -> 5%
Regular -> 7%
Deluxe -> 9%

a) Faça uma consulta à tabela DimProduct que retorne as seguintes colunas: ProductKey,
ProductName, e outras duas colunas que deverão retornar o % de Desconto e UnitPrice com
desconto.

b) Faça uma adaptação no código para que os % de desconto de 5%, 7% e 9% sejam facilmente
modificados (dica: utilize variáveis).

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
	p.UnitPrice * (1 - p.Desconto) as 'Preço com Desconto'
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
	end as 'Preço com Desconto'
from DimProduct;




/*
2. Você ficou responsável pelo controle de produtos da empresa e deverá fazer uma análise da
quantidade de produtos por Marca.

A divisão das marcas em categorias deverá ser a seguinte:
CATEGORIA A: Mais de 500 produtos
CATEGORIA B: Entre 100 e 500 produtos
CATEGORIA C: Menos de 100 produtos

Faça uma consulta à tabela DimProduct e retorne uma tabela com um agrupamento de Total de
Produtos por Marca, além da coluna de Categoria, conforme a regra acima.
*/

select 
	BrandName as Marca,
	count(BrandName) as 'Número de Produtos',
	case
		when count(BrandName) > 500 then 'CATEGORIA A'
		when count(BrandName) < 100 then 'CATEGORIA C'
		else 'CATEGORIA B'
	end as Categoria
from DimProduct group by BrandName;




/*
3. Será necessário criar uma categorização de cada loja da empresa considerando a quantidade de
funcionários de cada uma. A lógica a ser seguida será a lógica abaixo:

EmployeeCount >= 50; 'Acima de 50 funcionários'
EmployeeCount >= 40; 'Entre 40 e 50 funcionários'
EmployeeCount >= 30; 'Entre 30 e 40 funcionários'
EmployeeCount >= 20; 'Entre 20 e 30 funcionários'
EmployeeCount >= 40; 'Entre 10 e 20 funcionários'
Caso contrário: 'Abaixo de 10 funcionários'

Faça uma consulta à tabela DimStore que retorne as seguintes informações: StoreName,
EmployeeCount e a coluna de categoria, seguindo a regra acima.
*/

select
	StoreName,
	EmployeeCount,
	case
		when EmployeeCount >= 50 then 'Acima de 50 funcionários'
		when EmployeeCount >= 40 then 'Entre 40 e 50 funcionários'
		when EmployeeCount >= 30 then 'Entre 30 e 40 funcionários'
		when EmployeeCount >= 20 then 'Entre 20 e 30 funcionários'
		when EmployeeCount >= 10 then 'Entre 10 e 20 funcionários'
		else 'Abaixo de 10 funcionários'
		end as Categoria
from DimStore;