"""
# Biblioteca pyodbc

1. Precisamos criar uma conexão com o banco de dados.

dados_conexao = ("Driver={Seu_Driver};"
                "Server=SeuServidor;"
                Database=NomeBaseDeDados;")
          
Se estivéssemos usando outro sistema de banco de dados, nosso driver mudaria. Para saber em outros casos, execute:
pyodbc.drivers() -> caso não encontre seu driver ali, basta buscar no google por "driver MeuBancoDeDados for pyodbc" e baixar

"""

import pyodbc

# imprime os drivers que estao instalados no computador
print(pyodbc.drivers())