drop table if exists zepto;

create table zepto(
sku_id serial primary key,
category varchar(150),
name varchar(150) not null,
mrp numeric (8,2),
discount_percent numeric(5,2),
available_quantity integer,
discount_selling_price numeric(8,2),
weight_in_gms integer,
out_of_stock boolean,
quantity integer
);

--DATA EXPLORATION--

--COUNT OF ROWS--
SELECT COUNT(*) from zepto;

--SAMPLE DATA--
SELECT * FROM zepto
LIMIT 10;

--NULL VALUES--

SELECT * FROM zepto
WHERE
name is null 
OR
category is null 
OR
mrp is null 
OR
discount_percent is null 
OR
available_quantity is null 
OR
discount_selling_price is null 
OR
weight_in_gms is null 
OR
out_of_stock is null 
OR
quantity is null;

--DIFFERENT PRODUCT CATEGORIES--
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--PRODUCTS IN STOCK VS OUT OF STOCK--
SELECT out_of_stock, COUNT(sku_id)
FROM zepto
GROUP BY out_of_stock;

--PRODUCT NAMES PRESENT MULTIPLE TIMES--
SELECT name, count(sku_id) as "NUMBER OF SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id)>1
ORDER BY COUNT(sku_id) DESC;

--DATA CLEANING--
--PRODUCT WITH PRICE ZERO--
SELECT * FROM zepto
WHERE mrp=0 OR discount_selling_price=0;
DELETE FROM zepto
WHERE mrp=0;

--CONVERTING PAISE TO RUPEES--
UPDATE zepto
SET mrp = mrp/100.0,
discount_selling_price = discount_selling_price/100.0;
SELECT mrp,discount_selling_price FROM zepto

--BUSNESS QUERY INSIGHTS--
--Q1 Find the top 10 best value products based on the discount percentage. 
SELECT DISTINCT name, mrp, discount_percent
FROM zepto
ORDER BY discount_percent DESC
LIMIT 10;

--Q2 What are the products with high MRP but Out of stock.
SELECT DISTINCT name, mrp
FROM zepto
WHERE out_of_stock = TRUE AND mrp>300
ORDER BY mrp DESC;

--Q3 Calcualte Estimated Revenue for each category.
SELECT category,
SUM(discount_selling_price * available_quantity) AS Total_revenue
FROM zepto
GROUP BY category
ORDER BY Total_revenue;

--Q4 Find all products where MRP is gretaer than Rs500 and discount is less than 10%
SELECT DISTINCT name, mrp, discount_percent
FROM zepto
WHERE mrp>500 AND discount_percent<10
ORDER BY mrp DESC, discount_percent DESC;

--Q5 Identify the top 5 categories offering the highest average discount percentage.
SELECT category,
ROUND(AVG(discount_percent),2)AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

--Q6 Find the price per gram for products above 100g and  sort by best value.
SELECT DISTINCT name, weight_in_gms, discount_selling_price,
ROUND(discount_selling_price/weight_in_gms,2) AS price_per_gram
FROM zepto
WHERE weight_in_gms >=100
ORDER BY price_per_gram;

--Q7 Group the products into categories like low, medium and bulk.
SELECT DISTINCT name, weight_in_gms,
CASE WHEN weight_in_gms <1000 THEN 'Low'
     WHEN weight_in_gms <5000 THEN 'Medium'
	 ELSE 'Bulk'
	 END AS weight_category
FROM zepto;

--Q8 What is the Total Inventory Weight Per Category.
SELECT category,
SUM (weight_in_gms * available_quantity) AS Total_weight
FROM zepto
GROUP BY category
ORDER BY Total_weight;
