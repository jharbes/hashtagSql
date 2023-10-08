-- [SQL Server] Vari�veis
-- Aula 13 de 23: Armazenando o resultado de um SELECT em uma vari�vel

-- Exemplo 1: Crie uma vari�vel para armazenar a quantidade total de funcion�rios da tabela DimEmployee.

DECLARE @varTotalFuncionarios INT

-- obrigatoriamente deveremos colocar o select dentro de parenteses (), caso contrario o SGBD nao
-- entender� que queremos armazena-lo na variavel
SET @varTotalFuncionarios = (SELECT COUNT(*) FROM DimEmployee)
SELECT @varTotalFuncionarios


-- Exemplo 2: Crie uma vari�vel para armazenar a quantidade total de lojas com o status Off.

DECLARE @varLojasOff INT
SET @varLojasOff = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off')
SELECT @varLojasOff