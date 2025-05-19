WITH CustomerTransactionStats AS (
    SELECT 
        u.id AS customer_id,
        COUNT(s.id) AS total_transactions,
        DATEDIFF(CURDATE(), MIN(u.date_joined)) / 30 AS customer_months,
        COUNT(s.id) / (DATEDIFF(CURDATE(), MIN(u.date_joined)) / 30) AS avg_transactions_per_month
    FROM 
        users_customuser u
        LEFT JOIN savings_savingsaccount s ON u.id = s.owner_id
    GROUP BY 
        u.id
    HAVING 
        customer_months > 0
)
SELECT 
    CASE 
        WHEN avg_transactions_per_month >= 10 THEN 'High Frequency'
        WHEN avg_transactions_per_month >= 3 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category,
    COUNT(*) AS customer_count,
    AVG(avg_transactions_per_month) AS avg_transactions_per_month
FROM 
    CustomerTransactionStats
GROUP BY 
    frequency_category
ORDER BY 
    avg_transactions_per_month DESC;