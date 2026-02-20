from sqlalchemy import create_engine

engine = create_engine(
    "postgresql+psycopg2://postgres:YOUR_PASSWORD@localhost:5432/customer_behavior"
)

conn = engine.connect()
print("Connected to PostgreSQL successfully!")
conn.close()