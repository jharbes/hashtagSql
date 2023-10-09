-- Por que precisamos do JOIN?

use ContosoRetailDW;

select top(1000) * from FactSales;

select * from DimChannel;


-- usaremos o JOIN Para relacionar duas ou mais colunas atraves de colunas que tenham algum valor em comum

-- left join preferencia para listar as informacoes da tabela da esquerda
select top(10) * from FactSales left join DimChannel on FactSales.channelKey=DimChannel.ChannelKey;

-- right join preferencia para listar as informacoes da tabela da esquerda
select top(10) * from FactSales right join DimChannel on FactSales.channelKey=DimChannel.ChannelKey;