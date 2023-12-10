-- [SQL Server] Views
-- Aula 5 de 13: ALTER VIEW

-- 1. Exemplos
-- a) Altere a view abaixo para incluir apenas os clientes do sexto Feminino


-- o ALTER VIEW atualiza a view com os dados do novo select, importante saber que precisa reincluir o select completo ja alterado
ALTER VIEW vwClientes AS
SELECT
	FirstName AS 'Nome',
	EmailAddress AS 'E-mail',
	BirthDate AS 'Data Nascimento',
	Gender AS 'Sexo'
FROM 
	DimCustomer
WHERE Gender = 'F';
GO

select * from vwClientes;