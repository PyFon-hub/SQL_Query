import pandas as pd
import psycopg2 
from sqlalchemy import create_engine
import os

conn_string = "postgresql://postgres:password@localhost:5432/olympics"
db = create_engine(conn_string)
conn = db.connect()

for i in os.listdir("./csv_files"):
    pass
#    df = pd.read_csv("./csv_files/"+i)
#    df.to_sql(i[:-4], con= conn, if_exists= 'replace', index= False)
