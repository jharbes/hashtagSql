-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 10, 11 e 12 de 23: CHARINDEX e SUBSTRING

-- CHARINDEX: Descobre a posição de um determinado caractere dentro de um texto
-- SUBSTRING: Extrai alguns caracteres de dentro de um texto

-- mostra em que caractere se inicia a string do primeiro argumento em relaçao a string
-- total (segundo argumento)
SELECT CHARINDEX('Moreno', 'Raquel Moreno') AS 'Posição Sobrenome' -- 8


-- na ausencia da posição procurada a função retornará 0 (zero)
select CHARINDEX('X', 'Raquel Moreno') -- 0


-- inicia o recorte da String no valor do segundo argumento pelo numero de caracteres definido
-- no terceiro argumento
SELECT SUBSTRING('Raquel Moreno', 8, 6) AS 'Sobrenome' -- Moreno


SELECT 'Marcus Cavalcanti' AS 'Nome'

SELECT CHARINDEX(' ', 'Marcus Cavalcanti') AS 'Posição' -- 7

-- utilizando para extrair o sobrenome (nome que está após o espaço), observe que o valor 100 está
-- apenas indicando que deseja que vá até o fim da string
SELECT SUBSTRING('Marcus Cavalcanti', CHARINDEX(' ', 'Marcus Cavalcanti') + 1, 100) AS 'Sobrenome' -- Cavalcanti

SELECT SUBSTRING('Raquel Moreno', CHARINDEX(' ', 'Raquel Moreno') + 1, 100) AS 'Sobrenome' -- Moreno

SELECT SUBSTRING('Ralf Schwainszteinger', CHARINDEX(' ', 'Ralf Schwainszteinger') + 1, 100) AS 'Sobrenome' -- Schwainszteinger


declare @var_nome varchar(100)
set @var_nome = 'Bernardo Stumpf'

SELECT SUBSTRING(@var_nome, CHARINDEX(' ', @var_nome) + 1, 100) AS 'Sobrenome' -- Stumpf
