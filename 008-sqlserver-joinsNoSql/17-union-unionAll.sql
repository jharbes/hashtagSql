-- 17-union-unionAll

-- serve para juntar tabelas que possuem a MESMA estrutura (mesmas colunas)
-- caso seja necessario, nesse caso, podemos unir as duas tabelas

select * from DimCustomer where Gender='F';

select * from DimCustomer where Gender='M';



select * from DimCustomer where Gender='F'
union
select * from DimCustomer where Gender='M';


-- union all
-- O UNION soma todas as linhas, porém EXCLUI AS LINHAS DUPLICADAS (so contabiliza as colunas solicitadas,
-- nesse caso em particular apenas as colunas FirstName e BirthDate para dizer que estão duplicadas)
-- O UNION ALL trara todas as linhas, mesmo que duplicadas

select FirstName, BirthDate from DimCustomer where Gender='F'
union all
select FirstName, BirthDate from DimCustomer where Gender='M';