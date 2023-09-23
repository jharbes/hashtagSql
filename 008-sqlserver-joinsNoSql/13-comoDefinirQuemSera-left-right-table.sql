-- 13-comoDefinirQuemSera-left-right-table

-- Como escolher quem é a tabela da esquerda e a tabela da direita?

-- observe que se invertermos o join de left para right ou vice versa teremos
-- como alteracao a tabela que retornara com TODOS as suas linhas, independente de
-- terem relacao ou nao com a outra

-- caso invertamos o join E as tabelas procuradas acabaremos tendo o mesmo resultado final

-- no fim das contas o mais comum é utilizarmos o 'left join' pois assim retornaremos todos
-- os valores da primeira tabela pesquisada e apenas complementaremos os valores associados
-- da tabela a direita, caso esses nao existem retornarao como null, ou seja, o foco será 
-- a tabela da esquerda

select
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
from
	produtos
left join
	subcategoria
on
	produtos.id_subcategoria=subcategoria.id_subcategoria;



select
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
from
	produtos
right join
	subcategoria
on
	produtos.id_subcategoria=subcategoria.id_subcategoria;