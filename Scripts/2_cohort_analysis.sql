--How do customer groups generate revenue?

SELECT 
	ca.cohort_year,
	ROUND(SUM(ca.total_net_revenue)) AS total_revenue,
	COUNT(DISTINCT ca.customerkey) AS total_customers,
	-- DISTINCT TO NOT count repeated customers
	ROUND(SUM(ca.total_net_revenue) / COUNT(DISTINCT ca.customerkey)) AS avg_revenue_per_customer
FROM
	cohort_analysis ca
WHERE
-- the FIRST purchase IS the highest, AFTER that remains the same
	orderdate = first_purchase_date
GROUP BY
	ca.cohort_year
ORDER BY
	ca.cohort_year
