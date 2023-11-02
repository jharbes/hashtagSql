# Desafio Python e SQL

### Delete

import pyodbc

# imprime os drivers disponiveis na maquina para facilitar o valor a ser alimentado em dadosConexao, caso seja no arquivo .py teremos que usar o print
print(pyodbc.drivers())

dadosConexao=('Driver={SQLite3 ODBC Driver};Server=localhost;Database=chinook.db')

conexao=pyodbc.connect(dadosConexao)

cursor=conexao.cursor()


# executando o delete (deletando uma linha do banco de dados)
cursor.execute("""
DELETE FROM albums WHERE AlbumId=2
""")

cursor.commit()


# Fechando conexao
cursor.close()
conexao.close()