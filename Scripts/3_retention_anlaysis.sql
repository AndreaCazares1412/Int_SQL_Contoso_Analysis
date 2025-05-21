-- Active Customer: Customer who made a purchase within the last 6 months
-- Churned Customer: Customer who hasn't made a purchase in over 6 months

WITH customer_last_purchase AS (
	SELECT
		customerkey,
		cleaned_name,
		orderdate,
		ROW_NUMBER() OVER (
			PARTITION BY customerkey
		ORDER BY
			orderdate DESC
		) AS rn,
		first_purchase_date,
		cohort_year 
	FROM
		cohort_analysis ca
),
churned_customers AS (
	SELECT
		customerkey,
		cleaned_name,
		orderdate AS last_purchase_date,
		CASE
			-- orderdate < '2023-10-20'
		WHEN orderdate < (
				SELECT
					MAX(orderdate)
				FROM
					sales
			) - INTERVAL '6 months' THEN 'Churned'
			ELSE 'Active'
		END AS customer_status,
		cohort_year
	FROM
		customer_last_purchase
	WHERE
		rn = 1
		-- Customers whose been part of the database/system for more than 6 months before the end date of the database to be considered 'churned' or 'active'
		AND first_purchase_date < (
			SELECT
				MAX(orderdate)
			FROM
				sales
		) - INTERVAL '6 months'
)

SELECT 
	cohort_year,
	customer_status,
	COUNT(*) AS customer_count,
	SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_year) AS total_customers,
 	ROUND(COUNT(customerkey)/SUM(COUNT(customerkey)) OVER(PARTITION BY cohort_year),2) AS status_percentage
FROM churned_customers 
GROUP BY customer_status, cohort_year


