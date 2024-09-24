SELECT *
FROM supermarket_sales;

-- 1. Data Cleaning --
------------------------------------------
-- Change Date column data type from string to date
SELECT `Date`, 
STR_TO_DATE(`Date`, '%m/%d/%Y')
FROM supermarket_sales;

UPDATE supermarket_sales
SET `Date` = STR_TO_DATE(`Date`, '%m/%d/%Y');

ALTER TABLE supermarket_sales
MODIFY COLUMN `Date` DATE;

-------------------------------------------

-- 2. Data Exploration --
-- Looking at data wanted to see --
SELECT Branch, City, Gender, Product_line, Total
FROM supermarket_sales
ORDER BY 5 DESC;

-------------------------------------------------

-- Branch with the most buy --
SELECT Branch, SUM(Total) AS total_sales
FROM supermarket_sales
GROUP BY Branch
ORDER BY total_sales DESC;

-- Payment method the most used --
SELECT Payment, COUNT(Payment) AS total_payment
FROM supermarket_sales
GROUP BY Payment
ORDER BY 2 DESC;

-- Which City is the most busy --
SELECT City, COUNT(Invoice_ID) AS customer_count
FROM supermarket_sales
GROUP BY City
ORDER BY 2 DESC;

-- Which Product type has the most sale by female --
SELECT Product_line, Gender, ROUND(SUM(Total)) AS total_sales
FROM supermarket_sales
WHERE Gender = 'Female'
GROUP BY Gender, Product_line
ORDER BY 3 DESC; 

-- Which Product type has the most sale by male --
SELECT Product_line, Gender, ROUND(SUM(Total)) AS total_sales
FROM supermarket_sales
WHERE Gender = 'male'
GROUP BY Gender, Product_line
ORDER BY 3 DESC; 

-- Which product type is popular by each city --
SELECT City, Product_line, ROUND(SUM(Total)) AS total_sales
FROM supermarket_sales
GROUP BY City, Product_line
ORDER BY 1, 3 DESC;

-- Which branch has better sales for a particular product type --
SELECT Branch, Product_line, ROUND(SUM(Total)) AS total_sales
FROM supermarket_sales
GROUP BY Branch, Product_line
ORDER BY 2, 3 DESC;

-- Which branch has the highest average rating --
SELECT Branch, ROUND(AVG(Rating), 2) AS average_rating
FROM supermarket_sales
GROUP BY Branch
ORDER BY 2 DESC;

-- Is better store rating will make better sales? --
SELECT Branch, ROUND(AVG(Rating), 2) AS average_rating , ROUND(SUM(Total)) AS total_sales
FROM supermarket_sales
GROUP BY Branch
ORDER BY 3 DESC, 2 DESC;


