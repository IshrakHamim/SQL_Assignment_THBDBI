--------------------------------------------------------------------------------
-- QUESTION 101 / 102 / 135 / 136: UserActivity
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE useractivity_101 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE useractivity_101 (
    username   VARCHAR2(50),
    activity   VARCHAR2(50),
    startDate  DATE,
    endDate    DATE
);

INSERT INTO useractivity_101 (username, activity, startDate, endDate) VALUES ('Alice', 'Travel', DATE '2020-02-12', DATE '2020-02-20');
INSERT INTO useractivity_101 (username, activity, startDate, endDate) VALUES ('Alice', 'Dancing', DATE '2020-02-21', DATE '2020-02-23');
INSERT INTO useractivity_101 (username, activity, startDate, endDate) VALUES ('Alice', 'Travel', DATE '2020-02-24', DATE '2020-02-28');
INSERT INTO useractivity_101 (username, activity, startDate, endDate) VALUES ('Bob', 'Travel', DATE '2020-02-11', DATE '2020-02-18');

--------------------------------------------------------------------------------
-- QUESTION 103 / 115: Students
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE students_103 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE students_103 (
    id    NUMBER,
    name  VARCHAR2(50),
    marks NUMBER
);

INSERT INTO students_103 (id, name, marks) VALUES (1, 'Ashley', 81);
INSERT INTO students_103 (id, name, marks) VALUES (2, 'Samantha', 75);
INSERT INTO students_103 (id, name, marks) VALUES (4, 'Julia', 76);
INSERT INTO students_103 (id, name, marks) VALUES (3, 'Belvet', 84);

--------------------------------------------------------------------------------
-- QUESTION 104 / 107 / 116(b) / 117 / 138: Employee
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE employee_104 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE employee_104 (
    employee_id NUMBER,
    name        VARCHAR2(50),
    months      NUMBER,
    salary      NUMBER
);

INSERT INTO employee_104 (employee_id, name, months, salary) VALUES (12228, 'Rose', 15, 1968);
INSERT INTO employee_104 (employee_id, name, months, salary) VALUES (33645, 'Angela', 1, 3443);
INSERT INTO employee_104 (employee_id, name, months, salary) VALUES (45692, 'Frank', 17, 1608);
INSERT INTO employee_104 (employee_id, name, months, salary) VALUES (56118, 'Patrick', 7, 1345);
INSERT INTO employee_104 (employee_id, name, months, salary) VALUES (59725, 'Lisa', 11, 2330);
INSERT INTO employee_104 (employee_id, name, months, salary) VALUES (74197, 'Kimberly', 16, 4372);
INSERT INTO employee_104 (employee_id, name, months, salary) VALUES (78454, 'Bonnie', 8, 1771);
INSERT INTO employee_104 (employee_id, name, months, salary) VALUES (83565, 'Michael', 6, 2017);
INSERT INTO employee_104 (employee_id, name, months, salary) VALUES (98607, 'Todd', 5, 3396);
INSERT INTO employee_104 (employee_id, name, months, salary) VALUES (99989, 'Joe', 9, 3573);

--------------------------------------------------------------------------------
-- QUESTION 105 / 118: Triangles
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE triangles_105 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE triangles_105 (
    a NUMBER,
    b NUMBER,
    c NUMBER
);

INSERT INTO triangles_105 (a, b, c) VALUES (20, 20, 23);
INSERT INTO triangles_105 (a, b, c) VALUES (20, 20, 20);
INSERT INTO triangles_105 (a, b, c) VALUES (20, 21, 22);
INSERT INTO triangles_105 (a, b, c) VALUES (13, 14, 30);

--------------------------------------------------------------------------------
-- QUESTION 106 / 137: Employees
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE employees_106 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE employees_106 (
    id     NUMBER,
    name   VARCHAR2(50),
    salary NUMBER
);

INSERT INTO employees_106 (id, name, salary) VALUES (1, 'Kristeen', 1420);
INSERT INTO employees_106 (id, name, salary) VALUES (2, 'Ashley', 2006);
INSERT INTO employees_106 (id, name, salary) VALUES (3, 'Julia', 2210);
INSERT INTO employees_106 (id, name, salary) VALUES (4, 'Maria', 3000);

--------------------------------------------------------------------------------
-- QUESTION 108 / 109 / 139 / 140: Occupations
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE occupations_108 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE occupations_108 (
    name       VARCHAR2(50),
    occupation VARCHAR2(50)
);

INSERT INTO occupations_108 (name, occupation) VALUES ('Samantha', 'Doctor');
INSERT INTO occupations_108 (name, occupation) VALUES ('Julia', 'Actor');
INSERT INTO occupations_108 (name, occupation) VALUES ('Maria', 'Actor');
INSERT INTO occupations_108 (name, occupation) VALUES ('Meera', 'Singer');
INSERT INTO occupations_108 (name, occupation) VALUES ('Ashely', 'Professor');
INSERT INTO occupations_108 (name, occupation) VALUES ('Ketty', 'Professor');
INSERT INTO occupations_108 (name, occupation) VALUES ('Christeen', 'Professor');
INSERT INTO occupations_108 (name, occupation) VALUES ('Jane', 'Actor');
INSERT INTO occupations_108 (name, occupation) VALUES ('Jenny', 'Doctor');
INSERT INTO occupations_108 (name, occupation) VALUES ('Priya', 'Singer');

--------------------------------------------------------------------------------
-- QUESTION 110 / 141: BST
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE bst_110 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE bst_110 (
    n NUMBER,
    p NUMBER
);

INSERT INTO bst_110 (n, p) VALUES (1, 2);
INSERT INTO bst_110 (n, p) VALUES (3, 2);
INSERT INTO bst_110 (n, p) VALUES (6, 8);
INSERT INTO bst_110 (n, p) VALUES (9, 8);
INSERT INTO bst_110 (n, p) VALUES (2, 5);
INSERT INTO bst_110 (n, p) VALUES (8, 5);
INSERT INTO bst_110 (n, p) VALUES (5, NULL);

