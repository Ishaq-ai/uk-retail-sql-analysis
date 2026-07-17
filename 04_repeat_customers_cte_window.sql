-- Business Question: Which customers are the most loyal repeat buyers, 
-- based on how many distinct months they made a purchase?
-- Technique: Chained CTEs + window function (RANK())

WITH customer_monthly_activity AS (
    SELECT
        customer_id,
        DATE_FORMAT(invoice_date, '%Y-%m') AS purchase_month
    FROM online_retail
    WHERE customer_id IS NOT NULL
    GROUP BY customer_id, DATE_FORMAT(invoice_date, '%Y-%m')
),
customer_active_months AS (
    SELECT
        customer_id,
        COUNT(*) AS active_months
    FROM customer_monthly_activity
    GROUP BY customer_id
)
SELECT
    customer_id,
    active_months,
    RANK() OVER (ORDER BY active_months DESC) AS loyalty_rank
FROM customer_active_months
ORDER BY active_months DESC
LIMIT 20;