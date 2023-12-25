-- exercicios - subqueries_e_ctes


-- MÓDULO 15: EXERCÍCIOS

/*
1. Para fins fiscais, a contabilidade da empresa precisa de uma tabela contendo todas as vendas
referentes à loja ‘Contoso Orlando Store’. Isso porque essa loja encontra-se em uma região onde
a tributação foi modificada recente.

Portanto, crie uma consulta ao Banco de Dados para obter uma tabela FactSales contendo todas
as vendas desta loja.*/-- para utilizacao do WHERE a resposta da subquery deve ser um valor unico conforma abaixoselect	*from	FactSaleswhere StoreKey=(select StoreKey from DimStore where StoreName='Contoso Orlando Store');/*2. O setor de controle de produtos quer fazer uma análise para descobrir quais são os produtos
que possuem um UnitPrice maior que o UnitPrice do produto de ID igual a 1893.

a) A sua consulta resultante deve conter as colunas ProductKey, ProductName e UnitPrice
da tabela DimProduct.

b) Nessa query você também deve retornar uma coluna extra, que informe o UnitPrice do
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
3. A empresa Contoso criou um programa de bonificação chamado “Todos por 1”. Este
programa consistia no seguinte: 1 funcionário seria escolhido ao final do ano como o funcionário
destaque, só que a bonificação seria recebida por todos da área daquele funcionário em
particular. O objetivo desse programa seria o de incentivar a colaboração coletiva entre os
funcionários de uma mesma área. Desta forma, o funcionário destaque beneficiaria não só a si,
mas também a todos os colegas de sua área.

Ao final do ano, o funcionário escolhido como destaque foi o Miguel Severino. Isso significa que
todos os funcionários da área do Miguel seriam beneficiados com o programa.

O seu objetivo é realizar uma consulta à tabela DimEmployee e retornar todos os funcionários
da área “vencedora” para que o setor Financeiro possa realizar os pagamentos das bonificações.
*/

select
	*
from
	DimEmployee
where DepartmentName=(select DepartmentName from DimEmployee where FirstName='Miguel' and LastName='Severino');




/*
4. Faça uma query que retorne os clientes que recebem um salário anual acima da média. A sua
query deve retornar as colunas CustomerKey, FirstName, LastName, EmailAddress e
YearlyIncome.

Obs: considere apenas os clientes que são 'Pessoas Físicas'.
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