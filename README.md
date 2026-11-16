# Telecom Customer Churn Analysis

## Project Overview
This project analyzes customer churn in the telecommunications industry using Python, Pandas and Google BigQuery SQL. The objective is to understand customer behaviour, identify churn patterns and provide actionable business recommendations.

## Business Problem
Customer churn affects recurring revenue and long-term business growth. This analysis explores customer characteristics and service usage to identify segments with higher churn rates.

## Dataset
- **Source:** [IBM Telco Customer Churn Dataset](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)
- **Total Records:** 7,043 customers
- **Total Columns:** 21
- **Target Variable:** Churn

## Tools & Technologies
- Python
- Jupyter Notebook
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Google BigQuery
- SQL

## Project Workflow

### 1. Data Cleaning
- Inspected dataset structure and data types.
- Checked missing values and duplicate records.
- Converted TotalCharges into numeric format.
- Handled 11 missing TotalCharges values associated with zero-tenure customers.

### 2. Exploratory Data Analysis
- Contract Type vs Churn
- Technical Support vs Churn
- Additional Services vs Churn
- Tenure Group vs Churn
- Payment Method vs Churn
- Gender and Senior Citizen vs Churn
- Contract and Payment Method vs Churn
- Customer Revenue Exposure

### 3. SQL Analysis
Performed 20 SQL exercises using Google BigQuery, covering:
- SELECT, WHERE and DISTINCT
- COUNT, SUM and AVG
- GROUP BY and HAVING
- CASE WHEN
- Subqueries and CTEs
- Window Functions
- Customer churn rate analysis

## Key Findings
- Total customers: 7,043
- Churned customers: 1,869
- Overall churn rate: 26.54%
- Estimated historical revenue from churned customers: 2,862,576.90
- Monthly recurring revenue represented by churned customers at the time of churn: 139,130.85

## Business Recommendations
- Investigate reasons for higher churn among month-to-month contract customers.
- Review customer complaints and unresolved technical support tickets.
- Identify new customers who may be at risk of early churn.
- Investigate payment-related issues.
- Prioritize retention efforts for high-value, high-risk customers.

## Repository Structure
```text
Telecom-Customer-Churn-Analysis/
├── Customer_Churn_EDA.ipynb
├── Customer_Churn_Analysis.sql
└── README.md
```

## Project Outcome
This project demonstrates practical skills in data cleaning, exploratory data analysis, SQL querying and business insight generation.

**Note:** The revenue exposure figures are estimates based on the dataset's recorded customer charges, not audited accounting revenue or confirmed future revenue losses.
