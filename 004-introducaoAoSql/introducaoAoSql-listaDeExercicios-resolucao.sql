-- Exercicios - introducaoAoSql

use ContosoRetailDW;

/*
1. Você é responsável por controlar os dados de clientes e de produtos da sua empresa.
O que você precisará fazer é confirmar se:

a. Existem 2.517 produtos cadastrados na base e, se não tiver, você deverá reportar ao seu
gestor para saber se existe alguma defasagem no controle dos produtos.

b. Até o mês passado, a empresa tinha um total de 19.500 clientes na base de controle.
Verifique se esse número aumentou ou reduziu.*/-- a)select count(*) as 'Quantidade de Produtos' from dbo.DimProduct;-- retorno 2517 linhas, ou seja, mantém-se o valor-- b)select count(*) 'Número de Clientes' from dbo.DimCustomer;-- número reduziu, agora possui apenas 18.869 clientes/*2. Você trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer
descontos especiais para os clientes no dia de seus aniversários. Para isso, você vai precisar
listar todos os clientes e as suas respectivas datas de nascimento, além de um contato.

a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela
dimCustomer.

b) Renomeie as colunas dessa tabela usando o alias (comando AS).*/-- a)select CustomerKey,FirstName,EmailAddress,BirthDate from DimCustomer;-- b)select 	CustomerKey as 'Número do Cliente',	FirstName as 'Primeiro Nome',	EmailAddress as 'Endereço de E-mail',	BirthDate as 'Data de Aniversário'from	DimCustomer;