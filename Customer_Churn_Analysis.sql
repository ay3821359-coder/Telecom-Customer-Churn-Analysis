1. Count total customers.
SELECT COUNT(*) AS total_customers
FROM `customer-churn-analysis-514909.customer_churn.telco_customers`;

2. Display the first 10 customer records.
SELECT *
FROM `customer-churn-analysis-514909.customer_churn.telco_customers`
LIMIT 10;

3. Find all unique contract types.
SELECT DISTINCT Contract
FROM `customer-churn-analysis-514909.customer_churn.telco_customers`;

4. Count customers who have churned.
SELECT
    COUNT(*) AS churned_customers
FROM
    `customer-churn-analysis-514909.customer_churn.telco_customers`
WHERE
    Churn = TRUE;


5. Find customers whose MonthlyCharges are greater than 100.
SELECT customerID, MonthlyCharges
FROM `customer-churn-analysis-514909.customer_churn.telco_customers`
WHERE MonthlyCharges > 100;

6. Count customers by gender.
SELECT gender, COUNT(*) AS total_customers
FROM `customer-churn-analysis-514909.customer_churn.telco_customers`
GROUP BY gender;

7. Calculate average MonthlyCharges.
SELECT AVG(MonthlyCharges) AS avg_monthly_charges
FROM `customer-churn-analysis-514909.customer_churn.telco_customers`;

8. Calculate total revenue from all customers using TotalCharges.
SELECT SUM(TotalCharges) AS total_revenue
FROM `customer-churn-analysis-514909.customer_churn.telco_customers`;


9. Calculate churn rate by contract type.

SELECT
    Contract,
    COUNT(*) AS total_customers,
    COUNTIF(Churn = TRUE) AS churned_customers,
    ROUND(
        COUNTIF(Churn = TRUE) * 100.0 / COUNT(*), 2
    ) AS churn_rate
FROM
    `customer-churn-analysis-514909.customer_churn.telco_customers`
GROUP BY
    Contract;

10. How can we identify the column names and their data types in the customer churn database?
SELECT
    column_name,
    data_type
FROM
    `customer-churn-analysis-514909.customer_churn.INFORMATION_SCHEMA.COLUMNS`
ORDER BY
    ordinal_position;

11.The retention team wants to identify customers who:
- Have a tenure greater than 48 months.
- Have churned.
Task: Display their customerID, tenure, Contract, and MonthlyCharges.
SELECT
    customerID,
    tenure,
    Contract,
    MonthlyCharges
FROM
    `customer-churn-analysis-514909.customer_churn.telco_customers`
WHERE
    tenure > 48
    AND Churn = TRUE;

12.The company wants to categorize customers based on how long they have stayed with the business.
SELECT
    customerID,
    tenure,
    CASE
        WHEN tenure <= 12 THEN 'New Customer'
        WHEN tenure <= 24 THEN 'Regular Customer'
        ELSE 'Loyal Customer'
    END AS customer_category
FROM
    `customer-churn-analysis-514909.customer_churn.telco_customers`;

13.The company wants to identify customers whose monthly charges are higher than the average monthly charges of all customers.
SELECT
    customerID,
    MonthlyCharges,
    Contract
FROM
    `customer-churn-analysis-514909.customer_churn.telco_customers`
WHERE
    MonthlyCharges > (
        SELECT AVG(MonthlyCharges)
        FROM `customer-churn-analysis-514909.customer_churn.telco_customers`
    )
ORDER BY
    MonthlyCharges DESC;

14. The business team wants to compare average monthly charges across different internet services and contract types.
WITH customer_summary AS (
    SELECT
        InternetService,
        Contract,
        AVG(MonthlyCharges) AS avg_monthly_charges,
        COUNT(*) AS total_customers

    FROM
        `customer-churn-analysis-514909.customer_churn.telco_customers`

    GROUP BY
        InternetService,
        Contract
)
SELECT *
FROM customer_summary
ORDER BY avg_monthly_charges DESC;

15. The company wants to identify its highest-paying customers based on monthly charges.
Task: Rank customers from highest to lowest MonthlyCharges.

SELECT
    customerID,
    MonthlyCharges,

    RANK() OVER (
        ORDER BY MonthlyCharges DESC
    ) AS customer_rank

FROM
    `customer-churn-analysis-514909.customer_churn.telco_customers`

ORDER BY
    customer_rank;

16. The company wants to identify its top 5 customers who have generated the highest recorded total charges.
Task: Display:
- Customer ID
- Total Charges
- Contract
- Tenure

SELECT
    customerID,
    TotalCharges,
    Contract,
    tenure

FROM
    `customer-churn-analysis-514909.customer_churn.telco_customers`

ORDER BY
    TotalCharges DESC

LIMIT 5;

17. The company wants to identify which internet service category has the highest customer churn rate.
Task: Calculate the following for each Internet Service:
- Total customers
- Churned customers
- Churn rate (%)

SELECT
    InternetService,

    COUNT(*) AS total_customers,

    COUNTIF(Churn = TRUE) AS churned_customers,

    ROUND(
        SAFE_DIVIDE(
            COUNTIF(Churn = TRUE) * 100,
            COUNT(*)
        ), 2
    ) AS churn_rate

FROM
    `customer-churn-analysis-514909.customer_churn.telco_customers`

GROUP BY
    InternetService

ORDER BY
    churn_rate DESC;

18. The company's retention team wants to identify which combination of contract type and technical support has the highest customer churn rate.
For example:
- Month-to-month + No TechSupport
- One year + TechSupport
- Two year + No TechSupport
SELECT
    Contract,
    TechSupport,

    COUNT(*) AS total_customers,

    COUNTIF(Churn = TRUE) AS churned_customers,

    ROUND(
        SAFE_DIVIDE(
            COUNTIF(Churn = TRUE) * 100,
            COUNT(*)
        ), 2
    ) AS churn_rate

FROM
    `customer-churn-analysis-514909.customer_churn.telco_customers`

GROUP BY
    Contract,
    TechSupport

HAVING
    COUNT(*) >= 30

ORDER BY
    churn_rate DESC;

Q19. Find churned customers without TechSupport
SELECT
    customerID,
    Contract,
    TechSupport,
    Churn
FROM
    `customer-churn-analysis-514909.customer_churn.telco_customers`
WHERE
    TechSupport = 'No'
    AND Churn = TRUE;
    
 Q20. Calculate churn rate by Senior Citizen status

SELECT
    SeniorCitizen,
    COUNT(*) AS total_customers,
    COUNTIF(Churn = TRUE) AS churned_customers,
    ROUND(
        SAFE_DIVIDE(COUNTIF(Churn = TRUE) * 100, COUNT(*)), 2
    ) AS churn_rate
FROM
    `customer-churn-analysis-514909.customer_churn.telco_customers`
GROUP BY
    SeniorCitizen
ORDER BY
    churn_rate DESC;
