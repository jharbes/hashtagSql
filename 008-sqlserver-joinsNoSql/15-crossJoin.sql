-- 15-crossJoin

select * from produtos;
select * from subcategoria;



-- Neste caso vamos apenas juntar as duas tabelas de acordo com as colunas
-- solicitadas de cada uma, como nao existe um id relacionador entre elas
-- serao criadas todos os tipos de relacao possivel entre elas (produto cartesiano)
select
	nome_produto,
	nome_subcategoria
from
	produtos cross join subcategoria;