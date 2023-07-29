-- Exercicios - ordenando-filtrandoDados

use ContosoRetailDW;

/*
Você é o gerente da área de compras e precisa criar um relatório com as TOP 100 vendas, de
acordo com a quantidade vendida. Você precisa fazer isso em 10min pois o diretor de compras
solicitou essa informação para apresentar em uma reunião.

Utilize seu conhecimento em SQL para buscar essas TOP 100 vendas, de acordo com o total
vendido (SalesAmount).
*/

select top(100) * from FactSales
order by SalesAmount desc;