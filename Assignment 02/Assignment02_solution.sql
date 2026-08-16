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

PROMPT =====================
PROMPT Running QUESTION 59
PROMPT =====================

SELECT name 
FROM SalesPerson_Q59 
WHERE sales_id NOT IN (
    SELECT o.sales_id 
    FROM Orders_Q59 o
    JOIN Company_Q59 c 
      ON o.com_id = c.com_id
    WHERE c.name = 'RED'
);

PROMPT =====================
PROMPT Running QUESTION 60
PROMPT =====================

SELECT 
    x,
    y,
    z,
    CASE 
        WHEN (x + y > z) AND (x + z > y) AND (y + z > x) THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle_Q60;

PROMPT =====================
PROMPT Running QUESTION 61
PROMPT =====================

SELECT MIN(ABS(p1.x - p2.x)) AS shortest
FROM Point_Q61 p1
JOIN Point_Q61 p2 
  ON p1.x <> p2.x;

PROMPT =====================
PROMPT Running QUESTION 62
PROMPT =====================

SELECT 
    actor_id,
    director_id
FROM ActorDirector_Q62
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;

PROMPT =====================
PROMPT Running QUESTION 63
PROMPT =====================

SELECT 
    p.product_name,
    s.year,
    s.price
FROM Sales_Q63 s
JOIN Product_Q63 p 
  ON s.product_id = p.product_id;

PROMPT =====================
PROMPT Running QUESTION 64
PROMPT =====================

SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project_Q64 p
JOIN Employee_Q64 e 
  ON p.employee_id = e.employee_id
GROUP BY p.project_id;

PROMPT =====================
PROMPT Running QUESTION 65
PROMPT =====================

SELECT seller_id
FROM Sales_Q65
GROUP BY seller_id
HAVING SUM(price) = (
    SELECT MAX(SUM(price))
    FROM Sales_Q65
    GROUP BY seller_id
);

PROMPT =====================
PROMPT Running QUESTION 66
PROMPT =====================

SELECT DISTINCT buyer_id
FROM Sales_Q65 s
JOIN Product_Q65 p 
  ON s.product_id = p.product_id
WHERE p.product_name = 'S8'
  AND s.buyer_id NOT IN (
      SELECT s2.buyer_id
      FROM Sales_Q65 s2
      JOIN Product_Q65 p2 
        ON s2.product_id = p2.product_id
      WHERE p2.product_name = 'iPhone'
  );

PROMPT =====================
PROMPT Running QUESTION 67
PROMPT =====================

WITH DailySum AS (
    SELECT 
        visited_on,
        SUM(amount) AS daily_amount
    FROM Customer_Q67
    GROUP BY visited_on
),
MovingStats AS (
    SELECT 
        visited_on,
        SUM(daily_amount) OVER (
            ORDER BY visited_on 
            RANGE BETWEEN INTERVAL '6' DAY PRECEDING AND CURRENT ROW
        ) AS amount,
        ROUND(AVG(daily_amount) OVER (
            ORDER BY visited_on 
            RANGE BETWEEN INTERVAL '6' DAY PRECEDING AND CURRENT ROW
        ), 2) AS average_amount,
        MIN(visited_on) OVER () AS first_date
    FROM DailySum
)
SELECT 
    visited_on,
    amount,
    average_amount
FROM MovingStats
WHERE visited_on >= first_date + 6
ORDER BY visited_on ASC;

PROMPT =====================
PROMPT Running QUESTION 68
PROMPT =====================

SELECT 
    gender,
    day,
    SUM(score_points) OVER (
        PARTITION BY gender 
        ORDER BY day ASC
    ) AS total
FROM Scores_Q68
ORDER BY gender ASC, day ASC;

PROMPT =====================
PROMPT Running QUESTION 69
PROMPT =====================

