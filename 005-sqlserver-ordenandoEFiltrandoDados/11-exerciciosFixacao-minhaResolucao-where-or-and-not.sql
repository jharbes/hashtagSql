-- Exercicios de Fixacao: WHERE, AND, OR e NOT

/*
1- Selecione todas as linhas da tabela dimEmployee de funcionários do sexo feminino E do
departamento de Finanças:
*/

select 
	* 
from 
	DimEmployee
where
	Gender='F' and DepartmentName = 'Finance';



/*
2- Selecione todas as linhas da tabela DimProduct de produtos da marca Contoso E da cor vermelha
E que tenham um UnitPrice maior ou igual a $100.
*/

select
	*
from
	DimProduct
where
	BrandName='Contoso' and ColorName='Red' and UnitPrice>=100;