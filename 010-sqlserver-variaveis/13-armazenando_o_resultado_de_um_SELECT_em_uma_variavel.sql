-- [SQL Server] Variáveis
-- Aula 13 de 23: Armazenando o resultado de um SELECT em uma variável

-- Exemplo 1: Crie uma variável para armazenar a quantidade total de funcionários da tabela DimEmployee.

DECLARE @varTotalFuncionarios INT

-- obrigatoriamente deveremos colocar o select dentro de parenteses (), caso contrario o SGBD nao
-- entenderá que queremos armazena-lo na variavel
SET @varTotalFuncionarios = (SELECT COUNT(*) FROM DimEmployee)
SELECT @varTotalFuncionarios


-- Exemplo 2: Crie uma variável para armazenar a quantidade total de lojas com o status Off.

DECLARE @varLojasOff INT
SET @varLojasOff = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off')
SELECT @varLojasOff