# Desafio Python e SQL

### Update

import pyodbc

# imprime os drivers disponiveis na maquina para facilitar o valor a ser alimentado em dadosConexao, caso seja no arquivo .py teremos que usar o print
print(pyodbc.drivers())

dadosConexao=('Driver={SQLite3 ODBC Driver};Server=localhost;Database=chinook.db')

conexao=pyodbc.connect(dadosConexao)

cursor=conexao.cursor()


cursor.execute('''
UPDATE customers SET Email="lira@embraer.com.br" WHERE Email="luisg@embraer.com.br"
''') # executar o comando SQL, observe que como usamos aspas simples do lado de fora teremos que usar aspas duplas para envolver os emails

cursor.commit() # perpetuar no bando as alteracoes efetuadas


cursor.close()
conexao.close() # finalizar a conexao