/*
CÓDIGO PARA CRIAR AS TABELAS AUXILIARES PARA AS EXPLICAÇÕES:

CRIE 2 CONSULTAS E EM CADA UMA DELAS, EXECUTE OS SEGUINTES COMANDOS:

Consulta 1:
*/

CREATE TABLE produtos(
id_produto int,
nome_produto varchar(30),
id_subcategoria int)

INSERT INTO produtos(id_produto, nome_produto, id_subcategoria)
VALUES
	(1, 'Fone Bluetooth JBL', 5),
	(2, 'PS4', 6),
	(3, 'Notebook Samsung i3', 2),
	(4, 'iPhone 11', 1),
	(5, 'Moto G9', 1)

---

-- Consulta 2:

CREATE TABLE subcategoria(
id_subcategoria int,
nome_subcategoria varchar(30))

INSERT INTO subcategoria(id_subcategoria, nome_subcategoria)
VALUES
	(1, 'Celular'),
	(2, 'Notebook'),
	(3, 'Câmera Digital'),
	(4, 'Televisão'),
	(5, 'Fone de Ouvido')


-- retorna TODOS os itens da tabela à esquerda, e da tabela à direita
-- apenas os itens EM COMUM com a tabela da esquerda 
select * from produtos left join subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;
select * from produtos left outer join subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;


-- retorna TODOS os itens da tabela à direita, e da tabela à esquerda
-- apenas os itens EM COMUM com a tabela da esquerda 
select * from produtos right join subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;
select * from produtos right outer join subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;


-- retorna APENAS os itens que tenham relação em comum com algum outro item
-- da outra tabela
select * from produtos inner join subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;


-- retorna TODOS os itens de TODAS as tabelas
select * from produtos full join subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;
select * from produtos full outer join subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;


-- retorna APENAS os itens que não tem nada em comum com a tabela da direita (nao valido para o SSGBD)
select * from produtos left anti join subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;


-- retorna APENAS os itens que não tem nada em comum com a tabela da esquerda (nao valido para o SSGBD)
select * from produtos right anti join subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;


-- retorna TODOS os itens que não tem nada em comum com a outra tabela (nao valido para o SSGBD)
select * from produtos full anti join subcategoria on produtos.id_subcategoria=subcategoria.id_subcategoria;