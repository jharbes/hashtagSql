"""
ATENÇÃO

SEMPRE FECHA A CONEXÃO E O CURSOR

"""


import pyodbc

# efetuando conexao
dadosConexao=("Driver={SQLite3 ODBC Driver};Server=localhost;Database=chinook.db")

conexao=pyodbc.connect(dadosConexao)

cursor=conexao.cursor()

# cursor.execute()

# fechando conexao

cursor.close()
conexao.close() # finalizar a conexao