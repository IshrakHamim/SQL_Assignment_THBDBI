PROMPT =====================
PROMPT Running QUESTION 51
PROMPT =====================

SELECT name, population, area
FROM world_q51
WHERE area >= 3000000
   OR population >= 25000000;
   
PROMPT =====================
PROMPT Running QUESTION 52
PROMPT =====================

SELECT name 
FROM customer_q52 
WHERE NVL(referee_id, 0) <> 2;

PROMPT =====================
PROMPT Running QUESTION 53
PROMPT =====================

SELECT name as customers
FROM customers_q53 
WHERE id not in (select customerid from orders_q53);

PROMPT =====================
PROMPT Running QUESTION 54
PROMPT =====================

WITH teamsize AS 
(
 SELECT team_id, COUNT(employee_id) as team_size
 FROM employee_q54 
 GROUP BY team_id
) 
SELECT e.employee_id , t.team_size
FROM employee_q54 e 
JOIN teamsize t 
  ON e.team_id = t.team_id 
Order BY employee_id;


PROMPT =====================
PROMPT Running QUESTION 55
PROMPT =====================

WITH AllCalls AS (
    SELECT caller_id AS person_id, duration FROM Calls_Q55
    UNION ALL
    SELECT callee_id AS person_id, duration FROM Calls_Q55
),
PersonCountry AS (
    SELECT 
        p.id AS person_id,
        c.name AS country_name
    FROM Person_Q55 p
    JOIN Country_Q55 c 
      ON SUBSTR(p.phone_number, 1, 3) = c.country_code
)
SELECT 
    pc.country_name AS country
FROM AllCalls ac
JOIN PersonCountry pc 
  ON ac.person_id = pc.person_id
GROUP BY pc.country_name
HAVING AVG(ac.duration) > (SELECT AVG(duration) FROM AllCalls);

PROMPT =====================
PROMPT Running QUESTION 56
PROMPT =====================

SELECT player_id, device_id 
FROM activity_q56 x
WHERE event_date <= (SELECT MIN(event_date) FROM activity_q56 y WHERE x.player_id = y.player_id);

PROMPT =====================
PROMPT Running QUESTION 57
PROMPT =====================

WITH ordercount AS 
(
   SELECT customer_number, COUNT(order_number) as order_count 
   FROM orders_q57 
   GROUP BY customer_number
)
SELECT customer_number 
FROM ordercount
WHERE order_count = (SELECT MAX(order_count) FROM ordercount);


PROMPT =====================
PROMPT Running QUESTION 58
PROMPT =====================

SELECT * FROM cinema_q58;

SELECT DISTINCT c1.seat_id
FROM cinema_Q58 c1
JOIN cinema_Q58 c2 
  ON ABS(c1.seat_id - c2.seat_id) = 1
WHERE c1.free = 1 
  AND c2.free = 1
ORDER BY c1.seat_id ASC;

