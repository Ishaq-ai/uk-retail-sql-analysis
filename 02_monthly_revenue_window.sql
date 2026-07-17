-- Business Question: How has monthly revenue trended over time, and what 
-- is the month-over-month growth rate?
-- Technique: Window functions (SUM() OVER, LAG())

WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(invoice_date, '%Y-%m') AS revenue_month,
        SUM(quantity * price) AS monthly_total
    FROM online_retail
    GROUP BY DATE_FORMAT(invoice_date, '%Y-%m')
)
SELECT
    revenue_month,
    monthly_total,
    SUM(monthly_total) OVER (ORDER BY revenue_month) AS running_total,
    ROUND(
        (monthly_total - LAG(monthly_total) OVER (ORDER BY revenue_month)) 
        / LAG(monthly_total) OVER (ORDER BY revenue_month) * 100, 
        1
    ) AS pct_change_from_prev_month
FROM monthly_revenue
ORDER BY revenue_month;