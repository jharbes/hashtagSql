-- 10-fullJoin-ou-fullOuterJoin-explicacao


use ContosoRetailDW;

select * from produtos;
select * from subcategoria;



select
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
from
	produtos
full join
	subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;
-- observe no exemplo acima que o 'id_subcategoria' de 'Câmera Digital' e 'Televisão'
-- retornaram como nulos, mas isso so acontece porque o 'id_subcategoria' DESSA
-- consulta é referente à tabela 'produtos' e não à tabela 'subcategoria', observe
-- que na consulta abaixo o retorno desses ids já acontece


select
	id_produto,
	nome_produto,
	subcategoria.id_subcategoria,
	subcategoria.nome_subcategoria
from
	produtos
full join
	subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;