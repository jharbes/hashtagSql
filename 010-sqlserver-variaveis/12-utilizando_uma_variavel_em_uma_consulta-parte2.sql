-- [SQL Server] Variáveis
-- Aula 12 de 23: Utilizando uma variável em uma consulta (Parte 2)

-- Crie uma variável de data para otimizar a consulta abaixo. 

DECLARE @varData DATETIME
SET @varData = '01/01/1980'

SELECT 
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	'Cliente' AS 'Tipo'
FROM	
	DimCustomer
WHERE BirthDate >= @varData

UNION

SELECT 
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	'Funcionário' AS 'Tipo'
FROM	
	DimEmployee
WHERE BirthDate >= @varData
ORDER BY Nascimento



-- Exemplo2:
-- Descobrindo os aniversariantes

/*
create function calcular_idade(@BirthDate datetime)
returns int
as
begin
	declare @idade int;

	set @idade=year(CURRENT_TIMESTAMP)-year(@BirthDate)

	IF (MONTH(@BirthDate) > MONTH(@BirthDate)) OR 
       (MONTH(@BirthDate) = MONTH(@BirthDate) AND DAY(@BirthDate) > DAY(@BirthDate))
    BEGIN
        SET @idade = @idade - 1
    END

    RETURN @idade
end

*/

DECLARE @dia_aniversario int
declare @mes_aniversario int

set @dia_aniversario=day(CURRENT_TIMESTAMP)
set @mes_aniversario=MONTH(CURRENT_TIMESTAMP)


SELECT 
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	--calcular_idade(BirthDate) as 'Idade',
	'Cliente' AS 'Tipo'
FROM	
	DimCustomer
WHERE day(BirthDate) = @dia_aniversario and MONTH(BirthDate)=@mes_aniversario

UNION

SELECT 
	FirstName AS 'Nome',
	LastName AS 'Sobrenome',
	BirthDate AS 'Nascimento',
	--year(CURRENT_TIMESTAMP)-year(BirthDate) as 'Idade',
	'Funcionário' AS 'Tipo'
FROM	
	DimEmployee
WHERE day(BirthDate) = @dia_aniversario and MONTH(BirthDate)=@mes_aniversario
ORDER BY 'Nome'
