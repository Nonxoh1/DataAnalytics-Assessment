
-- Q3: Simplified Account Inactivity Alert (no filters on plan type or status)

SELECT 
    s.plan_id,
    s.owner_id,
    'Unknown' AS type,
    MAX(s.transaction_date) AS last_transaction_date,
    DATEDIFF(CURRENT_DATE(), MAX(s.transaction_date)) AS inactivity_days
FROM savings_savingsaccount s
WHERE s.confirmed_amount > 0
GROUP BY s.plan_id, s.owner_id
HAVING DATEDIFF(CURRENT_DATE(), MAX(s.transaction_date)) > 365;
