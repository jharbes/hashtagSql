# Desafio Python e SQL

### Read

import pyodbc

# imprime os drivers disponiveis na maquina para facilitar o valor a ser alimentado em dadosConexao, caso seja no arquivo .py teremos que usar o print
print(pyodbc.drivers())

dadosConexao=('Driver={SQLite3 ODBC Driver};Server=localhost;Database=chinook.db')

conexao=pyodbc.connect(dadosConexao)

cursor=conexao.cursor()


cursor.execute('SELECT * FROM customers')

# cursor.commit() - só é necessario quando for um comando execute MODIFICAR o banco de dados

valores=cursor.fetchall() 
descricao=cursor.description # retorna as informacoes da tabela

"""
valores retornará uma lista de tuplas:

valores=[
    (id,nome,profissao,...),
    (),
    (),
    ...,
    ()
]

"""

print(type(valores))
print(descricao)
print(valores)

colunas=[tupla[0] for tupla in descricao] # list comprehension
print(colunas)



import pandas as pd

# tabela_clientes=pd.DataFrame.from_records(valores) # nesse caso as colunas serao criadas sem seus nomes
# tabela_clientes=pd.DataFrame.from_records(valores,columns=['ID','Nome','Sobrenome','Empresa','Endereço','Cidade','Estado','País','CEP','Tel','Fax','Email','SupportRepId'])
tabela_clientes=pd.DataFrame.from_records(valores,columns=colunas)

print(tabela_clientes)



cursor.close()
conexao.close()