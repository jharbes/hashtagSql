-- 10-fullJoin-ou-fullOuterJoin-explicacao

-- na pratica em conjuntos teremos uma UNIAO (A U B), ou seja, serao retornados
-- todas as linhas da tabela A e B, mesmo que elas n�o tenham referencia uma na
-- outra tabela

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
-- observe no exemplo acima que o 'id_subcategoria' de 'C�mera Digital' e 'Televis�o'
-- retornaram como nulos, mas isso so acontece porque o 'id_subcategoria' DESSA
-- consulta � referente � tabela 'produtos' e n�o � tabela 'subcategoria', observe
-- que na consulta abaixo o retorno desses ids j� acontece


select
	id_produto,
	nome_produto,
	subcategoria.id_subcategoria,
	subcategoria.nome_subcategoria
from
	produtos
full join
	subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;