--------------------------------------------------------------------------------
-- QUESTION 111 / 142: Company Hierarchy Tables
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE company_111 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE lead_manager_111 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE senior_manager_111 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE manager_111 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE employee_111 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE company_111 (
    company_code VARCHAR2(50),
    founder      VARCHAR2(50)
);

CREATE TABLE lead_manager_111 (
    lead_manager_code VARCHAR2(50),
    company_code      VARCHAR2(50)
);

CREATE TABLE senior_manager_111 (
    senior_manager_code VARCHAR2(50),
    lead_manager_code   VARCHAR2(50),
    company_code        VARCHAR2(50)
);

CREATE TABLE manager_111 (
    manager_code        VARCHAR2(50),
    senior_manager_code VARCHAR2(50),
    lead_manager_code   VARCHAR2(50),
    company_code        VARCHAR2(50)
);

CREATE TABLE employee_111 (
    employee_code       VARCHAR2(50),
    manager_code        VARCHAR2(50),
    senior_manager_code VARCHAR2(50),
    lead_manager_code   VARCHAR2(50),
    company_code        VARCHAR2(50)
);

INSERT INTO company_111 (company_code, founder) VALUES ('C1', 'Monika');
INSERT INTO company_111 (company_code, founder) VALUES ('C2', 'Samantha');

INSERT INTO lead_manager_111 (lead_manager_code, company_code) VALUES ('LM1', 'C1');
INSERT INTO lead_manager_111 (lead_manager_code, company_code) VALUES ('LM2', 'C2');

INSERT INTO senior_manager_111 (senior_manager_code, lead_manager_code, company_code) VALUES ('SM1', 'LM1', 'C1');
INSERT INTO senior_manager_111 (senior_manager_code, lead_manager_code, company_code) VALUES ('SM2', 'LM1', 'C1');
INSERT INTO senior_manager_111 (senior_manager_code, lead_manager_code, company_code) VALUES ('SM3', 'LM2', 'C2');

INSERT INTO manager_111 (manager_code, senior_manager_code, lead_manager_code, company_code) VALUES ('M1', 'SM1', 'LM1', 'C1');
INSERT INTO manager_111 (manager_code, senior_manager_code, lead_manager_code, company_code) VALUES ('M2', 'SM3', 'LM2', 'C2');
INSERT INTO manager_111 (manager_code, senior_manager_code, lead_manager_code, company_code) VALUES ('M3', 'SM3', 'LM2', 'C2');

INSERT INTO employee_111 (employee_code, manager_code, senior_manager_code, lead_manager_code, company_code) VALUES ('E1', 'M1', 'SM1', 'LM1', 'C1');
INSERT INTO employee_111 (employee_code, manager_code, senior_manager_code, lead_manager_code, company_code) VALUES ('E2', 'M1', 'SM1', 'LM1', 'C1');
INSERT INTO employee_111 (employee_code, manager_code, senior_manager_code, lead_manager_code, company_code) VALUES ('E3', 'M2', 'SM3', 'LM2', 'C2');
INSERT INTO employee_111 (employee_code, manager_code, senior_manager_code, lead_manager_code, company_code) VALUES ('E4', 'M3', 'SM3', 'LM2', 'C2');

--------------------------------------------------------------------------------
-- QUESTION 116(a) / 143: Functions
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE functions_116 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE functions_116 (
    x NUMBER,
    y NUMBER
);

INSERT INTO functions_116 (x, y) VALUES (20, 20);
INSERT INTO functions_116 (x, y) VALUES (20, 20);
INSERT INTO functions_116 (x, y) VALUES (20, 21);
INSERT INTO functions_116 (x, y) VALUES (23, 22);
INSERT INTO functions_116 (x, y) VALUES (22, 23);
INSERT INTO functions_116 (x, y) VALUES (21, 20);

--------------------------------------------------------------------------------
-- QUESTION 119: user_transactions
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE user_transactions_119 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE user_transactions_119 (
    transaction_id   NUMBER,
    product_id       NUMBER,
    spend            NUMBER(10, 2),
    transaction_date DATE
);

