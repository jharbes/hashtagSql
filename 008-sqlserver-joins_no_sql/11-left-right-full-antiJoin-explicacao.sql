-- 11-left-right-full-antiJoin-explicacao

-- em relacao a conjuntos teremos a tabela A, LEFT menos a tabela A interseccao B, RIGHT
-- A - (A interseccao B)


select * from produtos;
select * from subcategoria;


-- Exemplo de Left Anti Join:
select
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
from
	produtos
left join subcategoria
	on produtos.id_subcategoria=subcategoria.id_subcategoria
where
	nome_subcategoria is null; -- ou a linha abaixo
	--subcategoria.id_subcategoria is null;



-- em relacao a conjuntos teremos a tabela B, RIGHT menos a tabela A interseccao B, RIGHT
-- B - (A interseccao B)

-- Exemplo de Right Anti Join:
select
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	nome_subcategoria
from
	produtos
right join subcategoria
	on produtos.id_subcategoria=subcategoria.id_subcategoria
where
	id_produto is null; -- ou a linha abaixo
	-- nome_produto is null;



-- em relacao a conjuntos teremos a tabela A U B menos a tabela A interseccao B

-- Exemplo de Full Anti Join:
select
	id_produto,
	nome_produto,
	produtos.id_subcategoria as id_subcategoria_produtos,
	subcategoria.id_subcategoria as id_subcategoria_subcategoria,
	nome_subcategoria
from
	produtos
full join subcategoria
	on produtos.id_subcategoria=subcategoria.id_subcategoria
where id_produto is null or subcategoria.id_subcategoria is null; -- ou entao
		-- id_produto is null or nome_subcategoria is null;