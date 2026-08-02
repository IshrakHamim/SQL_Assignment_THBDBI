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

SELECT p.product_id, p.product_name
FROM product p
JOIN sales s
  ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING MIN(s.sale_date) >= DATE '2019-01-01'
   AND MAX(s.sale_date) <= DATE '2019-03-31';

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








