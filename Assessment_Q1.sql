
-- Q1: High-Value Customers with Multiple Products

-- Find customers with at least one funded savings plan (is_regular_savings = 1)
-- AND one funded investment plan (is_a_fund = 1), sorted by total deposits.

SELECT 
    u.id AS owner_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    COUNT(DISTINCT CASE WHEN p.is_regular_savings = 1 THEN s.id END) AS savings_count,
    COUNT(DISTINCT CASE WHEN p.is_a_fund = 1 THEN s.id END) AS investment_count,
    SUM(s.confirmed_amount) AS total_deposits
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id
JOIN plans_plan p ON s.plan_id = p.id
WHERE s.confirmed_amount > 0
GROUP BY u.id, name
HAVING savings_count > 0 AND investment_count > 0
ORDER BY total_deposits DESC;
