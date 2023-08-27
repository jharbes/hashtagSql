-- 08-rightJoin-ou-rightOuterJoin-explicacao

use ContosoRetailDW;

select * from produtos;
select * from subcategoria;


-- as colunas da tabela principal nao precisam necessariamente de serem precedidas
-- pelo nome da tabela, porem quando houver algum nome repetido sera necessario
-- para que o SGBD possa entender de qual tabela aquela coluna é, como exemplo temos
-- a coluna id_subcategoria que está presente em ambas as tabelas
select
	id_produto,
	nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
from
	produtos
right join
	subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;
