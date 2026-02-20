# 📊 Customer Behavior Analytics – End-to-End Data Analytics Project

## 🔎 Overview
This project demonstrates an end-to-end data analytics workflow, starting from raw data ingestion to business insights and visualization. The objective is to analyze customer shopping behavior and generate actionable insights using Python for data processing, SQL for analysis, and Power BI for interactive dashboards. A final report and presentation were created to communicate findings effectively to stakeholders.

---

## 📁 Dataset
- Source: Customer shopping behavior dataset (CSV format)  
- Description: Contains customer demographics, purchase details, product categories, ratings, discounts, and subscription information.  
- Preprocessing: Missing values handled, column names standardized, and new features (age groups, customer segments) engineered.

---

## 🛠️ Tools & Technologies
- **Python**: Pandas, NumPy, SQLAlchemy (EDA, data cleaning, data loading)  
- **Database**: PostgreSQL (SQL analysis)  
- **SQL**: Business queries and aggregations  
- **Power BI**: Interactive dashboard and data visualization  
- **pgAdmin**: Database management  
- **Gamma**: PPT creation for presentation  
- **GitHub**: Version control and project hosting  

---

## ⚙️ Steps Performed
1. Loaded raw dataset using Python  
2. Performed Exploratory Data Analysis (EDA)  
3. Cleaned and transformed data  
4. Loaded cleaned data into PostgreSQL  
5. Wrote SQL queries to answer business questions  
6. Built Power BI dashboard for insights  
7. Created analytical report and PPT presentation using Gamma  

---

## 📊 Dashboard
The Power BI dashboard includes:
- Revenue by gender  
- Average purchase amount by shipping type  
- Top-rated products  
- Subscriber vs non-subscriber spending  
- Revenue contribution by age group  
- Product and category-level trends  

---

## 📈 Results & Key Insights
- Subscribed customers tend to have higher average spending  
- Certain product categories drive the majority of revenue  
- Loyal customers contribute a significant share of total revenue  
- Discounts influence purchasing behavior for specific products  

---

## ▶️ How to Run

### 1. Clone the Repository
```bash
git clone https://github.com/swatisucharita-04/customer-behavior-analytics.git
cd customer-behavior-analytics
```

2. Install Dependencies
```
pip install pandas sqlalchemy psycopg2-binary
```

3. Load Data to PostgreSQL
Update database credentials in load_to_postgres.py and run:

```
python load_to_postgres.py
```

5. Run SQL Queries
Execute queries from analysis_queries.sql in pgAdmin or any SQL client.

6. Open Power BI Dashboard
Open the .pbix file in Power BI Desktop to explore the interactive dashboard.

<img width="1273" height="723" alt="dashboard_overview png" src="https://github.com/user-attachments/assets/ce5e732a-9e79-4f20-9f5e-59c54b58a5cf" />








