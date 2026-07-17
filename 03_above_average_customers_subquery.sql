-- Business Question: Which customers spent more than the average customer?
-- Technique: Subquery (nested aggregate comparison in HAVING clause)

SELECT
    customer_id,
    SUM(quantity * price) AS total_spend
FROM online_retail
WHERE customer_id IS NOT NULL
GROUP BY customer_id
HAVING SUM(quantity * price) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT SUM(quantity * price) AS customer_total
        FROM online_retail
        WHERE customer_id IS NOT NULL
        GROUP BY customer_id
    ) AS customer_totals
)
ORDER BY total_spend DESC;