SELECT * FROM dbo.df_orders;

-- FIND TOP 10 HIGHEST GENERATING PRODUCTS :
SELECT TOP 10 product_id,SUM(sale_price) AS sales
FROM df_orders
GROUP BY product_id
ORDER BY sales DESC;

-- FIND TOP 5 HIGHEST SELLING PRODUCTS IN EACH REGION :
WITH CTE AS (
SELECT region,product_id,SUM(sale_price) AS sales
FROM df_orders
GROUP BY region,product_id)
SELECT * FROM (
SELECT *
, row_number() over(partition by region ORDER BY sales DESC) AS rn FROM CTE) A
WHERE rn <= 5


-- FIND MONTH OVER MONTH GROWTH COMPRESSION FOR 2022 AND 2023 SALES :
WITH CTE AS (
SELECT YEAR(order_date) AS order_year,month(order_date) AS order_month,
SUM(sale_price) AS sales
FROM df_orders
GROUP BY year(order_date),month(order_date))

SELECT order_month
, SUM(CASE WHEN order_year=2022 THEN sales ELSE 0 END) AS sales_2022
, SUM(CASE WHEN order_year=2023 THEN sales ELSE 0 END) AS sales_2023
FROM CTE
GROUP BY order_month
ORDER BY order_month;

-- FOR EACH CATEGORY WHICH MONTH HAD HIGHEST SALES
WITH CTE AS (
SELECT category,format(order_date,'yyyymm') AS order_year_month
,SUM(sale_price) AS sales
FROM df_orders
GROUP BY category,format(order_date,'yyyymm'))

SELECT * FROM (
SELECT *,
row_number() over(partition by category order by sales desc) AS rn
FROM CTE
) a
WHERE rn = 1;

-- WHICH SUB CATEGORY HAD HIGHEST GROWTH BY PROFIT IN 2023 COMPARE TO 2022 :
WITH CTE AS (
SELECT sub_category,year(order_date) AS order_year,
SUM(sale_price) AS sales
FROM df_orders
GROUP BY sub_category,year(order_date))
, CTE2 AS (
SELECT sub_category
, SUM(CASE WHEN order_year=2022 THEN sales ELSE 0 END) AS sales_2022
, SUM(CASE WHEN order_year=2023 THEN sales ELSE 0 END) AS sales_2023
FROM CTE
GROUP BY sub_category)
SELECT TOP 1 *
,(sales_2023-sales_2022)
FROM CTE2
ORDER BY (sales_2023-sales_2022) DESC;