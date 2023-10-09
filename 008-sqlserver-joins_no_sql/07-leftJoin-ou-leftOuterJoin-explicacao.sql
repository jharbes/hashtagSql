-- 07-leftJoin-ou-leftOuterJoin-explicacao

-- serao retornadas todas as linhas da tabela a esquerda (A, LEFT) e as linhas da tabela
-- a direita (B, RIGHT) que TIVEREM REFERENCIA na tabela a esquerda (A, LEFT)

use ContosoRetailDW;

select * from produtos;
select * from subcategoria;


-- retorna TODOS os itens da tabela à esquerda, e da tabela à direita
-- apenas os itens EM COMUM com a tabela da esquerda 
select * from produtos left join subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;
select * from produtos left outer join subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;

select
	produtos.id_produto,
	produtos.nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
from
	produtos
left join
	subcategoria
on
	produtos.id_subcategoria=subcategoria.id_subcategoria;