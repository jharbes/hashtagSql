-- Exercicios de Fixacao: WHERE, AND, OR e NOT

-- 1- Selecione todas as linhas da tabela dimEmployee de funcionários do sexo feminino E do
-- departamento de Finanças:

select 
	* 
from 
	DimEmployee
where
	Gender='F' and DepartmentName = 'Finance';