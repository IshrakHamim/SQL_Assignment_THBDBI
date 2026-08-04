PROMPT =====================
PROMPT Running QUESTION 01
PROMPT =====================

SELECT * 
FROM city 
WHERE country_code = 'USA'
  AND population > 100000;
  
PROMPT =====================
PROMPT Running QUESTION 02
PROMPT =====================

SELECT name
FROM city
WHERE country_code = 'USA'
  AND population > 120000;

PROMPT =====================
PROMPT Running QUESTION 03
PROMPT =====================

SELECT *
FROM city ;

PROMPT =====================
PROMPT Running QUESTION 04
PROMPT =====================

SELECT *
FROM city
WHERE ID = '1661';

PROMPT =====================
PROMPT Running QUESTION 05
PROMPT =====================

SELECT * 
FROM city
WHERE country_code = 'JPN';

PROMPT =====================
PROMPT Running QUESTION 06
PROMPT =====================

SELECT name
FROM city
WHERE country_code = 'JPN';

PROMPT =====================
PROMPT Running QUESTION 07
PROMPT =====================

SELECT city, state
FROM station;

PROMPT =====================
PROMPT Running QUESTION 08
PROMPT =====================

SELECT DISTINCT city
FROM station
WHERE MOD(id, 2) = 0;

PROMPT =====================
PROMPT Running QUESTION 09
PROMPT =====================

SELECT COUNT(city) - COUNT(DISTINCT city) AS Difference
FROM station ;

PROMPT =====================
PROMPT Running QUESTION 10
PROMPT =====================

SELECT city AS Shortest_city, LENGTH(city) AS name_length
FROM station 
ORDER BY LENGTH(city) ASC, city ASC
FETCH FIRST 1 ROWS ONLY;

SELECT city AS Longest_city, LENGTH(city) AS name_length
FROM station 
ORDER BY LENGTH(city) DESC, city ASC
FETCH FIRST 1 ROWS ONLY;

PROMPT =====================
PROMPT Running QUESTION 11
PROMPT =====================

SELECT DISTINCT city
FROM station
WHERE SUBSTR(city, 1, 1) IN ('A', 'E', 'I', 'O', 'U');

PROMPT =====================
PROMPT Running QUESTION 12
PROMPT =====================

SELECT DISTINCT city
FROM station
WHERE SUBSTR(city, -1, 1) IN ('a', 'e', 'i', 'o', 'u');
   
PROMPT =====================
PROMPT Running QUESTION 13
PROMPT =====================

SELECT DISTINCT city
FROM station
WHERE SUBSTR(city, 1, 1) NOT IN ('A', 'E', 'I', 'O', 'U');

PROMPT =====================
PROMPT Running QUESTION 14
PROMPT =====================

SELECT DISTINCT city
FROM station
WHERE SUBSTR(city, -1, 1) NOT IN ('a', 'e', 'i', 'o', 'u');

PROMPT =====================
PROMPT Running QUESTION 15
PROMPT =====================

SELECT DISTINCT city
FROM station
WHERE (
      SUBSTR(city, 1, 1) IN ('A', 'E', 'I', 'O', 'U')
   OR SUBSTR(city, -1, 1) IN ('a', 'e', 'i', 'o', 'u')
      )
   AND NOT (
       SUBSTR(city, 1, 1) IN ('A', 'E', 'I', 'O', 'U')
   AND SUBSTR(city, -1, 1) IN ('a', 'e', 'i', 'o', 'u')
      );

PROMPT =====================
PROMPT Running QUESTION 16
PROMPT =====================

