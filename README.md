# Data Analytics Using Databricks

##📊 Project Overview
This project demonstrates a comprehensive data analytics workflow within the Databricks ecosystem. I transformed raw CSV datasets into actionable business insights by leveraging Unity Catalog for data governance, Databricks SQL for deep-dive analysis, and integrated Dashboards for data storytelling. This project showcases a complete data lifecycle within the Databricks Data Intelligence Platform. I have created a "Genie Space," allowing non-technical stakeholders to chat directly with the data to gain insights.

#🛠️ Tech Stack & Features
Environment: Databricks (Free Edition)
Storage: Unity Catalog (Schema & Table management)
Query Engine: Databricks SQL Warehouse
Visualization: Databricks SQL Dashboards
Language: SQL

##🚀 Workflow

#Data Ingestion:
I initiated the project by setting up a structured environment within the Databricks Catalog.
1. Created a dedicated Schema to ensure organized data assets.
2. Managed the ingestion of raw CSV files into managed Delta tables, ensuring proper data types and schema enforcement.

#Data Exploration:
Using the Databricks SQL Editor, I performed analysis to extract core business metrics:
1. Calculated Total Sales, Unique Customers, Product Count, and Order Volume.
2. Analyzed total sales by Product Category and individual product items.
3. Tracked order volume over time

#Translating Queries into Visuals:
Created Visualization for the SQL queries which are used for analysis and added the visuals to a Dashboard.

#Build Dashboards based on business Requirements:
Developed two dashboards using datasets created via SQL queries, tailored specifically to meet business needs.
1. Sales Dashboard: Tracks total revenue, monthly trends, and category performance.

![Preview](https://github.com/nikitha-learning98/Data-Analytics-Using-Databricks/blob/main/Sales%20Dashboard.png)

2. Customer Dashboard: Analyzes customer volume, average spend, and age-based purchasing habits.



#Databricks Genie:
1. Developed a Genie space by providing instructions and seeding it with sample questions to guide the AI's logic.
2. Validated the space by testing natural language queries, reviewing generated SQL code, and providing feedback to improve accuracy.
