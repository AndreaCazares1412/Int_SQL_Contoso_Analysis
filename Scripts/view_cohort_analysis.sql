
CREATE OR REPLACE VIEW cohort_analysis AS 
WITH customer_revenue AS (
	SELECT
		s.customerkey,
		s.orderdate,
		COUNT(*) AS order_count,
		SUM(s.quantity * s.netprice * s.exchangerate) AS total_net_revenue,
		MAX(c.givenname) AS givenname,
		MAX(c.surname) AS surname,
		MAX(c.age) AS age,
		MAX(c.countryfull) AS countryfull
	FROM
		sales s
	INNER JOIN customer c ON
		s.customerkey = c.customerkey
	GROUP BY
		s.customerkey,
		s.orderdate
)

SELECT 
	customerkey,
	orderdate,
	order_count,
	total_net_revenue,
	countryfull,
	age,
	CONCAT(TRIM(givenname), ' ', TRIM(surname)) AS cleaned_name,
	MIN(cr.orderdate) OVER(PARTITION BY cr.customerkey) AS first_purchase_date,
	EXTRACT(YEAR FROM MIN(cr.orderdate) OVER(PARTITION BY cr.customerkey)) AS cohort_year
FROM
	customer_revenue cr
	