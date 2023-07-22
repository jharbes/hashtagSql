-- Exercicios - introducaoAoSql

use ContosoRetailDW;

/*
1. Você é responsável por controlar os dados de clientes e de produtos da sua empresa.
O que você precisará fazer é confirmar se:

a. Existem 2.517 produtos cadastrados na base e, se não tiver, você deverá reportar ao seu
gestor para saber se existe alguma defasagem no controle dos produtos.

b. Até o mês passado, a empresa tinha um total de 19.500 clientes na base de controle.
Verifique se esse número aumentou ou reduziu.*/-- a)select count(*) as 'Quantidade de Produtos' from dbo.DimProduct;-- retorno 2517 linhas, ou seja, mantém-se o valor-- b)select count(*) 'Número de Clientes' from dbo.DimCustomer;-- número reduziu, agora possui apenas 18.869 clientes/*2. Você trabalha no setor de marketing da empresa Contoso e acaba de ter uma ideia de oferecer
descontos especiais para os clientes no dia de seus aniversários. Para isso, você vai precisar
listar todos os clientes e as suas respectivas datas de nascimento, além de um contato.

a) Selecione as colunas: CustomerKey, FirstName, EmailAddress, BirthDate da tabela
dimCustomer.

b) Renomeie as colunas dessa tabela usando o alias (comando AS).*/-- a)select CustomerKey,FirstName,EmailAddress,BirthDate from DimCustomer;-- b)select 	CustomerKey as 'Número do Cliente',	FirstName as 'Primeiro Nome',	EmailAddress as 'Endereço de E-mail',	BirthDate as 'Data de Nascimento'from	DimCustomer;/*3. A Contoso está comemorando aniversário de inauguração de 10 anos e pretende fazer uma
ação de premiação para os clientes. A empresa quer presentear os primeiros clientes desde
a inauguração.

Você foi alocado para levar adiante essa ação. Para isso, você terá que fazer o seguinte:

a) A Contoso decidiu presentear os primeiros 100 clientes da história com um vale compras
de R$ 10.000. Utilize um comando em SQL para retornar uma tabela com os primeiros
100 primeiros clientes da tabela dimCustomer (selecione todas as colunas).

b) A Contoso decidiu presentear os primeiros 20% de clientes da história com um vale
compras de R$ 2.000. Utilize um comando em SQL para retornar 10% das linhas da sua
tabela dimCustomer (selecione todas as colunas).

c) Adapte o código do item a) para retornar apenas as 100 primeiras linhas, mas apenas as
colunas FirstName, EmailAddress, BirthDate.

d) Renomeie as colunas anteriores para nomes em português.
*/

-- a)
select top(100) * from dbo.DimCustomer;

-- b)
select top(10) percent * from dbo.DimCustomer;

-- c)
select top(100) FirstName,EmailAddress,BirthDate from dbo.DimCustomer;

-- d)
select 
	top(100)
	FirstName as 'Primeiro Nome',
	EmailAddress as 'Endereço de E-mail',
	BirthDate as 'Data de Nascimento' 
from
	dbo.DimCustomer;



/*
4. A empresa Contoso precisa fazer contato com os fornecedores de produtos para repor o
estoque. Você é da área de compras e precisa descobrir quem são esses fornecedores.

Utilize um comando em SQL para retornar apenas os nomes dos fornecedores na tabela
dimProduct e renomeie essa nova coluna da tabela.*/select distinct Manufacturer as Fornecedor from dbo.DimProduct;/*5. O seu trabalho de investigação não para. Você precisa descobrir se existe algum produto
registrado na base de produtos que ainda não tenha sido vendido. Tente chegar nessa
informação.

Obs: caso tenha algum produto que ainda não tenha sido vendido, você não precisa descobrir
qual é, é suficiente saber se teve ou não algum produto que ainda não foi vendido.
*/

select 
	count(ProductKey) as 'Número de Produtos',
	(select count(distinct ProductKey) from dbo.FactSales) as 'Número de Produtos Vendidos'
from
	dbo.DimProduct;