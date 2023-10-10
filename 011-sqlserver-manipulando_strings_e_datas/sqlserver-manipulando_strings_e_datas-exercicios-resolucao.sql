-- exercicios - manipulando_strings_e_datas

use ContosoRetailDW;


-- MÓDULO 11: EXERCÍCIOS

/*
1. Quando estamos manipulando tabelas, é importante pensar em como os dados serão
apresentados em um relatório. Imagine os nomes dos produtos da tabela DimProduct. Os
textos são bem grandes e pode ser que mostrar os nomes completos dos produtos não seja a
opção mais interessante, pois provavelmente não vão caber em um gráfico e a visualização
ficará ruim.

a) Seu gestor te pede para listar todos os produtos para que seja criado um gráfico para ser
apresentado na reunião diária de equipe. Faça uma consulta à tabela DimProduct que
retorne (1) o nome do produto e (2) a quantidade de caracteres que cada produto tem,
e ordene essa tabela do produto com a maior quantidade de caracteres para a menor.

b) Qual é a média de caracteres dos nomes dos produtos?

c) Analise a estrutura dos nomes dos produtos e verifique se seria possível reduzir o tamanho
do nome dos produtos. (Dica: existem informações redundantes nos nomes dos produtos?
Seria possível substituí-las?)

d) Qual é a média de caracteres nesse novo cenário?

*/

-- a)
select * from DimProduct;

select
	ProductName as 'Nome do Produto',
	LEN(ProductName) as 'Tamanho do Nome do Produto'
from
	DimProduct
order by LEN(ProductName) desc;


-- b)
select
	avg(len(ProductName)) as 'Média de Caracteres no Nome dos Produtos'
from
	DimProduct;


-- c)
