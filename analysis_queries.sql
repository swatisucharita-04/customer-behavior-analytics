SELECT * FROM customer_behavior LIMIT 20;

--Q1. Total revenue by male vs female
SELECT gender, SUM(purchase_amount) AS total_revenue
FROM customer_behavior
GROUP BY gender;

-- Q2. Customers who used discount but spent more than average
SELECT customer_id, purchase_amount
FROM customer_behavior
WHERE discount_applied = 'Yes'
  AND purchase_amount > (SELECT AVG(purchase_amount) FROM customer_behavior)
ORDER BY purchase_amount DESC;

--Q3. Top 5 products with highest average review rating
SELECT 
  item_purchased, 
  ROUND(AVG(review_rating)::numeric, 2) AS "Average Product Rating"
FROM customer_behavior
GROUP BY item_purchased
ORDER BY AVG(review_rating) DESC
LIMIT 5;

--Q4. Avg purchase amount: Standard vs Express shipping
SELECT 
  shipping_type, 
  ROUND(AVG(purchase_amount)::numeric, 2) AS avg_purchase_amount
FROM customer_behavior
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY shipping_type;

--Q5. Do subscribers spend more?
SELECT subscription_status,
       ROUND(AVG(purchase_amount), 2) AS avg_spend,
       SUM(purchase_amount) AS total_revenue
FROM customer_behavior
GROUP BY subscription_status;

--Q6. Top 5 products with highest % of discounted purchases
SELECT 
  item_purchased,
  ROUND(
    100.0 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)::numeric / COUNT(*),
    2
  ) AS discount_rate
FROM customer_behavior
GROUP BY item_purchased
ORDER BY discount_rate DESC
LIMIT 5;

--Q7. Segment customers: New / Returning / Loyal
WITH customer_type AS (
  SELECT 
    customer_id, 
    previous_purchases,
    CASE 
      WHEN previous_purchases = 0 THEN 'New'
      WHEN previous_purchases BETWEEN 1 AND 5 THEN 'Returning'
      ELSE 'Loyal'
    END AS customer_segment
  FROM customer_behavior
)
SELECT 
  customer_segment, 
  COUNT(*) AS "Number of Customers"
FROM customer_type 
GROUP BY customer_segment;

--Q8. Top 3 most purchased products in each category
WITH item_counts AS (
  SELECT 
    category,
    item_purchased,
    COUNT(customer_id) AS total_orders,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY COUNT(customer_id) DESC) AS item_rank
  FROM customer_behavior
  GROUP BY category, item_purchased
)
SELECT 
  item_rank,
  category, 
  item_purchased, 
  total_orders
FROM item_counts
WHERE item_rank <= 3
ORDER BY category, item_rank;

--Q9. Are repeat buyers likely to subscribe?
SELECT 
  subscription_status,
  COUNT(customer_id) AS repeat_buyers
FROM customer_behavior
WHERE previous_purchases > 5
GROUP BY subscription_status;

--Q10. Revenue contribution by age group
SELECT 
  age_group,
  ROUND(SUM(purchase_amount)::numeric, 2) AS total_revenue
FROM customer_behavior
GROUP BY age_group
ORDER BY total_revenue DESC;