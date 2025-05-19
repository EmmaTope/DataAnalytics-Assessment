SELECT 
    u.id AS customer_id,
    u.name,
    DATEDIFF(CURDATE(), u.date_joined) / 30.42 AS tenure_months,
    COUNT(s.id) AS total_transactions,
    AVG(s.confirmed_amount / 100.0) * 0.001 AS avg_profit_per_transaction,
    CASE 
        WHEN DATEDIFF(CURDATE(), u.date_joined) / 30.42 > 0 
        THEN (COUNT(s.id) / (DATEDIFF(CURDATE(), u.date_joined) / 30.42)) * 12 * (AVG(s.confirmed_amount / 100.0) * 0.001)
        ELSE 0 
    END AS estimated_clv
FROM 
    users_customuser u
    LEFT JOIN savings_savingsaccount s ON u.id = s.owner_id
GROUP BY 
    u.id, u.name, u.date_joined
ORDER BY 
    estimated_clv DESC;