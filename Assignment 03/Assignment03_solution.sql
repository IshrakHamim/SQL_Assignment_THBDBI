PROMPT =====================
PROMPT Running QUESTION 101
PROMPT =====================
SELECT username, activity, startdate, enddate
FROM (
    SELECT username, activity, startdate, enddate,
           ROW_NUMBER() OVER (PARTITION BY username ORDER BY enddate DESC) AS rnk,
           COUNT(*) OVER (PARTITION BY username) AS total_count
    FROM useractivity_101
)
WHERE (total_count > 1 AND rnk = 2) OR total_count = 1;

PROMPT =====================
PROMPT Running QUESTION 102
PROMPT =====================
SELECT username, activity, startdate, enddate
FROM (
    SELECT username, activity, startdate, enddate,
           ROW_NUMBER() OVER (PARTITION BY username ORDER BY enddate DESC) AS rnk,
           COUNT(*) OVER (PARTITION BY username) AS total_count
    FROM useractivity_101
)
WHERE (total_count > 1 AND rnk = 2) OR total_count = 1;

PROMPT =====================
PROMPT Running QUESTION 103
PROMPT =====================
SELECT name
FROM students_103
WHERE marks > 75
ORDER BY SUBSTR(name, -3), id ASC;

PROMPT =====================
PROMPT Running QUESTION 104
PROMPT =====================
SELECT name
FROM employee_104
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC;

PROMPT =====================
PROMPT Running QUESTION 105
PROMPT =====================
SELECT 
    CASE 
        WHEN a + b <= c OR a + c <= b OR b + c <= a THEN 'Not A Triangle'
        WHEN a = b AND b = c THEN 'Equilateral'
        WHEN a = b OR b = c OR a = c THEN 'Isosceles'
        ELSE 'Scalene'
    END AS triangle_type
FROM triangles_105;

PROMPT =====================
PROMPT Running QUESTION 106
PROMPT =====================
SELECT CEIL(AVG(salary) - AVG(TO_NUMBER(REPLACE(TO_CHAR(salary), '0', '')))) AS error_amount
FROM employees_106;

PROMPT =====================
PROMPT Running QUESTION 107
PROMPT =====================
SELECT (months * salary) || ' ' || COUNT(*)
FROM employee_104
WHERE (months * salary) = (SELECT MAX(months * salary) FROM employee_104)
GROUP BY (months * salary);

PROMPT =====================
PROMPT Running QUESTION 108
PROMPT =====================
-- Query 1
SELECT name || '(' || SUBSTR(occupation, 1, 1) || ')'
FROM occupations_108
ORDER BY name ASC;

-- Query 2
SELECT 'There are a total of ' || COUNT(*) || ' ' || LOWER(occupation) || 's.'
FROM occupations_108
GROUP BY occupation
ORDER BY COUNT(*) ASC, occupation ASC;

PROMPT =====================
PROMPT Running QUESTION 109
PROMPT =====================
SELECT 
    MAX(CASE WHEN occupation = 'Doctor' THEN name END) AS Doctor,
    MAX(CASE WHEN occupation = 'Professor' THEN name END) AS Professor,
    MAX(CASE WHEN occupation = 'Singer' THEN name END) AS Singer,
    MAX(CASE WHEN occupation = 'Actor' THEN name END) AS Actor
FROM (
    SELECT name, occupation,
           ROW_NUMBER() OVER (PARTITION BY occupation ORDER BY name) AS rnk
    FROM occupations_108
)
GROUP BY rnk
ORDER BY rnk;