WITH GroupedLogs AS (
    SELECT 
        log_id,
        log_id - ROW_NUMBER() OVER (ORDER BY log_id ASC) AS grp
    FROM Logs_Q69
)
SELECT 
    MIN(log_id) AS start_id,
    MAX(log_id) AS end_id
FROM GroupedLogs
GROUP BY grp
ORDER BY start_id ASC;

PROMPT =====================
PROMPT Running QUESTION 70
PROMPT =====================

SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students_Q70 s
CROSS JOIN Subjects_Q70 sub
LEFT JOIN Examinations_Q70 e 
  ON s.student_id = e.student_id 
 AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id ASC, sub.subject_name ASC;

PROMPT =====================
PROMPT Running QUESTION 71
PROMPT =====================

SELECT employee_id
FROM Employees_Q71
WHERE employee_id <> 1
START WITH manager_id = 1
CONNECT BY PRIOR employee_id = manager_id;

PROMPT =====================
PROMPT Running QUESTION 72
PROMPT =====================

SELECT 
    TO_CHAR(trans_date, 'YYYY-MM') AS month,
    country,
    COUNT(*) AS trans_count,
    COUNT(CASE WHEN state = 'approved' THEN 1 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    NVL(SUM(CASE WHEN state = 'approved' THEN amount END), 0) AS approved_total_amount
FROM Transactions_Q72
GROUP BY TO_CHAR(trans_date, 'YYYY-MM'), country;

PROMPT =====================
PROMPT Running QUESTION 73
PROMPT =====================

WITH DailySpamStats AS (
    SELECT 
        a.action_date,
        COUNT(DISTINCT a.post_id) AS total_spam_posts,
        COUNT(DISTINCT r.post_id) AS removed_spam_posts
    FROM Actions_Q73 a
    LEFT JOIN Removals_Q73 r 
      ON a.post_id = r.post_id
    WHERE a.action = 'report' 
      AND a.extra = 'spam'
    GROUP BY a.action_date
)
SELECT 
    ROUND(AVG((removed_spam_posts / total_spam_posts) * 100), 2) AS average_daily_percent
FROM DailySpamStats;

PROMPT =====================
PROMPT Running QUESTION 74
PROMPT =====================

WITH FirstLogins AS (
    SELECT 
        player_id,
        MIN(event_date) AS first_date
    FROM Activity_Q56
    GROUP BY player_id
)
SELECT 
    ROUND(
        COUNT(DISTINCT a.player_id) / COUNT(DISTINCT f.player_id), 
        2
    ) AS fraction
FROM FirstLogins f
LEFT JOIN Activity_Q56 a 
  ON f.player_id = a.player_id 
 AND a.event_date = f.first_date + 1;

PROMPT =====================
PROMPT Running QUESTION 75
PROMPT =====================

WITH FirstLogins AS (
    SELECT 
        player_id,
        MIN(event_date) AS first_date
    FROM Activity_Q56
    GROUP BY player_id
)
SELECT 
    ROUND(
        COUNT(DISTINCT a.player_id) / COUNT(DISTINCT f.player_id), 
        2
    ) AS fraction
FROM FirstLogins f
LEFT JOIN Activity_Q56 a 
  ON f.player_id = a.player_id 
 AND a.event_date = f.first_date + 1;

PROMPT =====================
PROMPT Running QUESTION 76
PROMPT =====================

WITH CompanyMax AS (
    SELECT 
        company_id,
        employee_id,
        employee_name,
        salary,
        MAX(salary) OVER (PARTITION BY company_id) AS max_sal
    FROM Salaries_Q76
)
SELECT 
    company_id,
    employee_id,
    employee_name,
    ROUND(
        CASE 
            WHEN max_sal > 10000 THEN salary * (1 - 0.49)
            WHEN max_sal >= 1000 THEN salary * (1 - 0.24)
            ELSE salary
        END
    ) AS salary
FROM CompanyMax;

PROMPT =====================
PROMPT Running QUESTION 77
PROMPT =====================

SELECT 
    e.left_operand,
    e.operator,
    e.right_operand,
    CASE 
        WHEN e.operator = '>' AND v1.value > v2.value THEN 'true'
        WHEN e.operator = '<' AND v1.value < v2.value THEN 'true'
        WHEN e.operator = '=' AND v1.value = v2.value THEN 'true'
        ELSE 'false'
    END AS value
FROM Expressions_Q77 e
JOIN Variables_Q77 v1 ON e.left_operand = v1.name
JOIN Variables_Q77 v2 ON e.right_operand = v2.name;

PROMPT =====================
PROMPT Running QUESTION 78
PROMPT =====================

SELECT 
    e.left_operand,
    e.operator,
    e.right_operand,
    CASE 
        WHEN e.operator = '>' AND v1.value > v2.value THEN 'true'
        WHEN e.operator = '<' AND v1.value < v2.value THEN 'true'
        WHEN e.operator = '=' AND v1.value = v2.value THEN 'true'
        ELSE 'false'
    END AS value
FROM Expressions_Q77 e
JOIN Variables_Q77 v1 ON e.left_operand = v1.name
JOIN Variables_Q77 v2 ON e.right_operand = v2.name;

PROMPT =====================
PROMPT Running QUESTION 79
PROMPT =====================

SELECT name
FROM Employee_Q79
ORDER BY name ASC;

PROMPT =====================
PROMPT Running QUESTION 80
PROMPT =====================

WITH YearlySpend AS (
    SELECT 
        product_id,
        EXTRACT(YEAR FROM transaction_date) AS yr,
        SUM(spend) AS curr_year_spend
    FROM user_transactions_Q80
    GROUP BY product_id, EXTRACT(YEAR FROM transaction_date)
),
PriorSpend AS (
    SELECT 
        yr,
        product_id,
        curr_year_spend,
        LAG(curr_year_spend) OVER (
            PARTITION BY product_id 
            ORDER BY yr ASC
        ) AS prev_year_spend
    FROM YearlySpend
)
SELECT 
    yr,
    product_id,
    curr_year_spend,
    prev_year_spend,
    ROUND(((curr_year_spend - prev_year_spend) / prev_year_spend) * 100, 2) AS yoy_rate
FROM PriorSpend
ORDER BY product_id ASC, yr ASC;

PROMPT =====================
PROMPT Running QUESTION 81
PROMPT =====================

SELECT * FROM inventory_q81;

WITH Summary AS (
    SELECT 
        item_type,
        SUM(square_footage) AS total_sqft,
        COUNT(*) AS item_count
    FROM inventory_Q81
    GROUP BY item_type
),
PrimeCalc AS (
    SELECT 
        item_type,
        item_count,
        total_sqft,
        TRUNC(500000 / total_sqft) AS prime_batches,
        TRUNC(500000 / total_sqft) * item_count AS prime_item_count,
        500000 - (TRUNC(500000 / total_sqft) * total_sqft) AS remaining_sqft
    FROM Summary
    WHERE item_type = 'prime_eligible'
),
NonPrimeCalc AS (
    SELECT 
        s.item_type,
        TRUNC(p.remaining_sqft / s.total_sqft) * s.item_count AS item_count
    FROM Summary s
    CROSS JOIN PrimeCalc p
    WHERE s.item_type = 'not_prime'
)
SELECT item_type, prime_item_count AS item_count FROM PrimeCalc
UNION ALL
SELECT item_type, item_count FROM NonPrimeCalc;

PROMPT =====================
PROMPT Running QUESTION 82
PROMPT =====================

SELECT 
    EXTRACT(MONTH FROM curr.event_date) AS month,
    COUNT(DISTINCT curr.user_id) AS monthly_active_users
FROM user_actions_Q82 curr
WHERE EXTRACT(MONTH FROM curr.event_date) = 7
  AND EXTRACT(YEAR FROM curr.event_date) = 2022
  AND curr.event_type IN ('sign-in', 'like', 'comment')
  AND EXISTS (
      SELECT 1 
      FROM user_actions_Q82 prev
      WHERE prev.user_id = curr.user_id
        AND EXTRACT(MONTH FROM prev.event_date) = 6
        AND EXTRACT(YEAR FROM prev.event_date) = 2022
        AND prev.event_type IN ('sign-in', 'like', 'comment')
  )
GROUP BY EXTRACT(MONTH FROM curr.event_date);


PROMPT =====================
PROMPT Running QUESTION 83
PROMPT =====================

SELECT * FROM search_frequency_q83;
WITH SearchExpanded AS (
    SELECT searches
    FROM search_frequency_Q83
    CONNECT BY PRIOR searches = searches
           AND PRIOR SYS_GUID() IS NOT NULL
           AND LEVEL <= num_users
)
SELECT 
    ROUND(MEDIAN(searches), 1) AS median
FROM SearchExpanded;

PROMPT =====================
PROMPT Running QUESTION 84
PROMPT =====================

SELECT SUBSTR(user_id, 1, 20) AS user_id, status 
FROM advertiser_q84;

SELECT SUBSTR(user_id, 1, 20) AS user_id, paid
FROM daily_pay_Q84;

SELECT 
    a.user_id,
    CASE 
        WHEN dp.paid IS NULL THEN 'CHURN'
        WHEN a.status = 'CHURN' THEN 'RESURRECT'
        ELSE 'EXISTING'
    END AS new_status
FROM advertiser_Q84 a
LEFT JOIN daily_pay_Q84 dp 
  ON a.user_id = dp.user_id
ORDER BY a.user_id ASC;

PROMPT =====================
PROMPT Running QUESTION 85
PROMPT =====================

SELECT * FROM server_utilization_q85;

WITH ServerSessions AS (
    SELECT 
        server_id,
        session_status,
        status_time AS start_time,
        LEAD(status_time) OVER (
            PARTITION BY server_id 
            ORDER BY status_time ASC
        ) AS stop_time
    FROM server_utilization_Q85
)
SELECT 
    FLOOR(SUM(CAST(stop_time AS DATE) - CAST(start_time AS DATE))) AS total_uptime_days
FROM ServerSessions
WHERE session_status = 'start';

PROMPT =====================
PROMPT Running QUESTION 86
PROMPT =====================

WITH RankedCards AS (
    SELECT 
        card_name,
        issued_amount,
        ROW_NUMBER() OVER (
            PARTITION BY card_name 
            ORDER BY issue_year ASC, issue_month ASC
        ) AS rnk
    FROM monthly_cards_issued_Q86
)
SELECT 
    card_name,
    issued_amount
FROM RankedCards
WHERE rnk = 1
ORDER BY issued_amount DESC;

PROMPT =====================
PROMPT Running QUESTION 87
PROMPT =====================

SELECT * FROM orders_q87;

SELECT * FROM trips_q87;

SELECT * FROM customers_q87;

SELECT o.order_id, t.trip_id, c.customer_id, o.status
FROM orders_q87 o
JOIN trips_q87 t ON o.trip_id = t.trip_id 
JOIN customers_q87 c ON o.customer_id = c.customer_id;

PROMPT =====================
PROMPT Running QUESTION 88
PROMPT =====================

SELECT 
    gender,
    day,
    SUM(score_points) OVER (
        PARTITION BY gender 
        ORDER BY day ASC
    ) AS total
FROM Scores_Q68
ORDER BY gender ASC, day ASC;

PROMPT =====================
PROMPT Running QUESTION 89
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
PROMPT Running QUESTION 90
PROMPT =====================

SELECT * FROM numbers_q90;

WITH numlist AS 
(
SELECT num 
FROM numbers_q90
CONNECT BY PRIOR num = num
        AND PRIOR SYS_GUID() IS NOT NULL  
        AND LEVEL <= frequency
)
SELECT ROUND(MEDIAN(num),1) as MEDIAN
FROM numlist;


PROMPT =====================
PROMPT Running QUESTION 91
PROMPT =====================

WITH MonthlyDeptAvg AS (
    SELECT 
        TO_CHAR(s.pay_date, 'YYYY-MM') AS pay_month,
        e.department_id,
        AVG(s.amount) AS dept_avg
    FROM Salary_Q91 s
    JOIN Employee_Q91 e 
      ON s.employee_id = e.employee_id
    GROUP BY TO_CHAR(s.pay_date, 'YYYY-MM'), e.department_id
),
MonthlyCompanyAvg AS (
    SELECT 
        TO_CHAR(pay_date, 'YYYY-MM') AS pay_month,
        AVG(amount) AS comp_avg
    FROM Salary_Q91
    GROUP BY TO_CHAR(pay_date, 'YYYY-MM')
)
SELECT 
    d.pay_month,
    d.department_id,
    CASE 
        WHEN d.dept_avg > c.comp_avg THEN 'higher'
        WHEN d.dept_avg < c.comp_avg THEN 'lower'
        ELSE 'same'
    END AS comparison
FROM MonthlyDeptAvg d
JOIN MonthlyCompanyAvg c 
  ON d.pay_month = c.pay_month
ORDER BY d.pay_month DESC, d.department_id ASC;

PROMPT =====================
PROMPT Running QUESTION 92
PROMPT =====================

WITH FirstLogins AS (
    SELECT 
        player_id,
        MIN(event_date) AS first_date
    FROM Activity_Q56
    GROUP BY player_id
)
SELECT 
    ROUND(
        COUNT(DISTINCT a.player_id) / COUNT(DISTINCT f.player_id), 
        2
    ) AS fraction
FROM FirstLogins f
LEFT JOIN Activity_Q56 a 
  ON f.player_id = a.player_id 
 AND a.event_date = f.first_date + 1;

PROMPT =====================
PROMPT Running QUESTION 93
PROMPT =====================

WITH PlayerScores AS (
    SELECT first_player AS player_id, first_score AS score FROM Matches_Q93
    UNION ALL
    SELECT second_player AS player_id, second_score AS score FROM Matches_Q93
),
TotalScores AS (
    SELECT 
        p.group_id,
        p.player_id,
        NVL(SUM(ps.score), 0) AS total_score,
        ROW_NUMBER() OVER (
            PARTITION BY p.group_id 
            ORDER BY NVL(SUM(ps.score), 0) DESC, p.player_id ASC
        ) AS rnk
    FROM Players_Q93 p
    LEFT JOIN PlayerScores ps 
      ON p.player_id = ps.player_id
    GROUP BY p.group_id, p.player_id
)
SELECT 
    group_id,
    player_id
FROM TotalScores
WHERE rnk = 1
ORDER BY group_id ASC;

PROMPT =====================
PROMPT Running QUESTION 94
PROMPT =====================

WITH ExamMinMax AS (
    SELECT 
        exam_id,
        MIN(score) AS min_score,
        MAX(score) AS max_score
    FROM Exam_Q94
    GROUP BY exam_id
),
LoudStudents AS (
    SELECT DISTINCT e.student_id
    FROM Exam_Q94 e
    JOIN ExamMinMax mm 
      ON e.exam_id = mm.exam_id
    WHERE e.score = mm.min_score 
       OR e.score = mm.max_score
)
SELECT DISTINCT 
    s.student_id,
    s.student_name
FROM Student_Q94 s
JOIN Exam_Q94 e 
  ON s.student_id = e.student_id
WHERE s.student_id NOT IN (SELECT student_id FROM LoudStudents)
ORDER BY s.student_id ASC;

PROMPT =====================
PROMPT Running QUESTION 95
PROMPT =====================

WITH ExamMinMax AS (
    SELECT 
        exam_id,
        MIN(score) AS min_score,
        MAX(score) AS max_score
    FROM Exam_Q94
    GROUP BY exam_id
),
LoudStudents AS (
    SELECT DISTINCT e.student_id
    FROM Exam_Q94 e
    JOIN ExamMinMax mm 
      ON e.exam_id = mm.exam_id
    WHERE e.score = mm.min_score 
       OR e.score = mm.max_score
)
SELECT DISTINCT 
    s.student_id,
    s.student_name
FROM Student_Q94 s
JOIN Exam_Q94 e 
  ON s.student_id = e.student_id
WHERE s.student_id NOT IN (SELECT student_id FROM LoudStudents)
ORDER BY s.student_id ASC;

PROMPT =====================
PROMPT Running QUESTION 96
PROMPT =====================

WITH stripped AS (
    SELECT 
        user_id, 
        song_id, 
        COUNT(*) AS song_count
    FROM songs_weekly_q96
    WHERE listen_time <= TO_TIMESTAMP('2022-08-04 23:59:59', 'YYYY-MM-DD HH24:MI:SS')
    GROUP BY user_id, song_id
)
SELECT 
    NVL(s.user_id, h.user_id) AS user_id,
    NVL(s.song_id, h.song_id) AS song_id,
    NVL(h.song_plays, 0) + NVL(s.song_count, 0) AS song_plays
FROM stripped s
FULL OUTER JOIN songs_history_q96 h
  ON s.user_id = h.user_id 
 AND s.song_id = h.song_id
ORDER BY song_plays DESC;

PROMPT =====================
PROMPT Running QUESTION 97
PROMPT =====================

SELECT 
    ROUND(
        COUNT(CASE WHEN t.signup_action = 'Confirmed' THEN 1 END) / COUNT(DISTINCT e.email_id),
        2
    ) AS confirm_rate
FROM emails_Q97 e
LEFT JOIN texts_Q97 t 
  ON e.email_id = t.email_id;

PROMPT =====================
PROMPT Running QUESTION 98
PROMPT =====================

WITH DailyTweetCounts AS (
    SELECT 
        user_id,
        tweet_date,
        COUNT(tweet_id) AS tweet_count
    FROM tweets_Q98
    GROUP BY user_id, tweet_date
)
SELECT 
    user_id,
    tweet_date,
    ROUND(
        AVG(tweet_count) OVER (
            PARTITION BY user_id 
            ORDER BY tweet_date ASC 
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        ), 
        2
    ) AS rolling_avg_3days
FROM DailyTweetCounts
ORDER BY user_id ASC, tweet_date ASC;

PROMPT =====================
PROMPT Running QUESTION 99
PROMPT =====================

SELECT 
    b.age_bucket,
    ROUND(
        100.0 * SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0 END) / 
        SUM(CASE WHEN a.activity_type IN ('send', 'open') THEN a.time_spent ELSE 0 END),
        2
    ) AS send_perc,
    ROUND(
        100.0 * SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0 END) / 
        SUM(CASE WHEN a.activity_type IN ('send', 'open') THEN a.time_spent ELSE 0 END),
        2
    ) AS open_perc
FROM activities_Q99 a
JOIN age_breakdown_Q99 b 
  ON a.user_id = b.user_id
WHERE a.activity_type IN ('send', 'open')
GROUP BY b.age_bucket
ORDER BY b.age_bucket ASC;

PROMPT =====================
PROMPT Running QUESTION 100
PROMPT =====================

SELECT p.profile_id
FROM personal_profiles_Q100 p
JOIN employee_company_Q100 ec 
  ON p.profile_id = ec.personal_profile_id
JOIN company_pages_Q100 c 
  ON ec.company_id = c.company_id
GROUP BY p.profile_id, p.followers
HAVING p.followers > MAX(c.followers)
ORDER BY p.profile_id ASC;