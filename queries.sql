-- COMBINE menu_items AND order_details IN ONE TABLE

SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT *
FROM order_details od LEFT JOIN menu_items mi 
    ON od.item_id = mi.menu_item_id;

-- LEAST ORDERED ITEMS & THEIR CATEGORY 
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi 
    ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases;

-- MOST ORDERED ITEMS 
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi 
    ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;

-- WHICH ORDERS SPENT THE MOST MONEY
SELECT order_id, SUM(price) AS price_orders
FROM order_details od LEFT JOIN menu_items mi 
    ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY price_orders DESC
LIMIT 5;

-- VIEW THE DETAILS OF THE BIGGEST ORDER 
SELECT category, COUNT (item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;

-- VIEW DETAILS OF THE TOP 5 BIGGEST ORDERS 
SELECT order_id, category, COUNT (item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675) 
GROUP BY order_id, category;

-- VIEW ORDER DETAILS TABLE

SELECT * FROM order_details;

-- DATE RANGE OF THE TABLE

SELECT MIN(order_date), MAX(order_date)
FROM order_details;

-- HOW MANY ORDERS WITHIN THAT RANGE

SELECT COUNT(DISTINCT order_id) FROM order_details;

-- HOW MANY ITEMS WERE ORDERED 

SELECT COUNT(*) FROM order_details;

-- WHICH ORDER HAD THE MOST NUMBER OF ITEMS 

SELECT order_id, COUNT(item_id) AS num_items 
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;

-- HOW MANY ORDERS HAD MORE THAN 12 ITEMS?
SELECT COUNT(*) FROM (SELECT order_id, COUNT(item_id) AS num_items 
FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_orders;

-- COMBINE menu_items AND order_details IN ONE TABLE

SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT *
FROM order_details od LEFT JOIN menu_items mi 
    ON od.item_id = mi.menu_item_id;

-- LEAST ORDERED ITEMS & THEIR CATEGORY 
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi 
    ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases;

-- MOST ORDERED ITEMS 
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi 
    ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;

-- WHICH ORDERS SPENT THE MOST MONEY
SELECT order_id, SUM(price) AS price_orders
FROM order_details od LEFT JOIN menu_items mi 
    ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY price_orders DESC
LIMIT 5;

-- VIEW THE DETAILS OF THE BIGGEST ORDER 
SELECT category, COUNT (item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;

-- VIEW DETAILS OF THE TOP 5 BIGGEST ORDERS 
SELECT order_id, category, COUNT (item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
    ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675) 
GROUP BY order_id, category;