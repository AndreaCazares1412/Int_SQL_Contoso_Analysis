# SQL- Contoso Ltd: Customer Segmentation Cohort, and Retention Analysis

## Overview

Analysis of customer behavior, retention, and lifetime value for an e-commerce company to improve customer retention and maximize revenue.

### Target Audience

This analysis is valuable for multiple business departments:

- **Marketing:** To identify customer segments for targeted campaigns, promotions, and loyalty programs.

- **Finance:** To assess customer value and forecast revenue from different segments and cohorts.

- **Customer Success & CRM Teams**: To improve retention by identifying inactive customers and proactively engaging them.

- **Executive Management:** To inform strategic decisions regarding customer acquisition, retention strategies, and growth opportunities.

## Business Questions

1. **Customer Segmentation:** Who are our most valuable customers?
2. **Cohort Analysis:** How do different customer groups generate revenue?
3. **Retention Analysis:** Which customers haven't purchased recently?

## Analysis Approach

### 1. Customer Segmentation

🖥️ Query: [1_customer_segmentation.sql](/Scripts/1_customer_segmentation.sql)

- Categorized customers based on total lifetime value (LTV)
- Assigned customers to High, Mid, and Low-value segments
- Calculated key metrics like total revenue

**📊 Visualization:**

![Customer Segmentation](/images/3_customer_segementation.png)

**📈 Key Findings:**

- High-value segment (25% of customers) drives 66% of revenue ($135.4M)
- Mid-value segment (50% of customers) generates 32% of revenue ($66.6M)
- Low-value segment (25% of customers) accounts for 2% of revenue ($4.3M)

**💡 Business Insights:**

- **High-Value (66% revenue):** Prioritize personalized marketing, loyalty programs, and premium service experiences to retain and expand this segment.
- **Mid-Value (32% revenue)**:\*\* Develop targeted upsell and cross-sell strategies to move these customers into the high-value tier. Consider offering incentives, bundle deals, or exclusive access based on behavioral triggers.
- **Low-Value (2% revenue):** Consider using automated, low-cost communication channels and evaluating whether reactivation or exclusion strategies are more beneficial.

### 2. Customer Revenue by Cohort

🖥️ Query: [2_cohort_analysis.sql](/Scripts/2_cohort_analysis.sql)

- Tracked revenue and customer count per cohorts
- Cohorts were grouped by year of first purchase
- Analyzed customer revenue at a cohort level

**📊 Visualization:**

Customer Revenue by Cohort (Adjusted for time in market) - First Purchase Date

![Cohort Analysis](/images/2_customer_revenue.png)

**📈 Key Findings:**

- Customer revenue is declining, older cohorts (2016-2018) spent ~$2,800+, while 2024 cohort spending dropped to ~$1,970.
- Revenue and customers peaked in 2022-2023, but both are now trending downward in 2024.
- High volatility in revenue and customer count, with sharp drops in 2020 and 2024, signaling retention challenges.

**💡 Business Insights:**

- Newer customers are spending less, which could mean we’re not attracting as many high-value customers as before, or that they are not staying long enough to reach higher spend levels.
- Looking at the marketing or operational changes in 2020 and 2024 might help explain the revenue drops during those years.

### 3. Customer Retention

- Identified customers at risk of churning
- Analyzed last purchase patterns
- Calculated customer-specific metrics

🖥️ Query: [3_retention_analysis.sql](/Scripts/3_retention_anlaysis.sql)

**📊 Visualization:**

![Customer Retention](/images/3_customer_churn_cohort_year.png)

**📈 Key Findings:**

- Cohort churn stabilizes at ~90% after 2-3 years, indicating a predictable long-term retention pattern.
- Retention rates are consistently low (8-10%) across all cohorts, suggesting retention issues are systemic rather than specific to certain years.
- Newer cohorts (2022-2023) show similar churn trajectories, signaling that without intervention, future cohorts will follow the same pattern.

**💡 Business Insights:**

- It could be helpful to look into why customers leave after a few years—maybe through surveys or analyzing user behavior.

- We might also want to test retention campaigns (like loyalty programs or targeted offers) earlier in the customer journey to see if that helps keep them longer.

- Since the trend is consistent, this is a good time to try new strategies and compare results against these baseline churn patterns.

## Technical Details

- **Database:** PostgreSQL
- **Analysis Tools:** PostgreSQL
- **Visualization:** ChatGPT

## Conclusion

These findings offer actionable insights for optimizing
and showing real patterns in customer behavior that businesses can act on. For example, understanding how and when customers stop buying can help marketing teams design better campaigns to keep them engaged. It also gives useful information to teams in charge of revenue and operations, who might want to improve the customer experience or adjust policies to keep customers coming back. For data analysts, this analysis is a great example of how working with historical customer data can lead to simple but valuable insights that support better business decisions.

### Acknowledgments

Special thanks to Luke Barousse for designing the
[SQL for Data Analytics – Intermediate](https://www.youtube.com/watch?v=QKIGsShyEsQ&t=8s) course!
