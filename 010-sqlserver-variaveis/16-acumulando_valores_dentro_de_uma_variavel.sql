-- [SQL Server] Vari�veis
-- Aula 16 de 23: Acumulando valores dentro de uma vari�vel

-- Exemplo 1: Retorne uma lista com os nomes dos funcion�rios do departamento de Marketing

select
	FirstName + ' ' + LastName as 'Nome Completo'
from
	DimEmployee
where
	DepartmentName='Marketing'


DECLARE @ListaNomes VARCHAR(MAX)
SET @ListaNomes = ''

SELECT
	@ListaNomes = @ListaNomes + FirstName + ', ' -- + CHAR(10)
FROM
	DimEmployee
WHERE DepartmentName = 'Marketing'


print @listanomes

-- utilizamos o DATALENGTH para retirar a virgula(,) do final
PRINT LEFT(@ListaNomes, DATALENGTH(@ListaNomes) - 2)


-----------------------------------------------------------------


SET @ListaNomes = ''

-- o valor CHAR(10) est� sendo utilizado para sinalizar um 'pulo de linha'
SELECT
	@ListaNomes = @ListaNomes + FirstName + ', ' + CHAR(10)
FROM
	DimEmployee
WHERE DepartmentName = 'Marketing'


print @listanomes

-- utilizamos o DATALENGTH para retirar a virgula(,) do final
PRINT LEFT(@ListaNomes, DATALENGTH(@ListaNomes) - 3)
