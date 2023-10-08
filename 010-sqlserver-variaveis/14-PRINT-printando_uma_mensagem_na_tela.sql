-- [SQL Server] Vari�veis
-- Aula 14 de 23: PRINT - Printando uma mensagem na tela

-- a mensagem abaixo faz com que na aba 'mensagens' pare de aparecer o numero de 'contagens' ap�s feita
-- uma consulta de select 
SET NOCOUNT ON

-- Exemplo 1: Printe na tela a quantidade de lojas On e a quantidade  de lojas Off da tabela DimStore. Utilize vari�veis para isso.

DECLARE @varLojasOn INT, @varLojasOff INT
SET @varLojasOn = (SELECT COUNT(*) FROM DimStore WHERE Status = 'On')
SET @varLojasOff = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off')

SELECT @varLojasOn AS 'Lojas Abertas', @varLojasOff AS 'Lojas Fechadas'

PRINT 'O total de lojas abertas � de ' + CAST(@varLojasOn AS VARCHAR(30))
PRINT 'O total de lojas fechadas � de ' + CAST(@varLojasOff AS VARCHAR(30))
