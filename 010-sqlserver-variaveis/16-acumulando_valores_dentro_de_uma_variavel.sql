-- [SQL Server] Vari�veis
-- Aula 16 de 23: Acumulando valores dentro de uma vari�vel

-- Exemplo 1: Retorne uma lista com os nomes dos funcion�rios do departamento de Marketing
DECLARE @ListaNomes VARCHAR(MAX)
SET @ListaNomes = ''

SELECT
	@ListaNomes = @ListaNomes + FirstName + ', ' + CHAR(10)
FROM
	DimEmployee
WHERE DepartmentName = 'Marketing'

PRINT LEFT(@ListaNomes, DATALENGTH(@ListaNomes) - 3)


