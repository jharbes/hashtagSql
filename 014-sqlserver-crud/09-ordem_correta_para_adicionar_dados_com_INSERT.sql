-- [SQL Server] CRUD
-- Aula 8 de 21 - INSERT SELECT - Adicionando novos valores na tabela

-- Crie uma tabela chamada 'Produtos'
-- Essa abela deve conter 4 colunas: id_produt, nome_produto, data_validade e preco_produto
-- Certifique-se de que o tipo das colunas está correto.

CREATE DATABASE BDImpressionador;    -- Obs: Se você já criou o BD Impressionador não precisa executar esta linha

drop table Produtos;

use BDImpressionador;

CREATE TABLE Produtos(
	id_produto INT,
	nome_produto VARCHAR(200),
	data_validade DATETIME,
	preco_produto FLOAT
);

SELECT * FROM Produtos;



-- Adicionando novos valores na tabela

INSERT INTO Produtos(id_produto, nome_produto, data_validade, preco_produto)
VALUES
	(1, 'Arroz', '31/12/2021', 22.50),
	(2, 'Feijão', '20/11/2022', 8.99);

insert into Produtos (data_validade, id_produto, preco_produto)
values
	('31/05/2023',3,33.99);