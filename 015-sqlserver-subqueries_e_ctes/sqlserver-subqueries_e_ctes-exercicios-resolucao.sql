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

