-- Business Question: Who are our top 10 customers by total lifetime spend?
-- Technique: Common Table Expression (CTE)
-- Note: customer_id = 0 represents unlinked/guest transactions and was 
-- converted to NULL prior to analysis (243,007 rows affected)

WITH customer_spend AS (
    SELECT 
        customer_id,
        SUM(quantity * price) AS total_spend
    FROM online_retail
    WHERE customer_id IS NOT NULL
    GROUP BY customer_id
)
SELECT 
    customer_id,
    total_spend
FROM customer_spend
ORDER BY total_spend DESC
LIMIT 10;