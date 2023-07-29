-- Exercicios - ordenando-filtrandoDados

use ContosoRetailDW;

/*
1. Você é o gerente da área de compras e precisa criar um relatório com as TOP 100 vendas, de
acordo com a quantidade vendida. Você precisa fazer isso em 10min pois o diretor de compras
solicitou essa informação para apresentar em uma reunião.

Utilize seu conhecimento em SQL para buscar essas TOP 100 vendas, de acordo com o total
vendido (SalesAmount).
*/

select top(100) * from FactSales
order by SalesAmount desc;



/*
2. Os TOP 10 produtos com maior UnitPrice possuem exatamente o mesmo preço. Porém, a
empresa quer diferenciar esses preços de acordo com o peso (Weight) de cada um.

O que você precisará fazer é ordenar esses top 10 produtos, de acordo com a coluna de
UnitPrice e, além disso, estabelecer um critério de desempate, para que seja mostrado na
ordem, do maior para o menor.

Caso ainda assim haja um empate entre 2 ou mais produtos, pense em uma forma de criar
um segundo critério de desempate (além do peso).
*/

select top(10) * from DimProduct
order by UnitPrice desc, Weight desc, ProductName desc;