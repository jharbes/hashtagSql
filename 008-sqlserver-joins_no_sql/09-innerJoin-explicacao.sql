-- 09-innerJoin-explicacao

-- em conjuntos, na pratica, sera retornado A interseccao B, ou seja, apenas
-- as linhas onde cada uma em ambas as tabelas tiverem referencia na outra
-- tabela em questao

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
inner join
	subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;