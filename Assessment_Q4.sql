
-- Q4: Customer Lifetime Value Estimation

WITH transaction_stats AS (
    SELECT 
        u.id AS customer_id,
        CONCAT(u.first_name, ' ', u.last_name) AS name,
        TIMESTAMPDIFF(MONTH, u.date_joined, CURRENT_DATE()) AS tenure_months,
        COUNT(s.id) AS total_transactions,
        AVG(s.confirmed_amount * 0.001) AS avg_profit_per_transaction
    FROM users_customuser u
    JOIN savings_savingsaccount s ON u.id = s.owner_id
    WHERE s.confirmed_amount > 0
    GROUP BY u.id
)
SELECT 
    customer_id,
    name,
    tenure_months,
    total_transactions,
    ROUND((total_transactions / tenure_months) * 12 * avg_profit_per_transaction, 2) AS estimated_clv
FROM transaction_stats
WHERE tenure_months > 0
ORDER BY estimated_clv DESC;
