# Desafio Python e SQL

### Create

import pyodbc

# imprime os drivers disponiveis na maquina para facilitar o valor a ser alimentado em dadosConexao, caso seja no arquivo .py teremos que usar o print
print(pyodbc.drivers())

dadosConexao=('Driver={SQLite3 ODBC Driver};Server=localhost;Database=chinook.db')

conexao=pyodbc.connect(dadosConexao)

cursor=conexao.cursor()


# comando para criar um comando/query a ser commitado ao banco de dados
# cursor.execute('COMANDO SQL')

cursor.execute("""
INSERT INTO albums (Title,ArtistId)
VALUES
('Lira Rock',4)
""")

# apos fazemos o comando execute precisamos 'commitar' esse comando para o banco de dados ou ele nao sera efetuado no banco de dados, para isso utilizaremos o cursor.commit()
cursor.commit()


# encerrando a conexao do banco de dados
cursor.close()
conexao.close()