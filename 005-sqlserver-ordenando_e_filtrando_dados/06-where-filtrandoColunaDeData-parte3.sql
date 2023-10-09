-- [SQL Server] Ordenando e filtrando dados
-- Aula 5 de 27: Where (Pt. 3) - Filtrando colunas de data

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- Formato de data no SQL será em 'yyyy-mm-dd'

-- Quais clientes nasceram após o dia 31/12/1970 ordenando do mais novo para o mais velho?

SELECT * FROM DimCustomer
WHERE BirthDate >= '1970-12-31'
ORDER BY BirthDate DESC
