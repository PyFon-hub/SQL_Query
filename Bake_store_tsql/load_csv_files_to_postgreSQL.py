import pandas as pd
import psycopg2 
from sqlalchemy import create_engine
import os

password = os.environ['postgresql_pass']
print(password)

conn_string = f"postgresql://postgres:{password}@localhost:5432/bake_store"
db = create_engine(conn_string)
conn = db.connect()

for i in os.listdir("./Data"):
    df = pd.read_csv("./Data/"+i)
    df.to_sql(i[:-4], con= conn, if_exists= 'replace', index= False)

