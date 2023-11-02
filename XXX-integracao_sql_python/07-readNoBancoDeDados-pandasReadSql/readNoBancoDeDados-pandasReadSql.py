# Desafio Python e SQL

### Read com pd.read_sql

# Podemos fazer conexão com outros tipos de banco de dados com o pd.read_sql além do SQLite, por exemplo com o comando SQLAlchemy, para maiores informações é interessante consultar a documentação do comando pandas.read_sql na documentação do pandas (pandas.pydata.org)

# No entanto poderemos sempre utilizar o pyodbc de forma a conseguir a conexao para acessar os dados pertinentes.

import pandas as pd

# no caso da utilizacao do pandas faremos a conexao por meio do sqlite3 (nem todos os tipos de banco de dados tem o suporte direto do pandas como a SQLite por exemplo)
import sqlite3

# conexao sqlite3 so funcionará com bancos de dados do tipo sqlite
conexao=sqlite3.connect('chinook.db')

# tabela_clientes=pd.read_sql('COMANDO SQL',conexao) # o comando sql ao lado tende a ser de leitura pois nao faz sentido criarmos um dataframe no pandas por meio de um comando de criacao ou insercao por exemplo

tabela_clientes=pd.read_sql('SELECT * FROM customers',conexao)
print(tabela_clientes)

# sempre importante encerrar a conexao após utiliza-la


conexao.close()