SELECT 
    p.id AS plan_id,
    p.owner_id,
    CASE 
        WHEN p.is_regular_savings = 1 THEN 'Savings'
        WHEN p.is_a_fund = 1 THEN 'Investment'
    END AS type,
    COALESCE(MAX(s.transaction_date), p.created_on) AS last_transaction_date,
    DATEDIFF(CURDATE(), COALESCE(MAX(s.transaction_date), p.created_on)) AS inactivity_days
FROM 
    plans_plan p
    LEFT JOIN savings_savingsaccount s ON p.id = s.plan_id
WHERE 
    (p.is_regular_savings = 1 OR p.is_a_fund = 1)
    AND p.is_archived = 0
    AND p.is_deleted_from_group = 0
GROUP BY 
    p.id, p.owner_id, p.is_regular_savings, p.is_a_fund, p.created_on
HAVING 
    inactivity_days >= 365
ORDER BY 
    inactivity_days DESC;