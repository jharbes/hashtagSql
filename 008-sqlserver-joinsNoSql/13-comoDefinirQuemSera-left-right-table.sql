-- 13-comoDefinirQuemSera-left-right-table

-- Como escolher quem é a tabela da esquerda e a tabela da direita?

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