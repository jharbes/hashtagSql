-- [SQL Server] Variáveis
-- Aula 3 de 23: Operações Básicas

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

-- Operações básicas

SELECT 10 AS 'Número'

SELECT 'Marcus' AS 'Nome'

SELECT '21/06/2021' AS 'Data'

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

-- Operações com números

SELECT 10+20 as 'Soma'
SELECT 20-5 Subtração
SELECT 31*40 'Multiplicação'

select 431/23 as 'Divisão Truncada'
SELECT 431.0/23 as 'Divisão Correta'

-- ** IMPORTANTE: Na divisão ENTRE INTEIROS a resposta sempre será um NUMERO INTEIRO (truncado), ou seja,
-- o ideal será transformar o numerador SEMPRE em um float ou decimal para obtermos a resposta correta

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

-- Operações com textos

SELECT 'SQL' + ' ' + 'Impressionador'

-- ou 

select concat('sql',' ','Impressionador');

/*


As funções escalares a seguir executam uma operação em um valor de entrada de cadeia de caracteres e retornam uma cadeia de caracteres ou valor numérico:

ASCII ,CHAR, CHARINDEX, CONCAT, CONCAT_WS, DIFFERENCE, FORMAT, LEFT, LEN

LOWER, LTRIM, NCHAR ,PATINDEX ,QUOTENAME ,REPLACE ,REPLICATE ,REVERSE

RIGHT ,RTRIM ,SOUNDEX ,SPACE ,STR ,STRING_AGG ,STRING_ESCAPE ,STRING_SPLIT

STUFF ,SUBSTRING ,TRANSLATE ,TRIM ,UNICODE ,UPPER




Operadores de cadeia de caracteres (Transact-SQL)
Artigo
14/06/2023
11 colaboradores
Aplica-se a:SQL ServerInstância Gerenciada de SQL do Azure

O SQL Server fornece os seguintes operadores de cadeia de caracteres. Os operadores de concatenação de cadeias de caracteres podem combinar dois ou mais dos seguintes tipos de dados em uma expressão:

caractere ou cadeias de caracteres binárias
colunas
combinação de cadeias de caracteres e nomes de colunas
Os operadores de cadeia de caracteres curinga podem corresponder a um ou mais caracteres em uma operação de comparação de cadeia de caracteres. LIKE e PATINDEX são exemplos de duas dessas operações.

Nesta seção
= (Comparação ou atribuição de cadeia de caracteres)
+ (Concatenação de cadeias de caracteres)
+= (Concatenação de cadeias de caracteres)
% (Curinga – Caracteres a serem correspondidos)
[ ] (Curinga – Caracteres a serem correspondidos)
[^] (Curinga – Caracteres a não serem correspondidos)
_ (Curinga – Corresponde a um caractere) funciona como o ? no DOS(?)

*/

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

-- Operações com datas

SELECT ('21/03/2021') + 1



-- Funções de data e hora do sistema de precisão superior

-- Retorna um valor datetime2(7) que contém a data e hora do computador no qual a instância de SQL Server é executada. O valor retornado não inclui a compensação de fuso horário.
select SYSDATETIME();

-- Retorna um valor datetimeoffset(7) que contém a data e hora do computador no qual a instância de SQL Server é executada. O valor retornado inclui o deslocamento de fuso horário.
select SYSDATETIMEOFFSET();

-- Retorna um valor datetime2(7) que contém a data e hora do computador no qual a instância de SQL Server está sendo executada. A função retorna os valores de data e hora como hora UTC (Tempo Universal Coordenado).
select SYSUTCDATETIME();



-- Funções de data e hora do sistema de precisão inferior

-- Retorna um valor datetime que contém a data e hora do computador no qual a instância de SQL Server é executada. O valor retornado não inclui a compensação de fuso horário.
select CURRENT_TIMESTAMP;

-- Retorna um valor datetime que contém a data e hora do computador no qual a instância de SQL Server é executada. O valor retornado não inclui a compensação de fuso horário.
select GETDATE();

-- Retorna um valor datetime que contém a data e hora do computador no qual a instância de SQL Server é executada. A função retorna os valores de data e hora como hora UTC (Tempo Universal Coordenado).
select GETUTCDATE();