-- =====================================================
-- Atliq Hardware Sales Analysis - SQL Queries
-- =====================================================

-- -----------------------------------------------------
-- 1. Monthly Total Sales Quantity
-- Shows how many products were sold each month
-- -----------------------------------------------------
SELECT 
    date,
    SUM(sold_quantity) AS total_quantity
FROM fact_sales_monthly
GROUP BY date
ORDER BY date;

-- -----------------------------------------------------
-- 2. Top 10 Customers by Total Purchases
-- Identifies customers who purchased the most products
-- -----------------------------------------------------
SELECT 
    customer_code,
    SUM(sold_quantity) AS total_sales
FROM fact_sales_monthly
GROUP BY customer_code
ORDER BY total_sales DESC
LIMIT 10;

-- -----------------------------------------------------
-- 3. Top 10 Products by Sales Quantity
-- Finds products with the highest sales
-- -----------------------------------------------------
SELECT 
    product_code,
    SUM(sold_quantity) AS total_quantity
FROM fact_sales_monthly
GROUP BY product_code
ORDER BY total_quantity DESC
LIMIT 10;

-- -----------------------------------------------------
-- 4. Product Count by Variant
-- Shows how many products exist in each variant category
-- -----------------------------------------------------
SELECT 
    variant,
    COUNT(product_code) AS total_products
FROM dim_product
GROUP BY variant
ORDER BY total_products DESC;

-- -----------------------------------------------------
-- 5. Sales by Market (Country/Region)
-- Shows which markets generate the highest sales
-- -----------------------------------------------------
SELECT 
    c.market,
    SUM(s.sold_quantity) AS total_sales
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
GROUP BY c.market
ORDER BY total_sales DESC;
