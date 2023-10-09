-- [SQL Server] [Ordenando e filtrando dados] Aula 2 de 27: Order By (Parte 1)

-- Selecionando as TOP 100 linhas da tabela DimStore, ordenando pela coluna EmployeeCount de forma decrescente

-- Por default o ORDER BY ordernará de forma ascendente (pode ser usado também ORDER BY <nome_da_coluna> ASC), para que
-- seja feita de forma descendente teremos que usar ORDER BY <nome_da_coluna> DESC

use ContosoRetailDW;

SELECT TOP(100) * FROM DimStore
ORDER BY EmployeeCount DESC;