-- [SQL Server] Vari�veis
-- Aula 2 de 23: Tipos de Dados

-- **INFORMA��O simplificada advinda do curso, por�m complementada com a documenta��o do SQL Server

/* 
PRINCIPAIS Tipos de dados

O tipo de dado � a maneira como o SQL consegue diferenciar cada valor dentro de um banco de dados.

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

a) Inteiro - int, bigint, smallint e tinyint

Tipos de dados num�ricos exatos que usam dados inteiros. Para economizar espa�o no banco de dados, use o menor tipo de dados que pode conter todos os valores poss�veis de maneira confi�vel. Por exemplo, tinyint � suficiente para a idade de uma pessoa porque n�o existe ningu�m que viva por mais de 255 anos. Mas tinyint n�o � suficiente para a idade de um edif�cio, porque um edif�cio pode ter mais de 255 anos.

Tipo de dados	Intervalo													Express�o de intervalo		Armazenamento
bigint			-9.223.372.036.854.775.808 a 9.223.372.036.854.775.807		-2^63 a 2^63-1				8 bytes
int				-2.147.483.648 a 2.147.483.647								-2^31 a 2^31-1				4 bytes
smallint		-32.768 a 32.767											-2^15 a 2^15-1				2 bytes
tinyint			0 a 255														2^0-1 a 2^8-1				1 byte

Exemplos:
1, 100, 569

**Como o SQL entende um n�mero inteiro: INT

Exemplos:

*/

CREATE TABLE dbo.MyTable  
(  
  MyBigIntColumn BIGINT  
,MyIntColumn  INT
,MySmallIntColumn SMALLINT
,MyTinyIntColumn TINYINT
);  
  
GO  
  
INSERT INTO dbo.MyTable VALUES (9223372036854775807, 2147483647,32767,255);  
 GO  
SELECT MyBigIntColumn, MyIntColumn, MySmallIntColumn, MyTinyIntColumn  
FROM dbo.MyTable; 

/*

MyBigIntColumn       MyIntColumn MySmallIntColumn MyTinyIntColumn  
-------------------- ----------- ---------------- ---------------  
9223372036854775807  2147483647  32767            255  
  
(1 row(s) affected)




-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


b) Decimal
Exemplos:
10.33, 90.91, 410.787

Como o SQL entende um n�mero decimal: FLOAT
Como o SQL entende um n�mero decimal: DECIMAL(N, M)

N � a quantidade de d�gitos que o n�mero pode ter, incluindo casas decimais
M � o n�mero m�ximo de casas decimais


*/

CREATE TABLE dbo.MyTable  
(  
  MyDecimalColumn DECIMAL(5,2)  
,MyNumericColumn NUMERIC(10,5)
  
);  
  
GO  
INSERT INTO dbo.MyTable VALUES (123, 12345.12);  
GO  
SELECT MyDecimalColumn, MyNumericColumn  
FROM dbo.MyTable;

/*

MyDecimalColumn                         MyNumericColumn  
--------------------------------------- ---------------------------------------  
123.00                                  12345.12000  
  
(1 row(s) affected)



-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------


c) Texto/String - char e varchar (Transact-SQL)

Exemplos:
'Carla', 'Motorola', 'Pastel', '44'

Como o SQL entende um texto: VARCHAR(N)

N � o n�mero de caracteres que o texto pode ter


Argumentos
char [ ( n ) ]
Dados de cadeia de caracteres de tamanho fixo. n define o tamanho da cadeia de caracteres em bytes e deve ser um valor de 1 a 8.000. Para conjuntos de caracteres de codifica��o de byte �nico, como Latin, o tamanho de armazenamento � n bytes e a quantidade de caracteres que pode ser armazenada tamb�m � n. Para conjuntos de caracteres de codifica��o multibyte, o tamanho de armazenamento ainda ser� n bytes, mas a quantidade de caracteres que pode ser armazenada pode ser menor que n. O sin�nimo ISO para char � character. Para saber mais sobre conjuntos de caracteres, consulte Conjuntos de caracteres multibyte e de byte �nico.

varchar [ ( n | m�x ) ]
Dados de cadeia de caracteres de tamanho vari�vel. Use n para definir o tamanho da cadeia de caracteres em bytes, podendo ser um valor de 1 a 8.000, ou use max para indicar um tamanho de restri��o de coluna at� um armazenamento m�ximo de 2^31-1 bytes (2 GB). Para conjuntos de caracteres de codifica��o de byte �nico, como Latin, o tamanho de armazenamento � n bytes + 2 bytes e a quantidade de caracteres que pode ser armazenada tamb�m � n. Para codifica��o de conjuntos de caracteres multibyte, o tamanho de armazenamento ainda ser� n bytes + 2 bytes, mas a quantidade de caracteres que pode ser armazenada pode ser menor que n. Os sin�nimos ISO para varchar s�o charvarying ou charactervarying. Para saber mais sobre conjuntos de caracteres, consulte Conjuntos de caracteres multibyte e de byte


Exemplos:

*/

DECLARE @myVariable AS VARCHAR = 'abc';
DECLARE @myNextVariable AS CHAR = 'abc';
--The following returns 1
SELECT DATALENGTH(@myVariable), DATALENGTH(@myNextVariable);


DECLARE @myVariable AS VARCHAR(40);
SET @myVariable = 'This string is longer than thirty characters';
SELECT CAST(@myVariable AS VARCHAR);
SELECT DATALENGTH(CAST(@myVariable AS VARCHAR)) AS 'VarcharDefaultLength';
SELECT CONVERT(CHAR, @myVariable);
SELECT DATALENGTH(CONVERT(CHAR, @myVariable)) AS 'VarcharDefaultLength';

/*

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

d) Data
Exemplos:
'01/01/2021', '23/03/2021'

Como o SQL entende uma data/hora: DATETIME
Como o SQL entende uma data: DATE


Exemplos:

*/

DECLARE @date date = '12-21-16';  
DECLARE @datetime datetime = @date;  
  
SELECT @datetime AS '@datetime', @date AS '@date';  
  

--Result  
--@datetime               @date  
------------------------- ----------  
--2016-12-21 00:00:00.000 2016-12-21


/*
Observa��o

O exemplo acima usa um formato de data espec�fico da regi�o (MM-DD-AA).
*/

DECLARE @date date = '12-21-16';

/*

Voc� pode atualizar o exemplo para corresponder ao formato da sua regi�o.

Voc� tamb�m pode concluir o exemplo com o formato de data compat�vel com ISO 8601 (AAAA-MM-DD). Por exemplo:

*/

DECLARE @date date = '2016-12-21';  
DECLARE @datetime datetime = @date;  

SELECT @datetime AS '@datetime', @date AS '@date';