SELECT DISTINCT city
FROM station
WHERE (
      SUBSTR(city, 1, 1) NOT IN ('A', 'E', 'I', 'O', 'U')
   OR SUBSTR(city, -1, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
      )
   AND NOT (
       SUBSTR(city, 1, 1) NOT IN ('A', 'E', 'I', 'O', 'U')
   AND SUBSTR(city, -1, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
      );

PROMPT =====================
PROMPT Running QUESTION 17 
PROMPT =====================

SELECT DISTINCT product.product_id, product.product_name
FROM product
JOIN sales x
  ON product.product_id = x.product_id 
WHERE x.sale_date >= DATE '2019-01-01' AND x.sale_date <= DATE '2019-03-31'
 AND  DATE '2019-01-01' <= ALL (SELECT sale_date
                                FROM sales y
                                WHERE y.product_id = product.product_id)
 AND DATE '2019-03-31' >= ALL (SELECT sale_date
                                FROM sales y
                                WHERE y.product_id = product.product_id);

PROMPT =====================
PROMPT Running QUESTION 18
PROMPT =====================

SELECT DISTINCT author_id
FROM views
WHERE author_id IN (SELECT viewer_id
                       FROM views)
ORDER BY author_id;

PROMPT =====================
PROMPT Running QUESTION 19 
PROMPT =====================

SELECT 
  ROUND(
    100 * COUNT(CASE WHEN order_date = customer_pref_delivery_date THEN 1 END)
    / COUNT(delivery_id),
    2
) AS immediate_percentage
FROM delivery;

PROMPT =====================
PROMPT Running QUESTION 20 
PROMPT =====================

SELECT ad_id, 
           CASE 
                     WHEN COUNT( CASE WHEN action in ('Clicked', 'Viewed') THEN 1 END)= 0 THEN 0 
                     ELSE 
                         ROUND(
                                100* COUNT( CASE WHEN action = 'Clicked' THEN 1 END)
                                 / COUNT( CASE WHEN action IN ('Clicked', 'Viewed') THEN 1 END), 
                                  2
                                 )
             END AS ctr
FROM Ads 
GROUP BY ad_id
ORDER BY ctr DESC, ad_id ASC;

PROMPT =====================
PROMPT Running QUESTION 21 
PROMPT =====================

SELECT * 
FROM Employee;

PROMPT =====================
PROMPT Running QUESTION 22 
PROMPT =====================

SELECT c.country_name,
                      CASE 
                            WHEN AVG(weather_state) <= 15 THEN 'Cold' 
                            WHEN AVG(weather_state) >= 25 THEN 'Hot' 
                            ELSE 'Warm' 
                      END  AS Weather_type
FROM Countries c 
JOIN Weather w 
  ON c.country_id = w.country_id 
WHERE day LIKE '%-NOV-%'
GROUP BY c.country_id, c.country_name;

PROMPT =====================
PROMPT Running QUESTION 23 
PROMPT =====================

SELECT p.product_id,
       ROUND( 
             SUM(u.units * p.price)*1.0 / SUM(u.units) ,
             2
             ) AS average_price
FROM units_sold u
JOIN prices p
  ON u.product_id = p.product_id
WHERE u.purchase_date >= p.start_date
  AND u.purchase_date <= p.end_date
GROUP BY p.product_id;

PROMPT =====================
PROMPT Running QUESTION 24 
PROMPT =====================

SELECT player_id, 
       event_date AS first_event
FROM activity x
WHERE event_date <= ALL( 
                         SELECT event_date 
                         FROM activity y 
                         WHERE x.player_id = y.player_id);

PROMPT =====================
PROMPT Running QUESTION 25 
PROMPT =====================

SELECT player_id, 
       device_id
FROM activity x
WHERE event_date <= ALL( 
                         SELECT event_date 
                         FROM activity y 
                         WHERE x.player_id = y.player_id);


PROMPT =====================
PROMPT Running QUESTION 26 
PROMPT =====================

SELECT p.product_name, p.product_category, o.product_id, SUM(o.unit) AS total_units
FROM products p
JOIN orders o 
  ON p.product_id = o.product_id 
WHERE o.order_date >= DATE '2020-02-01' 
  AND o.order_date <= DATE '2020-02-29'
GROUP BY o.product_id, p.product_name, p.product_category
HAVING SUM(o.unit) >= 100;


PROMPT =====================
PROMPT Running QUESTION 27 
PROMPT =====================

SELECT * 
FROM users
WHERE mail LIKE '%@leetcode.com';


PROMPT =====================
PROMPT Running QUESTION 28
PROMPT =====================

SELECT c.customer_id, c.name
FROM customers c
JOIN orders_28 o 
  ON o.customer_id = c.customer_id 
JOIN products_28 p 
  ON p.product_id = o.product_id
WHERE ( o.order_date >= DATE '2020-06-01' AND o.order_date <= DATE '2020-07-31' )
GROUP BY c.customer_id, c.name
HAVING 
   SUM ( CASE 
             WHEN o.order_date >= DATE '2020-06-01' AND o.order_date <= DATE '2020-06-30'
             THEN o.quantity * p.price
             ELSE 0
        END) >= 100
AND 
   SUM( CASE 
             WHEN o.order_date >= DATE '2020-07-01' AND o.order_date <= DATE '2020-07-31'
             THEN o.quantity * p.price
             ELSE 0
        END) >= 100
ORDER BY c.customer_id;  

PROMPT =====================
PROMPT Running QUESTION 29
PROMPT =====================

SELECT c.title
FROM tv_program t
JOIN content c
  ON t.content_id = c.content_id 
WHERE c.content_type = 'Movies' 
  AND c.kids_content = 'Y'
  AND t.program_date >= DATE '2020-06-01' 
  AND t.program_date <= DATE '2020-06-30';


PROMPT =====================
PROMPT Running QUESTION 30
PROMPT =====================

SELECT n.id , n.year,  NVL(n.npv, 0) AS npv
FROM queries q  
LEFT JOIN npv n
  ON n.id = q.id AND n.year = q.year
ORDER BY q.id, q.year;
             
PROMPT =====================
PROMPT Running QUESTION 31
PROMPT =====================

SELECT n.id , n.year,  NVL(n.npv, 0) AS npv
FROM queries q  
LEFT JOIN npv n
  ON n.id = q.id AND n.year = q.year
ORDER BY q.id, q.year;

PROMPT =====================
PROMPT Running QUESTION 32
PROMPT =====================

SELECT u.unique_id, e.name 
FROM employees e
LEFT JOIN employee_uni u 
   ON u.id = e.id;

PROMPT =====================
PROMPT Running QUESTION 33 
PROMPT =====================


SELECT 
      u.name,
      NVL(SUM(r.distance), 0) AS travelled_distance 
FROM Users u
LEFT JOIN Rides r
  ON u.user_id = r.user_id 
GROUP BY 
     u.user_id,
     u.name
ORDER BY
     travelled_distance DESC,
     u.name ASC;


PROMPT =====================
PROMPT Running QUESTION 34 
PROMPT =====================

SELECT p.product_name, SUM(o.unit) AS total_orders
FROM orders_34 o
JOIN products_34 p
  ON p.product_id = o.product_id 
WHERE o.order_date >= DATE '2020-02-01' 
  AND o.order_date <= DATE '2020-02-29'
GROUP BY p.product_name
HAVING SUM(o.unit) >= 100;


PROMPT =====================
PROMPT Running QUESTION 35 
PROMPT =====================

--SELECT * FROM movies;
--SELECT * FROM users;
--SELECT * FROM Movie_Rating;

( 
  SELECT u.name AS results
  FROM movie_rating mr
  JOIN userS u ON mr.user_id = u.user_id
  GROUP BY u.user_id, u.name 
  ORDER BY COUNT(*) DESC, u.name ASC
  FETCH FIRST 1 ROWS ONLY 
)
UNION ALL
( 
  SELECT m.title AS results
  FROM movie_rating mr
  JOIN movies m
    ON mr.movie_id = m.movie_id
  WHERE mr.created_at >= DATE '2020-02-01'
    AND mr.created_at < DATE '2020-03-01'
  GROUP BY m.movie_id, m.title
  ORDER BY AVG(mr.rating) DESC, m.title ASC
  FETCH FIRST 1 ROWS ONLY 
);
 



