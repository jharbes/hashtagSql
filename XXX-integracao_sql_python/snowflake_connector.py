"""
The Bridge 		
________________________________________
Discussions: Table of Contents 
Artificial Intelligence 

	o	Faster way to connect your python script with Snowflake
o	Reply to: Faster way to connect your python script with Snowflake
Daily Activity 
Artificial Intelligence 

Faster way to connect your python script with Snowflake 
Reply

To connect a Python script to Snowflake, you can use the Snowflake Connector for Python, which is the official Snowflake Python driver. To make the connection faster and more efficient, you can follow these best practices: Install the Snowflake Connector for Python: You can install the Snowflake Connector for Python using pip:

"""
pip install snowflake-connector-python

def lookup(x):
    with snowflake.connector.connect(
        user="Ricardo.Fernandes@technipfmc.com",
        account="technipfmc-data",
        authenticator="externalbrowser",
        client_store_temporary_credential = True,
        warehouse="compute_wh",
        database="idsprod",
        role ="eddp_digital_dev"
    ) as conn:
        cursor = conn.cursor()
        cursor.execute(x)
        return cursor.fetch_pandas_all()
In oder to execute the code you can simply write a sql code like:

SQL = '''
Select count(*) from rpl_sap.mard
'''
and finally:
df = lookup(query)

"""
Please share your script and lets discuss which should be the one we could use as a baseline.
Posted By Ricardo Fernandes On 23-Oct-2023 	Return to top

________________________________________

Reply to: Faster way to connect your python script with Snowflake 
Reply

Thanks for sharing
Posted By Bukky Ogunlowo On 23-Oct-2023 	Return to top

________________________________________

Confidentiality Notice	
All content in The Well and The Bridge is confidential and subject to the company's Information Security Policy - POL-COR-024
"""

