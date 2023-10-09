-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 13 de 23: TRIM, LTRIM e RTRIM

-- Fun��es para retirar espa�os adicionais dentro de um texto
-- TRIM: Retira espa�os adicionais � esquerda e � direita do texto
-- LTRIM: Retira espa�os adicionais � esquerda do texto
-- RTRIM: Retira espa�os adicionais � direita do texto

-- Utilize as fun��es acima no c�digo '   ABC123   '

DECLARE @varCodigo VARCHAR(50);
SET @varCodigo = '   ABC123   ';

SELECT
	TRIM(@varCodigo) AS 'Trim', -- ABC123
	LTRIM(@varCodigo) AS 'Ltrim', -- ABC123
	RTRIM(@varCodigo) AS 'Rtrim'; --    ABC123

SELECT
	DATALENGTH(TRIM(@varCodigo)) AS 'Trim', -- 6
	DATALENGTH(LTRIM(@varCodigo)) AS 'Ltrim', -- 9
	DATALENGTH(RTRIM(@varCodigo)) AS 'Rtrim'; -- 9