INSERT INTO user_transactions_119 (transaction_id, product_id, spend, transaction_date) VALUES (1341, 123424, 1500.60, TO_DATE('12/31/2019 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO user_transactions_119 (transaction_id, product_id, spend, transaction_date) VALUES (1423, 123424, 1000.20, TO_DATE('12/31/2020 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO user_transactions_119 (transaction_id, product_id, spend, transaction_date) VALUES (1623, 123424, 1246.44, TO_DATE('12/31/2021 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO user_transactions_119 (transaction_id, product_id, spend, transaction_date) VALUES (1322, 123424, 2145.32, TO_DATE('12/31/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));

--------------------------------------------------------------------------------
-- QUESTION 120: inventory
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE inventory_120 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE inventory_120 (
    item_id        NUMBER,
    item_type      VARCHAR2(50),
    item_category  VARCHAR2(50),
    square_footage NUMBER(10, 2)
);

INSERT INTO inventory_120 (item_id, item_type, item_category, square_footage) VALUES (1374, 'prime_eligible', 'mini refrigerator', 68.00);
INSERT INTO inventory_120 (item_id, item_type, item_category, square_footage) VALUES (4245, 'not_prime', 'standing lamp', 26.40);
INSERT INTO inventory_120 (item_id, item_type, item_category, square_footage) VALUES (2452, 'prime_eligible', 'television', 85.00);
INSERT INTO inventory_120 (item_id, item_type, item_category, square_footage) VALUES (3255, 'not_prime', 'side table', 22.60);
INSERT INTO inventory_120 (item_id, item_type, item_category, square_footage) VALUES (1672, 'prime_eligible', 'laptop', 8.50);

--------------------------------------------------------------------------------
-- QUESTION 121: user_actions
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE user_actions_121 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE user_actions_121 (
    user_id    NUMBER,
    event_id   NUMBER,
    event_type VARCHAR2(50),
    event_date DATE
);

INSERT INTO user_actions_121 (user_id, event_id, event_type, event_date) VALUES (445, 7765, 'sign-in', TO_DATE('05/31/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO user_actions_121 (user_id, event_id, event_type, event_date) VALUES (742, 6458, 'sign-in', TO_DATE('06/03/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO user_actions_121 (user_id, event_id, event_type, event_date) VALUES (445, 3634, 'like', TO_DATE('06/05/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO user_actions_121 (user_id, event_id, event_type, event_date) VALUES (742, 1374, 'comment', TO_DATE('06/05/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO user_actions_121 (user_id, event_id, event_type, event_date) VALUES (648, 3124, 'like', TO_DATE('06/18/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));

--------------------------------------------------------------------------------
-- QUESTION 122: search_frequency
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE search_frequency_122 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE search_frequency_122 (
    searches  NUMBER,
    num_users NUMBER
);

INSERT INTO search_frequency_122 (searches, num_users) VALUES (1, 2);
INSERT INTO search_frequency_122 (searches, num_users) VALUES (2, 2);
INSERT INTO search_frequency_122 (searches, num_users) VALUES (3, 3);
INSERT INTO search_frequency_122 (searches, num_users) VALUES (4, 1);

--------------------------------------------------------------------------------
-- QUESTION 123: advertiser & daily_pay
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE advertiser_123 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE daily_pay_123 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE advertiser_123 (
    user_id VARCHAR2(50),
    status  VARCHAR2(50)
);

CREATE TABLE daily_pay_123 (
    user_id VARCHAR2(50),
    paid    NUMBER(10, 2)
);

INSERT INTO advertiser_123 (user_id, status) VALUES ('bing', 'NEW');
INSERT INTO advertiser_123 (user_id, status) VALUES ('yahoo', 'NEW');
INSERT INTO advertiser_123 (user_id, status) VALUES ('alibaba', 'EXISTING');

INSERT INTO daily_pay_123 (user_id, paid) VALUES ('yahoo', 45.00);
INSERT INTO daily_pay_123 (user_id, paid) VALUES ('alibaba', 100.00);
INSERT INTO daily_pay_123 (user_id, paid) VALUES ('target', 13.00);

--------------------------------------------------------------------------------
-- QUESTION 124: server_utilization
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE server_utilization_124 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE server_utilization_124 (
    server_id      NUMBER,
    status_time    TIMESTAMP,
    session_status VARCHAR2(50)
);

INSERT INTO server_utilization_124 (server_id, status_time, session_status) VALUES (1, TO_TIMESTAMP('08/02/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'start');
INSERT INTO server_utilization_124 (server_id, status_time, session_status) VALUES (1, TO_TIMESTAMP('08/04/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'stop');
INSERT INTO server_utilization_124 (server_id, status_time, session_status) VALUES (2, TO_TIMESTAMP('08/17/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'start');
INSERT INTO server_utilization_124 (server_id, status_time, session_status) VALUES (2, TO_TIMESTAMP('08/24/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'), 'stop');

--------------------------------------------------------------------------------
-- QUESTION 125: transactions
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE transactions_125 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE transactions_125 (
    transaction_id        NUMBER,
    merchant_id           NUMBER,
    credit_card_id        NUMBER,
    amount                NUMBER,
    transaction_timestamp DATE
);

INSERT INTO transactions_125 (transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp) VALUES (1, 101, 1, 100, TO_DATE('09/25/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO transactions_125 (transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp) VALUES (2, 101, 1, 100, TO_DATE('09/25/2022 12:08:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO transactions_125 (transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp) VALUES (3, 101, 1, 100, TO_DATE('09/25/2022 12:28:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO transactions_125 (transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp) VALUES (4, 102, 2, 300, TO_DATE('09/25/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO transactions_125 (transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp) VALUES (6, 102, 2, 400, TO_DATE('09/25/2022 14:00:00', 'MM/DD/YYYY HH24:MI:SS'));

--------------------------------------------------------------------------------
-- QUESTION 126: DoorDash Orders, Trips, Customers
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE orders_126 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE trips_126 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE customers_126 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE orders_126 (
    order_id        NUMBER,
    customer_id     NUMBER,
    trip_id         NUMBER,
    status          VARCHAR2(50),
    order_timestamp TIMESTAMP
);

CREATE TABLE trips_126 (
    dasher_id                    NUMBER,
    trip_id                      NUMBER,
    estimated_delivery_timestamp TIMESTAMP,
    actual_delivery_timestamp    TIMESTAMP
);

CREATE TABLE customers_126 (
    customer_id      NUMBER,
    signup_timestamp TIMESTAMP
);

INSERT INTO orders_126 (order_id, customer_id, trip_id, status, order_timestamp) VALUES (727424, 8472, 100463, 'completed successfully', TO_TIMESTAMP('06/05/2022 09:12:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO orders_126 (order_id, customer_id, trip_id, status, order_timestamp) VALUES (242513, 2341, 100482, 'completed incorrectly', TO_TIMESTAMP('06/05/2022 14:40:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO orders_126 (order_id, customer_id, trip_id, status, order_timestamp) VALUES (141367, 1314, 100362, 'completed incorrectly', TO_TIMESTAMP('06/07/2022 15:03:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO orders_126 (order_id, customer_id, trip_id, status, order_timestamp) VALUES (582193, 5421, 100657, 'never_received', TO_TIMESTAMP('07/07/2022 15:22:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO orders_126 (order_id, customer_id, trip_id, status, order_timestamp) VALUES (253613, 1314, 100213, 'completed successfully', TO_TIMESTAMP('06/12/2022 13:43:00', 'MM/DD/YYYY HH24:MI:SS'));

INSERT INTO trips_126 (dasher_id, trip_id, estimated_delivery_timestamp, actual_delivery_timestamp) VALUES (101, 100463, TO_TIMESTAMP('06/05/2022 09:42:00', 'MM/DD/YYYY HH24:MI:SS'), TO_TIMESTAMP('06/05/2022 09:38:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO trips_126 (dasher_id, trip_id, estimated_delivery_timestamp, actual_delivery_timestamp) VALUES (102, 100482, TO_TIMESTAMP('06/05/2022 15:10:00', 'MM/DD/YYYY HH24:MI:SS'), TO_TIMESTAMP('06/05/2022 15:46:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO trips_126 (dasher_id, trip_id, estimated_delivery_timestamp, actual_delivery_timestamp) VALUES (101, 100362, TO_TIMESTAMP('06/07/2022 15:33:00', 'MM/DD/YYYY HH24:MI:SS'), TO_TIMESTAMP('06/07/2022 16:45:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO trips_126 (dasher_id, trip_id, estimated_delivery_timestamp, actual_delivery_timestamp) VALUES (102, 100657, TO_TIMESTAMP('07/07/2022 15:52:00', 'MM/DD/YYYY HH24:MI:SS'), NULL);
INSERT INTO trips_126 (dasher_id, trip_id, estimated_delivery_timestamp, actual_delivery_timestamp) VALUES (103, 100213, TO_TIMESTAMP('06/12/2022 14:13:00', 'MM/DD/YYYY HH24:MI:SS'), TO_TIMESTAMP('06/12/2022 14:10:00', 'MM/DD/YYYY HH24:MI:SS'));

INSERT INTO customers_126 (customer_id, signup_timestamp) VALUES (8472, TO_TIMESTAMP('05/30/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO customers_126 (customer_id, signup_timestamp) VALUES (2341, TO_TIMESTAMP('06/01/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO customers_126 (customer_id, signup_timestamp) VALUES (1314, TO_TIMESTAMP('06/03/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO customers_126 (customer_id, signup_timestamp) VALUES (1435, TO_TIMESTAMP('06/05/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO customers_126 (customer_id, signup_timestamp) VALUES (5421, TO_TIMESTAMP('06/07/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));

--------------------------------------------------------------------------------
-- QUESTION 127: Scores
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE scores_127 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE scores_127 (
    player_name  VARCHAR2(50),
    gender       VARCHAR2(10),
    day          DATE,
    score_points NUMBER,
    CONSTRAINT pk_scores_127 PRIMARY KEY (gender, day)
);

INSERT INTO scores_127 (player_name, gender, day, score_points) VALUES ('Aron', 'F', DATE '2020-01-01', 17);
INSERT INTO scores_127 (player_name, gender, day, score_points) VALUES ('Alice', 'F', DATE '2020-01-07', 23);
INSERT INTO scores_127 (player_name, gender, day, score_points) VALUES ('Bajrang', 'M', DATE '2020-01-07', 7);
INSERT INTO scores_127 (player_name, gender, day, score_points) VALUES ('Khali', 'M', DATE '2019-12-25', 11);
INSERT INTO scores_127 (player_name, gender, day, score_points) VALUES ('Slaman', 'M', DATE '2019-12-30', 13);
INSERT INTO scores_127 (player_name, gender, day, score_points) VALUES ('Joe', 'M', DATE '2019-12-31', 3);
INSERT INTO scores_127 (player_name, gender, day, score_points) VALUES ('Jose', 'M', DATE '2019-12-18', 2);
INSERT INTO scores_127 (player_name, gender, day, score_points) VALUES ('Priya', 'F', DATE '2019-12-31', 23);
INSERT INTO scores_127 (player_name, gender, day, score_points) VALUES ('Priyanka', 'F', DATE '2019-12-30', 17);

--------------------------------------------------------------------------------
-- QUESTION 128: Person, Country, Calls
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE person_128 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE country_128 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE calls_128 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE person_128 (
    id           NUMBER PRIMARY KEY,
    name         VARCHAR2(50),
    phone_number VARCHAR2(50)
);

CREATE TABLE country_128 (
    name         VARCHAR2(50),
    country_code VARCHAR2(10)
);

CREATE TABLE calls_128 (
    caller_id NUMBER,
    callee_id NUMBER,
    duration  NUMBER
);

INSERT INTO person_128 (id, name, phone_number) VALUES (3, 'Jonathan', '051-1234567');
INSERT INTO person_128 (id, name, phone_number) VALUES (12, 'Elvis', '051-7654321');
INSERT INTO person_128 (id, name, phone_number) VALUES (1, 'Moncef', '212-1234567');
INSERT INTO person_128 (id, name, phone_number) VALUES (2, 'Maroua', '212-6523651');
INSERT INTO person_128 (id, name, phone_number) VALUES (7, 'Meir', '972-1234567');
INSERT INTO person_128 (id, name, phone_number) VALUES (9, 'Rachel', '972-0011100');

INSERT INTO country_128 (name, country_code) VALUES ('Peru', '051');
INSERT INTO country_128 (name, country_code) VALUES ('Israel', '972');
INSERT INTO country_128 (name, country_code) VALUES ('Morocco', '212');
INSERT INTO country_128 (name, country_code) VALUES ('Germany', '049');
INSERT INTO country_128 (name, country_code) VALUES ('Ethiopia', '251');

INSERT INTO calls_128 (caller_id, callee_id, duration) VALUES (1, 9, 33);
INSERT INTO calls_128 (caller_id, callee_id, duration) VALUES (2, 9, 4);
INSERT INTO calls_128 (caller_id, callee_id, duration) VALUES (1, 2, 59);
INSERT INTO calls_128 (caller_id, callee_id, duration) VALUES (3, 12, 102);
INSERT INTO calls_128 (caller_id, callee_id, duration) VALUES (3, 12, 330);
INSERT INTO calls_128 (caller_id, callee_id, duration) VALUES (12, 3, 5);
INSERT INTO calls_128 (caller_id, callee_id, duration) VALUES (7, 9, 13);
INSERT INTO calls_128 (caller_id, callee_id, duration) VALUES (7, 1, 3);
INSERT INTO calls_128 (caller_id, callee_id, duration) VALUES (9, 7, 1);
INSERT INTO calls_128 (caller_id, callee_id, duration) VALUES (1, 7, 7);

--------------------------------------------------------------------------------
-- QUESTION 129: Numbers
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE numbers_129 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE numbers_129 (
    num       NUMBER PRIMARY KEY,
    frequency NUMBER
);

INSERT INTO numbers_129 (num, frequency) VALUES (0, 7);
INSERT INTO numbers_129 (num, frequency) VALUES (1, 1);
INSERT INTO numbers_129 (num, frequency) VALUES (2, 3);
INSERT INTO numbers_129 (num, frequency) VALUES (3, 1);

--------------------------------------------------------------------------------
-- QUESTION 130: Salary & Employee
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE salary_130 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE employee_130 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE employee_130 (
    employee_id   NUMBER PRIMARY KEY,
    department_id NUMBER
);

CREATE TABLE salary_130 (
    id          NUMBER PRIMARY KEY,
    employee_id NUMBER,
    amount      NUMBER,
    pay_date    DATE,
    CONSTRAINT fk_salary_emp_130 FOREIGN KEY (employee_id) REFERENCES employee_130 (employee_id)
);

INSERT INTO employee_130 (employee_id, department_id) VALUES (1, 1);
INSERT INTO employee_130 (employee_id, department_id) VALUES (2, 2);
INSERT INTO employee_130 (employee_id, department_id) VALUES (3, 2);

INSERT INTO salary_130 (id, employee_id, amount, pay_date) VALUES (1, 1, 9000, DATE '2017-03-31');
INSERT INTO salary_130 (id, employee_id, amount, pay_date) VALUES (2, 2, 6000, DATE '2017-03-31');
INSERT INTO salary_130 (id, employee_id, amount, pay_date) VALUES (3, 3, 10000, DATE '2017-03-31');
INSERT INTO salary_130 (id, employee_id, amount, pay_date) VALUES (4, 1, 7000, DATE '2017-02-28');
INSERT INTO salary_130 (id, employee_id, amount, pay_date) VALUES (5, 2, 6000, DATE '2017-02-28');
INSERT INTO salary_130 (id, employee_id, amount, pay_date) VALUES (6, 3, 8000, DATE '2017-02-28');

--------------------------------------------------------------------------------
-- QUESTION 131: Activity
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE activity_131 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE activity_131 (
    player_id    NUMBER,
    device_id    NUMBER,
    event_date   DATE,
    games_played NUMBER,
    CONSTRAINT pk_activity_131 PRIMARY KEY (player_id, event_date)
);

INSERT INTO activity_131 (player_id, device_id, event_date, games_played) VALUES (1, 2, DATE '2016-03-01', 5);
INSERT INTO activity_131 (player_id, device_id, event_date, games_played) VALUES (1, 2, DATE '2016-03-02', 6);
INSERT INTO activity_131 (player_id, device_id, event_date, games_played) VALUES (2, 3, DATE '2017-06-25', 1);
INSERT INTO activity_131 (player_id, device_id, event_date, games_played) VALUES (3, 1, DATE '2016-03-01', 0);
INSERT INTO activity_131 (player_id, device_id, event_date, games_played) VALUES (3, 4, DATE '2016-07-03', 5);

--------------------------------------------------------------------------------
-- QUESTION 132: Players & Matches
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE players_132 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE matches_132 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE players_132 (
    player_id NUMBER PRIMARY KEY,
    group_id  NUMBER
);

CREATE TABLE matches_132 (
    match_id     NUMBER PRIMARY KEY,
    first_player NUMBER,
    second_player NUMBER,
    first_score  NUMBER,
    second_score NUMBER
);

INSERT INTO players_132 (player_id, group_id) VALUES (15, 1);
INSERT INTO players_132 (player_id, group_id) VALUES (25, 1);
INSERT INTO players_132 (player_id, group_id) VALUES (30, 1);
INSERT INTO players_132 (player_id, group_id) VALUES (45, 1);
INSERT INTO players_132 (player_id, group_id) VALUES (10, 2);
INSERT INTO players_132 (player_id, group_id) VALUES (35, 2);
INSERT INTO players_132 (player_id, group_id) VALUES (50, 2);
INSERT INTO players_132 (player_id, group_id) VALUES (20, 3);
INSERT INTO players_132 (player_id, group_id) VALUES (40, 3);

INSERT INTO matches_132 (match_id, first_player, second_player, first_score, second_score) VALUES (1, 15, 45, 3, 0);
INSERT INTO matches_132 (match_id, first_player, second_player, first_score, second_score) VALUES (2, 30, 25, 1, 2);
INSERT INTO matches_132 (match_id, first_player, second_player, first_score, second_score) VALUES (3, 30, 15, 2, 0);
INSERT INTO matches_132 (match_id, first_player, second_player, first_score, second_score) VALUES (4, 40, 20, 5, 2);
INSERT INTO matches_132 (match_id, first_player, second_player, first_score, second_score) VALUES (5, 35, 50, 1, 1);

--------------------------------------------------------------------------------
-- QUESTION 133 / 134: Student & Exam
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE student_133 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE exam_133 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE student_133 (
    student_id   NUMBER PRIMARY KEY,
    student_name VARCHAR2(50)
);

CREATE TABLE exam_133 (
    exam_id    NUMBER,
    student_id NUMBER,
    score      NUMBER,
    CONSTRAINT pk_exam_133 PRIMARY KEY (exam_id, student_id)
);

INSERT INTO student_133 (student_id, student_name) VALUES (1, 'Daniel');
INSERT INTO student_133 (student_id, student_name) VALUES (2, 'Jade');
INSERT INTO student_133 (student_id, student_name) VALUES (3, 'Stella');
INSERT INTO student_133 (student_id, student_name) VALUES (4, 'Jonathan');
INSERT INTO student_133 (student_id, student_name) VALUES (5, 'Will');

INSERT INTO exam_133 (exam_id, student_id, score) VALUES (10, 1, 70);
INSERT INTO exam_133 (exam_id, student_id, score) VALUES (10, 2, 80);
INSERT INTO exam_133 (exam_id, student_id, score) VALUES (10, 3, 90);
INSERT INTO exam_133 (exam_id, student_id, score) VALUES (20, 1, 80);
INSERT INTO exam_133 (exam_id, student_id, score) VALUES (30, 1, 70);
INSERT INTO exam_133 (exam_id, student_id, score) VALUES (30, 3, 80);
INSERT INTO exam_133 (exam_id, student_id, score) VALUES (30, 4, 90);
INSERT INTO exam_133 (exam_id, student_id, score) VALUES (40, 1, 60);
INSERT INTO exam_133 (exam_id, student_id, score) VALUES (40, 2, 70);
INSERT INTO exam_133 (exam_id, student_id, score) VALUES (40, 4, 80);

--------------------------------------------------------------------------------
-- QUESTION 144: Students, Friends, Packages
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE students_144 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE friends_144 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE packages_144 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE students_144 (
    id   NUMBER PRIMARY KEY,
    name VARCHAR2(50)
);

CREATE TABLE friends_144 (
    id        NUMBER,
    friend_id NUMBER
);

CREATE TABLE packages_144 (
    id     NUMBER PRIMARY KEY,
    salary NUMBER(10, 2)
);

INSERT INTO students_144 (id, name) VALUES (1, 'Ashley');
INSERT INTO students_144 (id, name) VALUES (2, 'Samantha');
INSERT INTO students_144 (id, name) VALUES (3, 'Julia');
INSERT INTO students_144 (id, name) VALUES (4, 'Scarlet');

INSERT INTO friends_144 (id, friend_id) VALUES (1, 2);
INSERT INTO friends_144 (id, friend_id) VALUES (2, 3);
INSERT INTO friends_144 (id, friend_id) VALUES (3, 4);
INSERT INTO friends_144 (id, friend_id) VALUES (4, 1);

INSERT INTO packages_144 (id, salary) VALUES (1, 15.20);
INSERT INTO packages_144 (id, salary) VALUES (2, 10.06);
INSERT INTO packages_144 (id, salary) VALUES (3, 11.55);
INSERT INTO packages_144 (id, salary) VALUES (4, 12.12);

--------------------------------------------------------------------------------
-- QUESTION 145: Hackers, Difficulty, Challenges, Submissions
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE hackers_145 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE difficulty_145 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE challenges_145 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE submissions_145 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/

CREATE TABLE hackers_145 (
    hacker_id NUMBER PRIMARY KEY,
    name      VARCHAR2(50)
);

CREATE TABLE difficulty_145 (
    difficulty_level NUMBER PRIMARY KEY,
    score            NUMBER
);

CREATE TABLE challenges_145 (
    challenge_id     NUMBER PRIMARY KEY,
    hacker_id        NUMBER,
    difficulty_level NUMBER
);

CREATE TABLE submissions_145 (
    submission_id NUMBER PRIMARY KEY,
    hacker_id     NUMBER,
    challenge_id  NUMBER,
    score         NUMBER
);

INSERT INTO hackers_145 (hacker_id, name) VALUES (5580, 'Rosa');
INSERT INTO hackers_145 (hacker_id, name) VALUES (8439, 'Angela');
INSERT INTO hackers_145 (hacker_id, name) VALUES (27205, 'Frank');
INSERT INTO hackers_145 (hacker_id, name) VALUES (52243, 'Patrick');
INSERT INTO hackers_145 (hacker_id, name) VALUES (52348, 'Lisa');
INSERT INTO hackers_145 (hacker_id, name) VALUES (57645, 'Kimberly');
INSERT INTO hackers_145 (hacker_id, name) VALUES (77726, 'Bonnie');
INSERT INTO hackers_145 (hacker_id, name) VALUES (83082, 'Michael');
INSERT INTO hackers_145 (hacker_id, name) VALUES (86870, 'Todd');
INSERT INTO hackers_145 (hacker_id, name) VALUES (90411, 'Joe');

INSERT INTO difficulty_145 (difficulty_level, score) VALUES (1, 20);
INSERT INTO difficulty_145 (difficulty_level, score) VALUES (2, 30);
INSERT INTO difficulty_145 (difficulty_level, score) VALUES (3, 40);
INSERT INTO difficulty_145 (difficulty_level, score) VALUES (4, 60);
INSERT INTO difficulty_145 (difficulty_level, score) VALUES (5, 80);
INSERT INTO difficulty_145 (difficulty_level, score) VALUES (6, 100);
INSERT INTO difficulty_145 (difficulty_level, score) VALUES (7, 120);

INSERT INTO challenges_145 (challenge_id, hacker_id, difficulty_level) VALUES (4810, 77726, 4);
INSERT INTO challenges_145 (challenge_id, hacker_id, difficulty_level) VALUES (21089, 27205, 1);
INSERT INTO challenges_145 (challenge_id, hacker_id, difficulty_level) VALUES (36566, 5580, 7);
INSERT INTO challenges_145 (challenge_id, hacker_id, difficulty_level) VALUES (66730, 52243, 6);
INSERT INTO challenges_145 (challenge_id, hacker_id, difficulty_level) VALUES (71055, 52243, 2);

INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (68628, 77726, 36566, 30);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (65300, 77726, 21089, 10);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (40326, 52243, 36566, 77);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (8941, 27205, 4810, 4);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (83554, 77726, 66730, 30);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (43353, 52243, 66730, 0);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (55385, 52348, 71055, 20);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (39784, 27205, 71055, 23);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (94613, 86870, 71055, 30);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (45788, 52348, 36566, 0);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (93058, 86870, 36566, 30);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (7344, 8439, 66730, 92);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (2721, 8439, 4810, 36);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (523, 5580, 71055, 4);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (49105, 52348, 66730, 0);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (55877, 57645, 66730, 80);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (38355, 27205, 66730, 35);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (3924, 8439, 36566, 80);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (97397, 90411, 66730, 100);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (84162, 83082, 4810, 40);
INSERT INTO submissions_145 (submission_id, hacker_id, challenge_id, score) VALUES (97431, 90411, 71055, 30);

--------------------------------------------------------------------------------
-- QUESTION 146: Projects
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE projects_146 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE projects_146 (
    task_id    NUMBER PRIMARY KEY,
    start_date DATE,
    end_date   DATE
);

INSERT INTO projects_146 (task_id, start_date, end_date) VALUES (1, DATE '2015-10-01', DATE '2015-10-02');
INSERT INTO projects_146 (task_id, start_date, end_date) VALUES (2, DATE '2015-10-02', DATE '2015-10-03');
INSERT INTO projects_146 (task_id, start_date, end_date) VALUES (3, DATE '2015-10-03', DATE '2015-10-04');
INSERT INTO projects_146 (task_id, start_date, end_date) VALUES (4, DATE '2015-10-13', DATE '2015-10-14');
INSERT INTO projects_146 (task_id, start_date, end_date) VALUES (5, DATE '2015-10-14', DATE '2015-10-15');
INSERT INTO projects_146 (task_id, start_date, end_date) VALUES (6, DATE '2015-10-28', DATE '2015-10-29');
INSERT INTO projects_146 (task_id, start_date, end_date) VALUES (7, DATE '2015-10-30', DATE '2015-10-31');

--------------------------------------------------------------------------------
-- QUESTION 147 / 151: transactions (shopping sprees)
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE transactions_147 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE transactions_147 (
    user_id          NUMBER,
    amount           NUMBER(10, 2),
    transaction_date TIMESTAMP
);

INSERT INTO transactions_147 (user_id, amount, transaction_date) VALUES (1, 9.99, TO_TIMESTAMP('08/01/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO transactions_147 (user_id, amount, transaction_date) VALUES (1, 55.00, TO_TIMESTAMP('08/17/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO transactions_147 (user_id, amount, transaction_date) VALUES (2, 149.50, TO_TIMESTAMP('08/05/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO transactions_147 (user_id, amount, transaction_date) VALUES (2, 4.89, TO_TIMESTAMP('08/06/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO transactions_147 (user_id, amount, transaction_date) VALUES (2, 34.00, TO_TIMESTAMP('08/07/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'));

--------------------------------------------------------------------------------
-- QUESTION 148 / 155: payments
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE payments_148 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE payments_148 (
    payer_id     NUMBER,
    recipient_id NUMBER,
    amount       NUMBER
);

INSERT INTO payments_148 (payer_id, recipient_id, amount) VALUES (101, 201, 30);
INSERT INTO payments_148 (payer_id, recipient_id, amount) VALUES (201, 101, 10);
INSERT INTO payments_148 (payer_id, recipient_id, amount) VALUES (101, 301, 20);
INSERT INTO payments_148 (payer_id, recipient_id, amount) VALUES (301, 101, 80);
INSERT INTO payments_148 (payer_id, recipient_id, amount) VALUES (201, 301, 70);

--------------------------------------------------------------------------------
-- QUESTION 149: user_transactions
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE user_transactions_149 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE user_transactions_149 (
    transaction_id   NUMBER,
    user_id          NUMBER,
    spend            NUMBER(10, 2),
    transaction_date TIMESTAMP
);

INSERT INTO user_transactions_149 (transaction_id, user_id, spend, transaction_date) VALUES (759274, 111, 49.50, TO_TIMESTAMP('02/03/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO user_transactions_149 (transaction_id, user_id, spend, transaction_date) VALUES (850371, 111, 51.00, TO_TIMESTAMP('03/15/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO user_transactions_149 (transaction_id, user_id, spend, transaction_date) VALUES (615348, 145, 36.30, TO_TIMESTAMP('03/22/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO user_transactions_149 (transaction_id, user_id, spend, transaction_date) VALUES (137424, 156, 151.00, TO_TIMESTAMP('04/04/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO user_transactions_149 (transaction_id, user_id, spend, transaction_date) VALUES (248475, 156, 87.00, TO_TIMESTAMP('04/16/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));

--------------------------------------------------------------------------------
-- QUESTION 150: measurements
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE measurements_150 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE measurements_150 (
    measurement_id    NUMBER,
    measurement_value NUMBER(10, 2),
    measurement_time  DATE
);

INSERT INTO measurements_150 (measurement_id, measurement_value, measurement_time) VALUES (131233, 1109.51, TO_DATE('07/10/2022 09:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO measurements_150 (measurement_id, measurement_value, measurement_time) VALUES (135211, 1662.74, TO_DATE('07/10/2022 11:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO measurements_150 (measurement_id, measurement_value, measurement_time) VALUES (523542, 1246.24, TO_DATE('07/10/2022 13:15:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO measurements_150 (measurement_id, measurement_value, measurement_time) VALUES (143562, 1124.50, TO_DATE('07/11/2022 15:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO measurements_150 (measurement_id, measurement_value, measurement_time) VALUES (346462, 1234.14, TO_DATE('07/11/2022 16:45:00', 'MM/DD/YYYY HH24:MI:SS'));

--------------------------------------------------------------------------------
-- QUESTION 152: rental_amenities
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE rental_amenities_152 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE rental_amenities_152 (
    rental_id NUMBER,
    amenity   VARCHAR2(50)
);

INSERT INTO rental_amenities_152 (rental_id, amenity) VALUES (123, 'pool');
INSERT INTO rental_amenities_152 (rental_id, amenity) VALUES (123, 'kitchen');
INSERT INTO rental_amenities_152 (rental_id, amenity) VALUES (234, 'hot tub');
INSERT INTO rental_amenities_152 (rental_id, amenity) VALUES (234, 'fireplace');
INSERT INTO rental_amenities_152 (rental_id, amenity) VALUES (345, 'kitchen');
INSERT INTO rental_amenities_152 (rental_id, amenity) VALUES (345, 'pool');
INSERT INTO rental_amenities_152 (rental_id, amenity) VALUES (456, 'pool');

--------------------------------------------------------------------------------
-- QUESTION 153: ad_campaigns
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE ad_campaigns_153 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE ad_campaigns_153 (
    campaign_id   NUMBER,
    spend         NUMBER,
    revenue       NUMBER(10, 2),
    advertiser_id NUMBER
);

INSERT INTO ad_campaigns_153 (campaign_id, spend, revenue, advertiser_id) VALUES (1, 5000, 7500.00, 3);
INSERT INTO ad_campaigns_153 (campaign_id, spend, revenue, advertiser_id) VALUES (2, 1000, 900.00, 1);
INSERT INTO ad_campaigns_153 (campaign_id, spend, revenue, advertiser_id) VALUES (3, 3000, 12000.00, 2);
INSERT INTO ad_campaigns_153 (campaign_id, spend, revenue, advertiser_id) VALUES (4, 500, 2000.00, 4);
INSERT INTO ad_campaigns_153 (campaign_id, spend, revenue, advertiser_id) VALUES (5, 100, 400.00, 4);

--------------------------------------------------------------------------------
-- QUESTION 154: employee_pay
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE employee_pay_154 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE employee_pay_154 (
    employee_id NUMBER,
    salary      NUMBER,
    title       VARCHAR2(50)
);

INSERT INTO employee_pay_154 (employee_id, salary, title) VALUES (101, 80000, 'Data Analyst');
INSERT INTO employee_pay_154 (employee_id, salary, title) VALUES (102, 90000, 'Data Analyst');
INSERT INTO employee_pay_154 (employee_id, salary, title) VALUES (103, 100000, 'Data Analyst');
INSERT INTO employee_pay_154 (employee_id, salary, title) VALUES (104, 30000, 'Data Analyst');
INSERT INTO employee_pay_154 (employee_id, salary, title) VALUES (105, 120000, 'Data Scientist');
INSERT INTO employee_pay_154 (employee_id, salary, title) VALUES (106, 100000, 'Data Scientist');
INSERT INTO employee_pay_154 (employee_id, salary, title) VALUES (107, 80000, 'Data Scientist');
INSERT INTO employee_pay_154 (employee_id, salary, title) VALUES (108, 310000, 'Data Scientist');

--------------------------------------------------------------------------------
-- QUESTION 156: purchases
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE purchases_156 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE purchases_156 (
    user_id       NUMBER,
    product_id    NUMBER,
    quantity      NUMBER,
    purchase_date DATE
);

INSERT INTO purchases_156 (user_id, product_id,  quantity, purchase_date) VALUES (536, 3223, 6, TO_DATE('01/11/2022 12:33:44', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO purchases_156 (user_id, product_id,  quantity, purchase_date) VALUES (827, 3585, 35, TO_DATE('02/20/2022 14:05:26', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO purchases_156 (user_id, product_id,  quantity, purchase_date) VALUES (536, 3223, 5, TO_DATE('03/02/2022 09:33:28', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO purchases_156 (user_id, product_id,  quantity, purchase_date) VALUES (536, 1435, 10, TO_DATE('03/02/2022 08:40:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO purchases_156 (user_id, product_id,  quantity, purchase_date) VALUES (827, 2452, 45, TO_DATE('04/09/2022 00:00:00', 'MM/DD/YYYY HH24:MI:SS'));

--------------------------------------------------------------------------------
-- QUESTION 157: transactions (balances)
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE transactions_157 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE transactions_157 (
    transaction_id   NUMBER,
    type             VARCHAR2(50),
    amount           NUMBER(10, 2),
    transaction_date TIMESTAMP
);

INSERT INTO transactions_157 (transaction_id, type, amount, transaction_date) VALUES (19153, 'deposit', 65.90, TO_TIMESTAMP('07/10/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO transactions_157 (transaction_id, type, amount, transaction_date) VALUES (53151, 'deposit', 178.55, TO_TIMESTAMP('07/08/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO transactions_157 (transaction_id, type, amount, transaction_date) VALUES (29776, 'withdrawal', 25.90, TO_TIMESTAMP('07/08/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO transactions_157 (transaction_id, type, amount, transaction_date) VALUES (16461, 'withdrawal', 45.99, TO_TIMESTAMP('07/08/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO transactions_157 (transaction_id, type, amount, transaction_date) VALUES (77134, 'deposit', 32.60, TO_TIMESTAMP('07/10/2022 10:00:00', 'MM/DD/YYYY HH24:MI:SS'));

--------------------------------------------------------------------------------
-- QUESTION 158: product_spend
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE product_spend_158 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE product_spend_158 (
    category         VARCHAR2(50),
    product          VARCHAR2(50),
    user_id          NUMBER,
    spend            NUMBER(10, 2),
    transaction_date TIMESTAMP
);

INSERT INTO product_spend_158 (category, product, user_id, spend, transaction_date) VALUES ('appliance', 'refrigerator', 165, 246.00, TO_TIMESTAMP('12/26/2021 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO product_spend_158 (category, product, user_id, spend, transaction_date) VALUES ('appliance', 'refrigerator', 123, 299.99, TO_TIMESTAMP('03/02/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO product_spend_158 (category, product, user_id, spend, transaction_date) VALUES ('appliance', 'washing machine', 123, 219.80, TO_TIMESTAMP('03/02/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO product_spend_158 (category, product, user_id, spend, transaction_date) VALUES ('electronics', 'vacuum', 178, 152.00, TO_TIMESTAMP('04/05/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO product_spend_158 (category, product, user_id, spend, transaction_date) VALUES ('electronics', 'wireless headset', 156, 249.90, TO_TIMESTAMP('07/08/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO product_spend_158 (category, product, user_id, spend, transaction_date) VALUES ('electronics', 'vacuum', 145, 189.00, TO_TIMESTAMP('07/15/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));

--------------------------------------------------------------------------------
-- QUESTION 159: users
--------------------------------------------------------------------------------
BEGIN EXECUTE IMMEDIATE 'DROP TABLE users_159 CASCADE CONSTRAINTS'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE users_159 (
    user_id     NUMBER,
    signup_date DATE,
    last_login  DATE
);

INSERT INTO users_159 (user_id, signup_date, last_login) VALUES (1001, TO_DATE('06/01/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('07/05/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO users_159 (user_id, signup_date, last_login) VALUES (1002, TO_DATE('06/03/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('06/15/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO users_159 (user_id, signup_date, last_login) VALUES (1004, TO_DATE('06/02/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('06/15/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO users_159 (user_id, signup_date, last_login) VALUES (1006, TO_DATE('06/15/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('06/27/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));
INSERT INTO users_159 (user_id, signup_date, last_login) VALUES (1012, TO_DATE('06/16/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'), TO_DATE('07/22/2022 12:00:00', 'MM/DD/YYYY HH24:MI:SS'));

COMMIT;