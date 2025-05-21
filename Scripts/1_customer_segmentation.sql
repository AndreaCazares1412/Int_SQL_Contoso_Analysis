-- Customer Segmentation: Who ARE our most valuable customers ?

 WITH customer_lifetime_value AS (
	SELECT
		customerkey,
		cleaned_name,
		ROUND(SUM(total_net_revenue)) AS total_ltv
	FROM
		cohort_analysis
	GROUP BY
		customerkey,
		cleaned_name
), 
customer_segments AS (
	SELECT
		PERCENTILE_CONT(.75) WITHIN GROUP (
		ORDER BY
			(total_ltv)
		) AS p_75,
		PERCENTILE_CONT(.25) WITHIN GROUP (
		ORDER BY
			(total_ltv)
		) AS p_25
	FROM
		customer_lifetime_value
), 
segment_values AS (
	SELECT
		cltv.*,
		CASE
			-- shortcircuit evaluation
  WHEN cltv.total_ltv < cs.p_25 THEN '1 - Low Value'
			WHEN cltv.total_ltv <= cs.p_75 THEN '2 - Mid Value'
			ELSE '3 - High Value'
		END AS customer_segment
	FROM
		customer_lifetime_value AS cltv,
		customer_segments AS cs
)

SELECT 
	customer_segment,
	-- total economic value generated from EACH segment
	SUM(total_ltv) total_ltv,
	COUNT(*) AS customer_count,
	-- On average, how much value does each customer in this segment contribute to the business?
	SUM(total_ltv) / COUNT(*) AS avg_ltv
FROM
	segment_values
GROUP BY
	customer_segment
ORDER BY
	customer_segment DESC
