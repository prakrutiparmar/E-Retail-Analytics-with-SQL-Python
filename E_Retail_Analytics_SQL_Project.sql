---data1---
CREATE TABLE data1 (
    date DATE,
    revenue NUMERIC,
    price NUMERIC,
    discount_percent NUMERIC,
    units_sold INT,
    marketing_spend NUMERIC,
    season TEXT
);

---data--
CREATE TABLE data (
    product_id INT,
    date DATE,
    sales_price NUMERIC,
    cost_price NUMERIC,
    units_sold INT,
    inventory_level INT,
    discount_applied NUMERIC,
    competitor_price NUMERIC,
    promotion_type TEXT,
    return_rate NUMERIC,
    survey_wtp NUMERIC,
    bundle_partner_id INT,
    group_booking TEXT
);
ALTER TABLE data ALTER COLUMN date TYPE TEXT;


---electronics---
CREATE TABLE electronics (
    pricing_id INT PRIMARY KEY,
    cheap1 INT,
    cheap2 INT,
    expensive1 INT,
    expensive2 INT
);

---clothing_survey---
CREATE TABLE clothing_survey (
    pricing_id INT PRIMARY KEY,
    cheap1 INT,
    cheap2 INT,
    expensive1 INT,
    expensive2 INT
);

---profiles---
CREATE TABLE profiles (
    expected_utility NUMERIC,
    price_499 INT,
    price_999 INT,
    price_1499 INT,
    delivery_standard INT,
    no_return INT,
    return_7day INT,
    local_brand INT,
    national_brand INT
);

---Beginner (SELECT, WHERE, GROUP BY)
---1) Find total revenue by season----
SELECT season, SUM(revenue) AS total_revenue
FROM data1
GROUP BY season
ORDER BY total_revenue DESC;

---2) Get average discount and units sold ---
SELECT AVG(discount_applied) AS avg_discount, AVG(units_sold) AS avg_units
FROM data;

---3) List top 10 products by sales
SELECT product_id, SUM(units_sold * sales_price) AS total_sales
FROM data
GROUP BY product_id
ORDER BY total_sales DESC
LIMIT 10;


---Intermediate (JOINS, Aggregations)---
---4)Compare product price with competitor price--
SELECT product_id,
       AVG(sales_price) AS avg_sales_price,
       AVG(competitor_price) AS avg_competitor_price
FROM data
GROUP BY product_id
ORDER BY AVG(sales_price) - AVG(competitor_price) DESC;

---5) Which bundles sell the most?---
---Join sales with bundles---
SELECT d.product_id, d.bundle_partner_id,
       SUM(d.units_sold) AS total_units
FROM data d
WHERE d.bundle_partner_id IS NOT NULL
GROUP BY d.product_id, d.bundle_partner_id;

---Advanced (CTEs, Window Functions)---
---6) Monthly revenue trend---
---How does revenue change month to month?---
WITH monthly_sales AS (
    SELECT DATE_TRUNC('month', date::date) AS month,
           SUM(units_sold * sales_price) AS total_sales
    FROM data
    GROUP BY DATE_TRUNC('month', date::date)
)
SELECT month, total_sales,
       LAG(total_sales) OVER (ORDER BY month) AS prev_month_sales,
       (total_sales - LAG(total_sales) OVER (ORDER BY month)) AS sales_change
FROM monthly_sales;

---7) Top 3 products by sales per season---
---What are the top 3 selling products in each season?---
SELECT season, product_id, total_sales
FROM (
    SELECT d1.season, d.product_id,
           SUM(d.units_sold * d.sales_price) AS total_sales,
           RANK() OVER (
               PARTITION BY d1.season 
               ORDER BY SUM(d.units_sold * d.sales_price) DESC
           ) AS rank
    FROM data d
    JOIN data1 d1 
        ON d.date::date = d1.date  
    GROUP BY d1.season, d.product_id
) ranked
WHERE rank <= 3;

---8) Customer preference clustering---
---What customer segments exist based on willingness to pay?----
SELECT
    CASE
        WHEN price_499 > price_999 AND price_499 > price_1499 THEN 'Budget Shoppers'
        WHEN price_999 > price_499 AND price_999 > price_1499 THEN 'Mid-range Buyers'
        ELSE 'Premium Buyers'
    END AS customer_segment,
    COUNT(*) AS total_customers,
    AVG(expected_utility) AS avg_utility
FROM profiles
GROUP BY customer_segment;


---Advanced Joins + Window Functions---
---9) Correlation between marketing spend and revenue---
---Which season gives the best ROI on marketing?---
SELECT season,
       SUM(marketing_spend) AS total_marketing,
       SUM(revenue) AS total_revenue,
       ROUND(SUM(revenue)::NUMERIC / NULLIF(SUM(marketing_spend),0),2) AS roi
FROM data1
GROUP BY season
ORDER BY roi DESC;

---10) Retention/Return analysis---
---Which promotions lead to fewer returns?---
SELECT promotion_type,
       AVG(return_rate) AS avg_returns,
       AVG(units_sold) AS avg_units
FROM data
GROUP BY promotion_type
ORDER BY avg_returns;






