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




/*
4. O setor de logística deverá realizar um transporte de carga dos produtos que estão no depósito
de Seattle para o depósito de Sunnyside.

Não se tem muitas informações sobre os produtos que estão no depósito, apenas se sabe que
existem 100 exemplares de cada Subcategoria. Ou seja, 100 laptops, 100 câmeras digitais, 100
ventiladores, e assim vai.

O gerente de logística definiu que os produtos serão transportados por duas rotas distintas. Além
disso, a divisão dos produtos em cada uma das rotas será feita de acordo com as subcategorias (ou
seja, todos os produtos de uma mesma subcategoria serão transportados pela mesma rota):

Rota 1: As subcategorias que tiverem uma soma total menor que 1000 kg deverão ser
transportados pela Rota 1.
Rota 2: As subcategorias que tiverem uma soma total maior ou igual a 1000 kg deverão ser
transportados pela Rota 2.

Você deverá realizar uma consulta à tabela DimProduct e fazer essa divisão das subcategorias por
cada rota. Algumas dicas:

- Dica 1: A sua consulta deverá ter um total de 3 colunas: Nome da Subcategoria, Peso Total e Rota.
- Dica 2: Como não se sabe quais produtos existem no depósito, apenas que existem 100
exemplares de cada subcategoria, você deverá descobrir o peso médio de cada subcategoria e
multiplicar essa média por 100, de forma que você descubra aproximadamente qual é o peso total
dos produtos por subcategoria.
- Dica 3: Sua resposta final deverá ter um JOIN e um GROUP BY.
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
5. O setor de marketing está com algumas ideias de ações para alavancar as vendas em 2021. Uma
delas consiste em realizar sorteios entre os clientes da empresa.
Este sorteio será dividido em categorias:

‘Sorteio Mãe do Ano’: Nessa categoria vão participar todas as mulheres com filhos.
‘Sorteio Pai do Ano’: Nessa categoria vão participar todos os pais com filhos.
‘Caminhão de Prêmios’: Nessa categoria vão participar todas os demais clientes (homens e
mulheres sem filhos).

Seu papel será realizar uma consulta à tabela DimCustomer e retornar 3 colunas:

- FirstName AS ‘Nome’
- Gender AS ‘Sexo’
- TotalChildren AS ‘Qtd. Filhos’
- EmailAdress AS ‘E-mail’
- Ação de Marketing: nessa coluna você deverá dividir os clientes de acordo com as categorias
‘Sorteio Mãe do Ano’, ‘Sorteio Pai do Ano’ e ‘Caminhão de Prêmios’.
*/

select * from DimCustomer;

select
	FirstName as Nome,
	Gender as Sexo,
	TotalChildren as 'Quantidade Filhos',
	EmailAddress as 'E-mail',
	case
		when TotalChildren > 0 and Gender='M' then 'Sorteio Pai do Ano'
		when TotalChildren > 0 and Gender='F' then 'Sorteio Mãe do Ano'
		else 'Caminhão de Prêmios'
	end as 'Ação de Marketing'
from DimCustomer;




/*
6. Descubra qual é a loja que possui o maior tempo de atividade (em dias). Você deverá fazer essa
consulta na tabela DimStore, e considerar a coluna OpenDate como referência para esse cálculo.

Atenção: lembre-se que existem lojas que foram fechadas.
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