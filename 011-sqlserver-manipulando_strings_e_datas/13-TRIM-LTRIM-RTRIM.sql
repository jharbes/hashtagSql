-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 13 de 23: TRIM, LTRIM e RTRIM

-- Fun��es para retirar espa�os adicionais dentro de um texto
-- TRIM: Retira espa�os adicionais � esquerda e � direita do texto
-- LTRIM: Retira espa�os adicionais � esquerda do texto
-- RTRIM: Retira espa�os adicionais � direita do texto

-- Utilize as fun��es acima no c�digo '   ABC123   '

DECLARE @varCodigo VARCHAR(50)
SET @varCodigo = '   ABC123   '

SELECT
	TRIM(@varCodigo) AS 'Trim',
	LTRIM(@varCodigo) AS 'Ltrim',
	RTRIM(@varCodigo) AS 'Rtrim'

SELECT
	DATALENGTH(TRIM(@varCodigo)) AS 'Trim',
	DATALENGTH(LTRIM(@varCodigo)) AS 'Ltrim',
	DATALENGTH(RTRIM(@varCodigo)) AS 'Rtrim'
