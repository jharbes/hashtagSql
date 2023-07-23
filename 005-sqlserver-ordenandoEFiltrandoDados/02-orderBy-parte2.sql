-- [SQL Server] Ordenando e filtrando dados
-- Aula 2 de 27: Order By (Parte 2)

-- Selecionando as TOP 10 linhas da tabela DimProduct, ordenando pelas colunas UnitCost (decrescente) e Weight (decrescente)

-- Observe que neste caso a ordem em que as ordena��es s�o solicitadas FAZEM DIFEREN�A, primeiro ele ordenar� de forma decrescente
-- o UnitCost e ap�s feito isso ele far� a ordena��o de forma decrescente da coluna Weight, ou seja, caso a ordena��o fosse
-- solicitada primeiramente pela coluna Weight o resultado seria diferente.
-- Para constatar isso observe o resultado de cada uma das consultas abaixo:

use ContosoRetailDW;


SELECT 
	TOP(10) ProductName,
	UnitCost,
	Weight
FROM
	DimProduct
ORDER BY UnitCost DESC, Weight DESC;



SELECT 
	TOP(10) ProductName,
	UnitCost,
	Weight
FROM
	DimProduct
ORDER BY Weight DESC, UnitCost DESC;