# UK Retail SQL Analysis

SQL analysis of ~1.07 million transactions from a UK-based online retailer (2009-2011) using MySQL. Companion project to my Tableau dashboard analyzing the same dataset.

## Dataset
UCI Machine Learning Repository — "Online Retail II" dataset.

## Data Cleaning
- Combined two years of raw CSV data into a single MySQL table
- Converted date strings (day/month/year format) into proper DATETIME values
- Identified and fixed a data quality issue: 243,007 transactions had customer_id loaded as 0 (from blank CSV values) rather than true NULL — corrected via UPDATE

## Queries

| File | Description |
|---|---|
| [`01_top_customers_cte.sql`](01_top_customers_cte.sql) | Uses a CTE to rank customers by total spend and surface the top 10 by revenue |
| [`02_monthly_revenue_window.sql`](02_monthly_revenue_window.sql) | Window functions to calculate monthly revenue and month-over-month growth |
| [`03_above_average_customers_subquery.sql`](03_above_average_customers_subquery.sql) | Correlated subquery to find customers spending above the overall average order value |
| [`04_repeat_customers_cte_window.sql`](04_repeat_customers_cte_window.sql) | Combines a CTE with window functions to identify repeat customers and their purchase intervals |

## Key Findings
- (Fill in your actual results here)

## Tools
MySQL, Tableau (companion dashboard)

## Related
- Tableau dashboard: (add link here)
