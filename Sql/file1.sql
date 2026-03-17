-- =====================================================
-- ATLIQ Hardware Sales Analysis - SQL Queries
-- =====================================================

-- 1. Monthly Total Sales
-- Shows total quantity sold each month

SELECT
date,
SUM(sold_quantity) AS total_sales
FROM fact_sales_monthly
GROUP BY date
ORDER BY date;

-- 2. Top 10 Products by Sales Quantity
-- Shows products with highest sales

SELECT
product_code,
SUM(sold_quantity) AS total_quantity
FROM fact_sales_monthly
GROUP BY product_code
ORDER BY total_quantity DESC
LIMIT 10;

-- 3. Average Sales per Product
-- Calculates average quantity sold for each product

SELECT
product_code,
ROUND(AVG(sold_quantity),2) AS avg_sales
FROM fact_sales_monthly
GROUP BY product_code
ORDER BY avg_sales DESC;

-- 4. Product Count by Variant
-- Shows number of products in each variant category

SELECT
variant,
COUNT(product_code) AS product_count
FROM dim_product
GROUP BY variant
ORDER BY product_count DESC;

-- 5. Customer Count by Market
-- Shows how many customers exist in each market

SELECT
market,
COUNT(customer_code) AS customer_count
FROM dim_customer
GROUP BY market
ORDER BY customer_count DESC;
