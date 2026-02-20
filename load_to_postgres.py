import pandas as pd
from sqlalchemy import create_engine

# Load cleaned CSV
df = pd.read_csv("customer_behavior_cleaned.csv")

# PostgreSQL connection
engine = create_engine(
    "postgresql+psycopg2://postgres:YOUR_PASSWORD@localhost:5432/customer_behavior"
)

# Load into PostgreSQL
df.to_sql("customer_behavior", engine, if_exists="replace", index=False)

print("Data loaded into PostgreSQL successfully!")