-- Exercicios - introducaoAoSql

use ContosoRetailDW;

/*
1. Voc� � respons�vel por controlar os dados de clientes e de produtos da sua empresa.
O que voc� precisar� fazer � confirmar se:

a. Existem 2.517 produtos cadastrados na base e, se n�o tiver, voc� dever� reportar ao seu
gestor para saber se existe alguma defasagem no controle dos produtos.

b. At� o m�s passado, a empresa tinha um total de 19.500 clientes na base de controle.
Verifique se esse n�mero aumentou ou reduziu.*/-- a)select count(*) as 'Quantidade de Produtos' from dbo.DimProduct;-- retorno 2517 linhas, ou seja, mant�m-se o valor-- b)select count(*) 'N�mero de Clientes' from dbo.DimCustomer;-- n�mero reduziu, agora possui apenas 18.869 clientes/*2. Voc� trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer
descontos especiais para os clientes no dia de seus anivers�rios. Para isso, voc� vai precisar
listar todos os clientes e as suas respectivas datas de nascimento, al�m de um contato.

a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela
dimCustomer.

b) Renomeie as colunas dessa tabela usando o alias (comando AS).*/-- a)select CustomerKey,FirstName,EmailAddress,BirthDate from DimCustomer;-- b)select 	CustomerKey as 'N�mero do Cliente',	FirstName as 'Primeiro Nome',	EmailAddress as 'Endere�o de E-mail',	BirthDate as 'Data de Anivers�rio'from	DimCustomer;