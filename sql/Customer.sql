USE customer;

SELECT * 
FROM ecommerce_customer_data_large_cleaned;

-- 1. Total Revenue
SELECT SUM(total_purchase_amount) AS total_revenue
FROM ecommerce_customer_data_large_cleaned;

-- 2. Revenue by Product Category
SELECT product_category,
    SUM(total_purchase_amount) AS revenue
FROM ecommerce_customer_data_large_cleaned
GROUP BY product_category
ORDER BY revenue DESC;

-- 3. Revenue by Payment Method
SELECT payment_method,
    SUM(total_purchase_amount) AS revenue
FROM ecommerce_customer_data_large_cleaned
GROUP BY payment_method
ORDER BY revenue DESC;

-- 4. Total Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM ecommerce_customer_data_large_cleaned;

-- 5. Top 5 Customers by Spending
SELECT customer_id,
       customer_name,
       SUM(total_purchase_amount) AS total_spent
FROM ecommerce_customer_data_large_cleaned
GROUP BY customer_id, customer_name
ORDER BY total_spent DESC
LIMIT 5;

-- 6. Average Order Value (AOV)
SELECT AVG(total_purchase_amount) AS avg_order_value
FROM ecommerce_customer_data_large_cleaned;


-- 7. Monthly Revenue Trend
SELECT year,
       month,
       SUM(total_purchase_amount) AS monthly_revenue
FROM ecommerce_customer_data_large_cleaned
GROUP BY year, month 
ORDER BY year, month;

-- 8. Returns Analysis
SELECT product_category,
    AVG(returns) AS return_rate
FROM ecommerce_customer_data_large_cleaned
GROUP BY product_category
ORDER BY return_rate DESC;

-- 9. Churn Analysis (VERY IMPORTANT)
-- Churn vs Non-Churn Count
SELECT churn,
    COUNT(DISTINCT customer_id) AS customers
FROM ecommerce_customer_data_large_cleaned
GROUP BY churn;

-- Spending Behavior (Churn vs Non-Churn)
SELECT churn,
    AVG(total_purchase_amount) AS avg_spending
FROM ecommerce_customer_data_large_cleaned
GROUP BY churn;

-- 10. Customer Lifetime Value (CLV)
SELECT customer_id,
    customer_name,
    SUM(total_purchase_amount) AS lifetime_value
FROM ecommerce_customer_data_large_cleaned
GROUP BY customer_id, customer_name
ORDER BY lifetime_value DESC
LIMIT 10;

-- 11. Gender-Based Spending
SELECT gender,
    SUM(total_purchase_amount) AS total_spent,
    AVG(total_purchase_amount) AS avg_spent
FROM ecommerce_customer_data_large_cleaned
GROUP BY gender;

-- 12. Age Group Analysis
SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+'
    END AS age_group,
    SUM(total_purchase_amount) AS total_spent
FROM ecommerce_customer_data_large_cleaned
GROUP BY age_group
ORDER BY total_spent DESC;

-- 13. Most Popular Product Category
SELECT product_category,
    COUNT(*) AS total_orders
FROM ecommerce_customer_data_large_cleaned
GROUP BY product_category
ORDER BY total_orders DESC;

-- 14. Best Sales Day of the Week
SELECT day,
    SUM(total_purchase_amount) AS revenue
FROM ecommerce_customer_data_large_cleaned
GROUP BY day 
ORDER BY revenue DESC;

-- 15. Advanced Insight (Churn + Returns)
SELECT churn,
    AVG(returns) AS avg_returns,
    AVG(total_purchase_amount) AS avg_spending
FROM ecommerce_customer_data_large_cleaned
GROUP BY churn;


