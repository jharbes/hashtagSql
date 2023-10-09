-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 10, 11 e 12 de 23: CHARINDEX e SUBSTRING

-- CHARINDEX: Descobre a posi��o de um determinado caractere dentro de um texto
-- SUBSTRING: Extrai alguns caracteres de dentro de um texto

-- mostra em que caractere se inicia a string do primeiro argumento em rela�ao a string
-- total (segundo argumento)
SELECT CHARINDEX('Moreno', 'Raquel Moreno') AS 'Posi��o Sobrenome' -- 8


-- na ausencia da posi��o procurada a fun��o retornar� 0 (zero)
select CHARINDEX('X', 'Raquel Moreno') -- 0


-- inicia o recorte da String no valor do segundo argumento pelo numero de caracteres definido
-- no terceiro argumento
SELECT SUBSTRING('Raquel Moreno', 8, 6) AS 'Sobrenome' -- Moreno


SELECT 'Marcus Cavalcanti' AS 'Nome'

SELECT CHARINDEX(' ', 'Marcus Cavalcanti') AS 'Posi��o' -- 7

-- utilizando para extrair o sobrenome (nome que est� ap�s o espa�o)
SELECT SUBSTRING('Marcus Cavalcanti', CHARINDEX(' ', 'Marcus Cavalcanti') + 1, 100) AS 'Sobrenome' -- Cavalcanti
