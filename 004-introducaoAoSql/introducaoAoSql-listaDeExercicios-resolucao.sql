-- Exercicios - introducaoAoSql

use ContosoRetailDW;

/*
1. Voc� � respons�vel por controlar os dados de clientes e de produtos da sua empresa.
O que voc� precisar� fazer � confirmar se:

a. Existem 2.517 produtos cadastrados na base e, se n�o tiver, voc� dever� reportar ao seu
gestor para saber se existe alguma defasagem no controle dos produtos.

b. At� o m�s passado, a empresa tinha um total de 19.500 clientes na base de controle.
Verifique se esse n�mero aumentou ou reduziu.*/-- a)select * from dbo.DimProduct;-- retorno 2517 linhas, ou seja, mant�m-se o valor-- b)select * from dbo.DimCustomer;-- n�mero reduziu, agora possui apenas 18.869 clientes