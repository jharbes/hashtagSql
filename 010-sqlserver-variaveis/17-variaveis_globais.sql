-- [SQL Server] Variáveis
-- Aula 17 de 23: Variáveis Globais

-- Variaveis globais são variaveis que já existem primitivamente no SQL Server
-- Elas utilizam duas arrobas (@@) na frente do seu nome em vez de uma


-- @@SERVERNAME retorna o nome do servidor
SELECT @@SERVERNAME

-- @@VERSION retorna a versão do SGBD
SELECT @@VERSION

SELECT * FROM DimProduct

-- @@ROWCOUNT retorna o numero de linhas da ultima tabela consultada (nesse caso DimProduct)
SELECT @@ROWCOUNT
