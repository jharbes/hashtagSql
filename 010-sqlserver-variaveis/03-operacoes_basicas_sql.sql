-- [SQL Server] Vari�veis
-- Aula 3 de 23: Opera��es B�sicas

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

-- Opera��es b�sicas

SELECT 10 AS 'N�mero'

SELECT 'Marcus' AS 'Nome'

SELECT '21/06/2021' AS 'Data'

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

-- Opera��es com n�meros

SELECT 10+20 as 'Soma'
SELECT 20-5 Subtra��o
SELECT 31*40 'Multiplica��o'

select 431/23 as 'Divis�o Truncada'
SELECT 431.0/23 as 'Divis�o Correta'

-- ** IMPORTANTE: Na divis�o ENTRE INTEIROS a resposta sempre ser� um NUMERO INTEIRO (truncado), ou seja,
-- o ideal ser� transformar o numerador SEMPRE em um float ou decimal para obtermos a resposta correta

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

-- Opera��es com textos

SELECT 'SQL' + ' ' + 'Impressionador'

-- ou 

select concat('sql',' ','Impressionador');

/*


As fun��es escalares a seguir executam uma opera��o em um valor de entrada de cadeia de caracteres e retornam uma cadeia de caracteres ou valor num�rico:

ASCII ,CHAR, CHARINDEX, CONCAT, CONCAT_WS, DIFFERENCE, FORMAT, LEFT, LEN

LOWER, LTRIM, NCHAR ,PATINDEX ,QUOTENAME ,REPLACE ,REPLICATE ,REVERSE

RIGHT ,RTRIM ,SOUNDEX ,SPACE ,STR ,STRING_AGG ,STRING_ESCAPE ,STRING_SPLIT

STUFF ,SUBSTRING ,TRANSLATE ,TRIM ,UNICODE ,UPPER




Operadores de cadeia de caracteres (Transact-SQL)
Artigo
14/06/2023
11 colaboradores
Aplica-se a:SQL ServerInst�ncia Gerenciada de SQL do Azure

O SQL Server fornece os seguintes operadores de cadeia de caracteres. Os operadores de concatena��o de cadeias de caracteres podem combinar dois ou mais dos seguintes tipos de dados em uma express�o:

caractere ou cadeias de caracteres bin�rias
colunas
combina��o de cadeias de caracteres e nomes de colunas
Os operadores de cadeia de caracteres curinga podem corresponder a um ou mais caracteres em uma opera��o de compara��o de cadeia de caracteres. LIKE e PATINDEX s�o exemplos de duas dessas opera��es.

Nesta se��o
= (Compara��o ou atribui��o de cadeia de caracteres)
+ (Concatena��o de cadeias de caracteres)
+= (Concatena��o de cadeias de caracteres)
% (Curinga � Caracteres a serem correspondidos)
[ ] (Curinga � Caracteres a serem correspondidos)
[^] (Curinga � Caracteres a n�o serem correspondidos)
_ (Curinga � Corresponde a um caractere) funciona como o ? no DOS(?)

*/

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

-- Opera��es com datas

SELECT ('21/03/2021') + 1



-- Fun��es de data e hora do sistema de precis�o superior

-- Retorna um valor datetime2(7) que cont�m a data e hora do computador no qual a inst�ncia de SQL Server � executada. O valor retornado n�o inclui a compensa��o de fuso hor�rio.
select SYSDATETIME();

-- Retorna um valor datetimeoffset(7) que cont�m a data e hora do computador no qual a inst�ncia de SQL Server � executada. O valor retornado inclui o deslocamento de fuso hor�rio.
select SYSDATETIMEOFFSET();

-- Retorna um valor datetime2(7) que cont�m a data e hora do computador no qual a inst�ncia de SQL Server est� sendo executada. A fun��o retorna os valores de data e hora como hora UTC (Tempo Universal Coordenado).
select SYSUTCDATETIME();



-- Fun��es de data e hora do sistema de precis�o inferior

-- Retorna um valor datetime que cont�m a data e hora do computador no qual a inst�ncia de SQL Server � executada. O valor retornado n�o inclui a compensa��o de fuso hor�rio.
select CURRENT_TIMESTAMP;

-- Retorna um valor datetime que cont�m a data e hora do computador no qual a inst�ncia de SQL Server � executada. O valor retornado n�o inclui a compensa��o de fuso hor�rio.
select GETDATE();

-- Retorna um valor datetime que cont�m a data e hora do computador no qual a inst�ncia de SQL Server � executada. A fun��o retorna os valores de data e hora como hora UTC (Tempo Universal Coordenado).
select GETUTCDATE();