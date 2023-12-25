-- exercicios - subqueries_e_ctes


-- M�DULO 15: EXERC�CIOS

/*
1. Para fins fiscais, a contabilidade da empresa precisa de uma tabela contendo todas as vendas
referentes � loja �Contoso Orlando Store�. Isso porque essa loja encontra-se em uma regi�o onde
a tributa��o foi modificada recente.

Portanto, crie uma consulta ao Banco de Dados para obter uma tabela FactSales contendo todas
as vendas desta loja.*/-- para utilizacao do WHERE a resposta da subquery deve ser um valor unico conforma abaixoselect	*from	FactSaleswhere StoreKey=(select StoreKey from DimStore where StoreName='Contoso Orlando Store');/*2. O setor de controle de produtos quer fazer uma an�lise para descobrir quais s�o os produtos
que possuem um UnitPrice maior que o UnitPrice do produto de ID igual a 1893.

a) A sua consulta resultante deve conter as colunas ProductKey, ProductName e UnitPrice
da tabela DimProduct.

b) Nessa query voc� tamb�m deve retornar uma coluna extra, que informe o UnitPrice do
produto 1893.
*/

-- a)

select
	ProductKey,
	ProductName,
	UnitPrice,
	(select UnitPrice from DimProduct where ProductKey=1893) as 'UnitPrice ProductKey 1893'
from
	DimProduct
where UnitPrice>(select UnitPrice from DimProduct where ProductKey=1893);




/*
3. A empresa Contoso criou um programa de bonifica��o chamado �Todos por 1�. Este
programa consistia no seguinte: 1 funcion�rio seria escolhido ao final do ano como o funcion�rio
destaque, s� que a bonifica��o seria recebida por todos da �rea daquele funcion�rio em
particular. O objetivo desse programa seria o de incentivar a colabora��o coletiva entre os
funcion�rios de uma mesma �rea. Desta forma, o funcion�rio destaque beneficiaria n�o s� a si,
mas tamb�m a todos os colegas de sua �rea.

Ao final do ano, o funcion�rio escolhido como destaque foi o Miguel Severino. Isso significa que
todos os funcion�rios da �rea do Miguel seriam beneficiados com o programa.

O seu objetivo � realizar uma consulta � tabela DimEmployee e retornar todos os funcion�rios
da �rea �vencedora� para que o setor Financeiro possa realizar os pagamentos das bonifica��es.
*/

select
	*
from
	DimEmployee
where DepartmentName=(select DepartmentName from DimEmployee where FirstName='Miguel' and LastName='Severino');




/*
4. Fa�a uma query que retorne os clientes que recebem um sal�rio anual acima da m�dia. A sua
query deve retornar as colunas CustomerKey, FirstName, LastName, EmailAddress e
YearlyIncome.

Obs: considere apenas os clientes que s�o 'Pessoas F�sicas'.
*/

select
	CustomerKey,
	FirstName,
	LastName,
	EmailAddress,
	YearlyIncome
from
	DimCustomer
where YearlyIncome > (select AVG(YearlyIncome) from DimCustomer where CustomerType='Person')
	and CustomerType='Person';




/*
5. A a��o de desconto da Asian Holiday Promotion foi uma das mais bem sucedidas da empresa.
Agora, a Contoso quer entender um pouco melhor sobre o perfil dos clientes que compraram
produtos com essa promo��o.

Seu trabalho � criar uma query que retorne a lista de clientes que compraram nessa promo��o.
*/

select distinct
	DimCustomer.CustomerKey,
	CONCAT(FirstName,' ',LastName) as 'Customer Name'
from FactOnlineSales
left join DimCustomer on DimCustomer.CustomerKey=FactOnlineSales.CustomerKey
where PromotionKey in (select PromotionKey from DimPromotion where PromotionName='Asian Holiday Promotion');

-- ou

select
	DimCustomer.CustomerKey,
	CONCAT(FirstName,' ',LastName) as 'Customer Name'
from DimCustomer
where CustomerKey in (
	select
		CustomerKey
	from
		FactOnlineSales
	where PromotionKey in (select PromotionKey from DimPromotion where PromotionName='Asian Holiday Promotion'));




/*
6. A empresa implementou um programa de fideliza��o de clientes empresariais. Todos aqueles
que comprarem mais de 3000 unidades de um mesmo produto receber� descontos em outras
compras.

Voc� dever� descobrir as informa��es de CustomerKey e CompanyName destes clientes.
*/

select
	CustomerKey,
	CompanyName
from
	DimCustomer
where CustomerKey in (
	select
		CustomerKey
	from 
		FactOnlineSales
	where
		CustomerKey in (select CustomerKey from DimCustomer where CustomerType='Company')
	group by
		CustomerKey,ProductKey
	having
		SUM(SalesQuantity)>3000
);




/*
7. Voc� dever� criar uma consulta para o setor de vendas que mostre as seguintes colunas da
tabela DimProduct:

ProductKey,
ProductName,
BrandName,
UnitPrice
M�dia de UnitPrice.
*/

