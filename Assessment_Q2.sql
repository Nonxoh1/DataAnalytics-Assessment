
-- Q2: Transaction Frequency Analysis
-- Categorize customers by how frequently they transact per month.

WITH transactions_per_customer AS (
    SELECT 
        u.id AS customer_id,
        COUNT(s.id) AS total_transactions,
        DATEDIFF(MAX(s.transaction_date), MIN(s.transaction_date)) / 30.0 AS active_months
    FROM users_customuser u
    JOIN savings_savingsaccount s ON u.id = s.owner_id
    GROUP BY u.id
),
frequency_classification AS (
    SELECT 
        customer_id,
        total_transactions,
        active_months,
        CASE 
            WHEN active_months = 0 THEN total_transactions
            ELSE total_transactions / active_months
        END AS avg_txn_per_month
    FROM transactions_per_customer
),
categorized AS (
    SELECT 
        CASE 
            WHEN avg_txn_per_month >= 10 THEN 'High Frequency'
            WHEN avg_txn_per_month >= 3 THEN 'Medium Frequency'
            ELSE 'Low Frequency'
        END AS frequency_category,
        avg_txn_per_month
    FROM frequency_classification
)
SELECT 
    frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_txn_per_month), 1) AS avg_transactions_per_month
FROM categorized
GROUP BY frequency_category
ORDER BY avg_transactions_per_month DESC;
