-- Declarando mais de uma vari�vel

-- OP��O 1

declare @var1 int
declare @texto varchar(30)
declare @data datetime

set @var1=10
set @texto='Um texto qualquer'
set @data='18/02/2021'

select @var1, @texto, @data