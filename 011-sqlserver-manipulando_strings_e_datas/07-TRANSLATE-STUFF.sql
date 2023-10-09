-- [SQL Server] Manipulando Strings e Datas no SQL
-- Aula 7 de 23: TRANSLATE e STUFF


-- TRANSLATE e STUFF: Outras funções de substituição


-- observe que o '.' virou 'a', o '/' virou 'b' e o 'k' virou 'c'
select TRANSLATE('10.241/444.124k23/1', './k', 'abc'); -- 10a241b444a124c23b1

-- observe que o '[' virou '(', o ']' virou ')', o '{' virou '(' e o '}' virou ')'
SELECT TRANSLATE('3*[2+1]/{8-4}', '[]{}', '()()'); -- 3*(2+1)/(8-4)

-- observe que o 'A' virou 'W', o 'B' virou 'X', o 'C' virou 'Y' e o 'D' virou 'Z'
SELECT TRANSLATE('ABCD-490123', 'ABCD', 'WXYZ'); -- WXYZ-490123

-- observe que o TRANSLATE TAMBÉM NÃO é CASE SENSITIVE
SELECT TRANSLATE('ABCD-490123', 'abcd', 'WXYZ'); -- WXYZ-490123



-- o STUFF substituira o texto começando na posição do 2o argumento e prologando
--pelo numero de caracteres do 3o argumento pelo texto que está no 4o argumento
SELECT STUFF('VBA Impressionador', 1, 3, 'Excel'); -- Excel Impressionador

select STUFF('VBA Impressionador', 5, 3,'XXXX'); -- VBA XXXXressionador

select STUFF('MT98-Moto G', 1, 2, 'CEL'); -- CEL98-Moto G

select STUFF('AP01-IPhone', 1, 2, 'CEL'); -- CEL01-IPhone
