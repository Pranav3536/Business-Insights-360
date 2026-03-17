-- 6. Sales Quantity by Product Name
-- Shows total sales quantity for each product

SELECT
p.product,
SUM(s.sold_quantity) AS total_quantity
FROM fact_sales_monthly s
JOIN dim_product p
ON s.product_code = p.product_code
GROUP BY p.product
ORDER BY total_quantity DESC;

-- 7. Top 10 Customers by Product Purchases
-- Shows customers who bought the most products

SELECT
c.customer,
SUM(s.sold_quantity) AS total_quantity
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
GROUP BY c.customer
ORDER BY total_quantity DESC
LIMIT 10;

-- 8. Monthly Gross Sales for Croma India

SELECT 
    s.date,
    SUM(s.sold_quantity * g.gross_price) AS total_sales
FROM fact_sales_monthly s
JOIN fact_gross_price g
ON s.product_code = g.product_code
WHERE s.customer_code = "90002002"
GROUP BY s.date
ORDER BY s.date;

-- 9. Products Sold Across Multiple Months
-- Shows how many months each product was sold

SELECT
product_code,
COUNT(DISTINCT date) AS months_sold
FROM fact_sales_monthly
GROUP BY product_code
ORDER BY months_sold DESC;

-- 10. Top 10 Products with Highest Single Month Sales
-- Shows products with highest sales in a single month

SELECT
product_code,
MAX(sold_quantity) AS highest_month_sales
FROM fact_sales_monthly
GROUP BY product_code
ORDER BY highest_month_sales DESC
LIMIT 10;
