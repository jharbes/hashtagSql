-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 5 e 6 de 23: REPLACE (Parte 1 e 2)

-- REPLACE ---> Substitui um determinado texto por outro texto, NÃO é CASE SENSITIVE

select 'O Excel é o melhor'; -- O Excel é o melhor

select REPLACE('O Excel é o melhor', 'Excel', 'SQL'); -- O SQL é o melhor

select REPLACE('O Excel é o melhor', 'EXCEL', 'SQL'); -- O SQL é o melhor


-- Exemplo: Crie uma consulta a partir de DimCustomer onde você retorna o Nome Completo dos Clientes, a coluna de Sexo (Abrev) e uma outra coluna de Sexo substituindo M por Masculino e F por Feminino

SELECT * FROM DimCustomer;

SELECT
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	Gender AS 'Sexo (Abrev)',
	REPLACE(Gender, 'M', 'Masculino') AS 'Sexo (Extenso)'
FROM
	DimCustomer;



-- observe que nesse caso fazemos o PRIMEIRO replace onde 'M' irá virar 'Masculino'
-- o SEGUNDO replace transformará 'F' em 'Feminino (caso exista) gerando a possibilidade
-- de dois replaces e contemplando as duas mudanças desejadas no Gender
SELECT
	CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
	Gender AS 'Sexo (Abrev)',
	REPLACE(REPLACE(Gender, 'M', 'Masculino'), 'F', 'Feminino') AS 'Sexo (Extenso)'
FROM
	DimCustomer;

-- observe que devemos ter cuidado na ordem dos replaces e nem sempre replaces seguidos darão
-- certo pois algumas letras poderao se repetir apos o replace sendo alteradas continuamente
-- observacao que tambem o REPLACE NÃO é case sensitive