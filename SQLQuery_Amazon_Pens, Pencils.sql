
--Let us examine the data frame.

SELECT *
FROM dbo.Amazon

-- Updating the data type of the column 'number_of_reviews' to integer will allow us to order and analyze the data.

UPDATE dbo.Amazon
SET number_of_reviews = CAST(REPLACE(number_of_reviews, ',', '') AS INT)
WHERE number_of_reviews LIKE '%,%'

ALTER TABLE dbo.Amazon
ALTER COLUMN number_of_reviews INT;

-- Let's check which categories are present in the data frame.

SELECT DISTINCT amazon_category_and_sub_category
FROM dbo.Amazon

-- Separate category and subcategory into separate columns.

SELECT DISTINCT SUBSTRING(amazon_category_and_sub_category, 1, CHARINDEX(' > ' , amazon_category_and_sub_category) -1) AS Category
FROM dbo.Amazon
ORDER BY Category

-- We want to analyze the category 'Pens, Pencils, and Writing Supplies' on Amazon to determine the most popular manufacturers based on the average number of reviews.

SELECT manufacturer, AVG(number_of_reviews) AS average_number_of_reviews
FROM dbo.Amazon
WHERE amazon_category_and_sub_category LIKE 'Pens%'
GROUP BY manufacturer