PROMPT =====================
PROMPT Running QUESTION 110
PROMPT =====================
SELECT n,
    CASE 
        WHEN p IS NULL THEN 'Root'
        WHEN n IN (SELECT DISTINCT p FROM bst_110 WHERE p IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
    END AS node_type
FROM bst_110
ORDER BY n ASC;

PROMPT =====================
PROMPT Running QUESTION 111
PROMPT =====================
SELECT c.company_code, c.founder,
       COUNT(DISTINCT e.lead_manager_code),
       COUNT(DISTINCT e.senior_manager_code),
       COUNT(DISTINCT e.manager_code),
       COUNT(DISTINCT e.employee_code)
FROM company_111 c
JOIN employee_111 e ON c.company_code = e.company_code
GROUP BY c.company_code, c.founder
ORDER BY c.company_code ASC;

PROMPT =====================
PROMPT Running QUESTION 112
PROMPT =====================
WITH numbers AS (
    SELECT LEVEL AS n FROM dual CONNECT BY LEVEL <= 1000
)
SELECT LISTAGG(n1.n, '&') WITHIN GROUP (ORDER BY n1.n) AS prime_numbers
FROM numbers n1
WHERE n1.n > 1 
  AND NOT EXISTS (
      SELECT 1 FROM numbers n2 
      WHERE n2.n > 1 AND n2.n < n1.n AND MOD(n1.n, n2.n) = 0
  );

PROMPT =====================
PROMPT Running QUESTION 113
PROMPT =====================
SELECT RPAD('*', LEVEL * 2 - 1, ' *') AS pattern
FROM dual
CONNECT BY LEVEL <= 20;

PROMPT =====================
PROMPT Running QUESTION 114
PROMPT =====================
SELECT RPAD('*', (21 - LEVEL) * 2 - 1, ' *') AS pattern
FROM dual
CONNECT BY LEVEL <= 20;

PROMPT =====================
PROMPT Running QUESTION 115
PROMPT =====================
SELECT name
FROM students_103
WHERE marks > 75
ORDER BY SUBSTR(name, -3), id ASC;

PROMPT =====================
PROMPT Running QUESTION 116
PROMPT =====================
SELECT x, y
FROM functions_116
WHERE x = y
GROUP BY x, y
HAVING COUNT(*) > 1
UNION
SELECT f1.x, f1.y
FROM functions_116 f1
JOIN functions_116 f2 ON f1.x = f2.y AND f1.y = f2.x
WHERE f1.x < f1.y
ORDER BY x ASC;

PROMPT =====================
PROMPT Running QUESTION 117
PROMPT =====================
SELECT name
FROM employee_104
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC;

PROMPT =====================
PROMPT Running QUESTION 118
PROMPT =====================
SELECT 
    CASE 
        WHEN a + b <= c OR a + c <= b OR b + c <= a THEN 'Not A Triangle'
        WHEN a = b AND b = c THEN 'Equilateral'
        WHEN a = b OR b = c OR a = c THEN 'Isosceles'
        ELSE 'Scalene'
    END AS triangle_type
FROM triangles_105;

PROMPT =====================
PROMPT Running QUESTION 119
PROMPT =====================
WITH yearly_spend AS (
    SELECT 
        EXTRACT(YEAR FROM transaction_date) AS yr,
        product_id,
        spend AS curr_year_spend,
        LAG(spend) OVER (PARTITION BY product_id ORDER BY EXTRACT(YEAR FROM transaction_date)) AS prev_year_spend
    FROM user_transactions_119
)
SELECT 
    yr AS year,
    product_id,
    curr_year_spend,
    prev_year_spend,
    ROUND(100.0 * (curr_year_spend - prev_year_spend) / prev_year_spend, 2) AS yoy_rate
FROM yearly_spend
ORDER BY product_id, year;

PROMPT =====================
PROMPT Running QUESTION 120
PROMPT =====================
WITH summary AS (
    SELECT 
        item_type,
        SUM(square_footage) AS total_sqft,
        COUNT(*) AS item_cnt
    FROM inventory_120
    GROUP BY item_type
),
prime_calc AS (
    SELECT 
        item_type,
        total_sqft,
        item_cnt,
        FLOOR(500000 / total_sqft) AS prime_batches,
        FLOOR(500000 / total_sqft) * item_cnt AS prime_item_count,
        500000 - (FLOOR(500000 / total_sqft) * total_sqft) AS remaining_sqft
    FROM summary
    WHERE item_type = 'prime_eligible'
)
SELECT 
    'prime_eligible' AS item_type,
    prime_item_count AS item_count
FROM prime_calc
UNION ALL
SELECT 
    'not_prime' AS item_type,
    FLOOR(p.remaining_sqft / s.total_sqft) * s.item_cnt AS item_count
FROM summary s
CROSS JOIN prime_calc p
WHERE s.item_type = 'not_prime';

PROMPT =====================
PROMPT Running QUESTION 121
PROMPT =====================
SELECT 
    7 AS month,
    COUNT(DISTINCT user_id) AS monthly_active_users
FROM user_actions_121
WHERE EXTRACT(MONTH FROM event_date) = 7 
  AND EXTRACT(YEAR FROM event_date) = 2022
  AND user_id IN (
      SELECT user_id 
      FROM user_actions_121 
      WHERE EXTRACT(MONTH FROM event_date) = 6 
        AND EXTRACT(YEAR FROM event_date) = 2022
  );

PROMPT =====================
PROMPT Running QUESTION 122
PROMPT =====================
WITH expanded_searches AS (
    SELECT searches
    FROM search_frequency_122
    CONNECT BY LEVEL <= num_users
       AND PRIOR searches = searches
       AND PRIOR SYS_GUID() IS NOT NULL
)
SELECT ROUND(MEDIAN(searches), 1) AS median
FROM expanded_searches;

PROMPT =====================
PROMPT Running QUESTION 123
PROMPT =====================
SELECT 
    COALESCE(a.user_id, d.user_id) AS user_id,
    CASE 
        WHEN d.paid IS NULL THEN 'CHURN'
        WHEN d.paid IS NOT NULL AND a.status = 'CHURN' THEN 'RESURRECT'
        WHEN d.paid IS NOT NULL AND a.status IS NULL THEN 'NEW'
        ELSE 'EXISTING'
    END AS new_status
FROM advertiser_123 a
FULL OUTER JOIN daily_pay_123 d ON a.user_id = d.user_id
ORDER BY user_id;

PROMPT =====================
PROMPT Running QUESTION 124
PROMPT =====================
WITH session_pairs AS (
    SELECT 
        server_id,
        status_time AS start_time,
        LEAD(status_time) OVER (PARTITION BY server_id ORDER BY status_time) AS stop_time,
        session_status
    FROM server_utilization_124
)
SELECT 
    FLOOR(SUM(CAST(stop_time AS DATE) - CAST(start_time AS DATE))) AS total_uptime_days
FROM session_pairs
WHERE session_status = 'start';

PROMPT =====================
PROMPT Running QUESTION 125
PROMPT =====================
WITH ordered_transactions AS (
    SELECT 
        merchant_id,
        credit_card_id,
        amount,
        transaction_timestamp,
        LAG(transaction_timestamp) OVER (
            PARTITION BY merchant_id, credit_card_id, amount 
            ORDER BY transaction_timestamp
        ) AS prev_timestamp
    FROM transactions_125
)
SELECT COUNT(*) AS payment_count
FROM ordered_transactions
WHERE (transaction_timestamp - prev_timestamp) * 24 * 60 <= 10;

PROMPT =====================
PROMPT Running QUESTION 126
PROMPT =====================
SELECT 
    ROUND(100.0 * COUNT(CASE 
        WHEN o.status != 'completed successfully' 
          OR t.actual_delivery_timestamp > t.estimated_delivery_timestamp 
          OR t.actual_delivery_timestamp IS NULL 
        THEN 1 
    END) / COUNT(*), 2) AS bad_experience_pct
FROM customers_126 c
JOIN orders_126 o 
  ON c.customer_id = o.customer_id
JOIN trips_126 t 
  ON o.trip_id = t.trip_id
WHERE c.signup_timestamp >= TO_TIMESTAMP('2022-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
  AND c.signup_timestamp < TO_TIMESTAMP('2022-07-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
  AND o.order_timestamp >= c.signup_timestamp
  AND o.order_timestamp <= c.signup_timestamp + INTERVAL '14' DAY;
  
PROMPT =====================
PROMPT Running QUESTION 127
PROMPT =====================



PROMPT =====================
PROMPT Running QUESTION 128
PROMPT =====================

PROMPT =====================
PROMPT Running QUESTION 129
PROMPT =====================

PROMPT =====================
PROMPT Running QUESTION 130
PROMPT =====================

PROMPT =====================
PROMPT Running QUESTION 131
PROMPT =====================

PROMPT =====================
PROMPT Running QUESTION 132
PROMPT =====================

