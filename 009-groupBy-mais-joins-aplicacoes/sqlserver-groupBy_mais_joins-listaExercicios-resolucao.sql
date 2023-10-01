-- exercicios - groupBy mais joins - aplicacoes

use ContosoRetailDW;


-- Os exercícios abaixo estão divididos de acordo com uma determinada tabela do Banco de Dados.
-- Você pode utilizar o INNER JOIN para resolver todas as questões.
-- FACT SALES/*1. 

a) Faça um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal
de vendas (ChannelName). Você deve ordenar a tabela final de acordo com SalesQuantity,
em ordem decrescente.

b) Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) e
quantidade total devolvida (Return Quantity) de acordo com o nome das lojas
(StoreName).

c) Faça um resumo do valor total vendido (Sales Amount) para cada mês
(CalendarMonthLabel) e ano (CalendarYear).*/-- a)