-- Exercicios de Fixacao: WHERE, AND, OR e NOT

-- 1- Selecione todas as linhas da tabela dimEmployee de funcion�rios do sexo feminino E do
-- departamento de Finan�as:

select 
	* 
from 
	DimEmployee
where
	Gender='F' and DepartmentName = 'Finance';