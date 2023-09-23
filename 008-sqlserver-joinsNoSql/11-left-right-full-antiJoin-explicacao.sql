-- 11-left-right-full-antiJoin-explicacao

-- em relacao a conjuntos teremos a tabela A, LEFT menos a tabela A interseccao B, RIGHT
-- A - (A interseccao B)

select * from produtos;
select * from subcategoria;