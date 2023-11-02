"""
# Biblioteca pyodbc

1. Precisamos criar uma conexão com o banco de dados.

dados_conexao = ("Driver={Seu_Driver};"
                "Server=SeuServidor;"
                Database=NomeBaseDeDados;")
          
Se estivéssemos usando outro sistema de banco de dados, nosso driver mudaria. Para saber em outros casos, execute:
pyodbc.drivers() -> caso não encontre seu driver ali, basta buscar no google por "driver MeuBancoDeDados for pyodbc" e baixar

caso precisasse de login e senha:
dados_conexao = ("Driver={Seu_Driver};"
            "Server=Seu_Servidor;"
            "Database=NomeBaseDeDados;"
            "UID=Login;"
            "PWD=Senha;")

"""

import pyodbc
print(pyodbc.drivers())

dadosConexao=('Driver={SQLite3 ODBC Driver};Server=localhost;Database=salarios.sqlite')

conexao=pyodbc.connect(dadosConexao)
print('Conexão bem sucedida')




# 2. Agora, precisamos criar o que o pyodbc chama de cursor, que é basicamente quem vai executar os nossos códigos SQL

cursor=conexao.cursor()




# 3. Agora já podemos executar nossos comandos SQL.

# Temos 2 opções aqui:

#     1. Apenas Executar comandos SQL que vão acontecer no banco
#     2. Executar o comando SQL e armazenar a consulta em uma variável no Python, como um dataframe do pandas

# dataframe = pd.read_sql('COMANDO_SQL', conexao) -> vai executar o comando SQL, gerando uma consulta e retornando a resposta dessa consulta para o dataframe

# Para pegar uma tabela inteira do nosso banco de dados, usaremos o comando SQL Select *:
# "SELECT * FROM BaseDeDados.Tabela"


# o comando cursor execute executa o comando sql que está em seu argumento
cursor.execute('SELECT * FROM Salaries')

# puxa as informacoes do cursor e colocam na variavel valores
valores=cursor.fetchall()

# imprime os 10 primeiros valores, observe que se trata de uma lista de tuplas, onde cada tupla é uma linha da tabela em questao
print(valores[:10])



# encerrando a conexao
cursor.close()
conexao.close()