-- Clean up existing tables and foreign keys
BEGIN
    FOR t IN (
        SELECT table_name FROM user_tables 
        WHERE table_name IN (
            'WORLD_Q51', 'CUSTOMER_Q52', 'CUSTOMERS_Q53', 'ORDERS_Q53', 'EMPLOYEE_Q54',
            'PERSON_Q55', 'COUNTRY_Q55', 'CALLS_Q55', 'ACTIVITY_Q56', 'ORDERS_Q57',
            'CINEMA_Q58', 'SALESPERSON_Q59', 'COMPANY_Q59', 'ORDERS_Q59', 'TRIANGLE_Q60',
            'POINT_Q61', 'ACTORDIRECTOR_Q62', 'PRODUCT_Q63', 'SALES_Q63', 'EMPLOYEE_Q64',
            'PROJECT_Q64', 'PRODUCT_Q65', 'SALES_Q65', 'CUSTOMER_Q67', 'SCORES_Q68',
            'LOGS_Q69', 'STUDENTS_Q70', 'SUBJECTS_Q70', 'EXAMINATIONS_Q70', 'EMPLOYEES_Q71',
            'TRANSACTIONS_Q72', 'ACTIONS_Q73', 'REMOVALS_Q73', 'SALARIES_Q76', 'VARIABLES_Q77',
            'EXPRESSIONS_Q77', 'EMPLOYEE_Q79', 'USER_TRANSACTIONS_Q80', 'INVENTORY_Q81',
            'USER_ACTIONS_Q82', 'SEARCH_FREQUENCY_Q83', 'ADVERTISER_Q84', 'DAILY_PAY_Q84',
            'SERVER_UTILIZATION_Q85', 'TRANSACTIONS_Q86', 'CUSTOMERS_Q87', 'TRIPS_Q87',
            'ORDERS_Q87', 'NUMBERS_Q90', 'EMPLOYEE_Q91', 'SALARY_Q91', 'PLAYERS_Q93',
            'MATCHES_Q93', 'STUDENT_Q94', 'EXAM_Q94', 'SONGS_HISTORY_Q96', 'SONGS_WEEKLY_Q96',
            'EMAILS_Q97', 'TEXTS_Q97', 'TWEETS_Q98', 'ACTIVITIES_Q99', 'AGE_BREAKDOWN_Q99',
            'PERSONAL_PROFILES_Q100', 'COMPANY_PAGES_Q100', 'EMPLOYEE_COMPANY_Q100'
        )
    ) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || t.table_name || ' CASCADE CONSTRAINTS PURGE';
    END LOOP;
END;
/

-- Q51
CREATE TABLE World_Q51 (
    name VARCHAR2(255) PRIMARY KEY,
    continent VARCHAR2(255),
    area NUMBER(10),
    population NUMBER(10),
    gdp NUMBER(19)
);

-- Q52
CREATE TABLE Customer_Q52 (
    id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(255),
    referee_id NUMBER(10)
);

-- Q53
CREATE TABLE Customers_Q53 (
    id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(255)
);

CREATE TABLE Orders_Q53 (
    id NUMBER(10) PRIMARY KEY,
    customerId NUMBER(10),
    CONSTRAINT fk_orders_q53 FOREIGN KEY (customerId) REFERENCES Customers_Q53(id)
);

-- Q54
CREATE TABLE Employee_Q54 (
    employee_id NUMBER(10) PRIMARY KEY,
    team_id NUMBER(10)
);

-- Q55
CREATE TABLE Person_Q55 (
    id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(255),
    phone_number VARCHAR2(255)
);

CREATE TABLE Country_Q55 (
    country_code VARCHAR2(10) PRIMARY KEY,
    name VARCHAR2(255)
);

CREATE TABLE Calls_Q55 (
    caller_id NUMBER(10),
    callee_id NUMBER(10),
    duration NUMBER(10)
);

-- Q56
CREATE TABLE Activity_Q56 (
    player_id NUMBER(10),
    device_id NUMBER(10),
    event_date DATE,
    games_played NUMBER(10),
    CONSTRAINT pk_activity_q56 PRIMARY KEY (player_id, event_date)
);

-- Q57
CREATE TABLE Orders_Q57 (
    order_number NUMBER(10) PRIMARY KEY,
    customer_number NUMBER(10)
);

-- Q58
CREATE TABLE Cinema_Q58 (
    seat_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    free NUMBER(1) CHECK (free IN (0, 1))
);

-- Q59
CREATE TABLE SalesPerson_Q59 (
    sales_id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(255),
    salary NUMBER(10),
    commission_rate NUMBER(10),
    hire_date DATE
);

CREATE TABLE Company_Q59 (
    com_id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(255),
    city VARCHAR2(255)
);

CREATE TABLE Orders_Q59 (
    order_id NUMBER(10) PRIMARY KEY,
    order_date DATE,
    com_id NUMBER(10),
    sales_id NUMBER(10),
    amount NUMBER(10),
    CONSTRAINT fk_orders_q59_com FOREIGN KEY (com_id) REFERENCES Company_Q59(com_id),
    CONSTRAINT fk_orders_q59_sales FOREIGN KEY (sales_id) REFERENCES SalesPerson_Q59(sales_id)
);

-- Q60
CREATE TABLE Triangle_Q60 (
    x NUMBER(10),
    y NUMBER(10),
    z NUMBER(10),
    CONSTRAINT pk_triangle_q60 PRIMARY KEY (x, y, z)
);

-- Q61
CREATE TABLE Point_Q61 (
    x NUMBER(10) PRIMARY KEY
);

-- Q62
CREATE TABLE ActorDirector_Q62 (
    actor_id NUMBER(10),
    director_id NUMBER(10),
    timestamp NUMBER(10) PRIMARY KEY
);

-- Q63
CREATE TABLE Product_Q63 (
    product_id NUMBER(10) PRIMARY KEY,
    product_name VARCHAR2(255)
);

CREATE TABLE Sales_Q63 (
    sale_id NUMBER(10),
    product_id NUMBER(10),
    year NUMBER(10),
    quantity NUMBER(10),
    price NUMBER(10),
    CONSTRAINT pk_sales_q63 PRIMARY KEY (sale_id, year),
    CONSTRAINT fk_sales_q63 FOREIGN KEY (product_id) REFERENCES Product_Q63(product_id)
);

-- Q64
CREATE TABLE Employee_Q64 (
    employee_id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(255),
    experience_years NUMBER(10)
);

CREATE TABLE Project_Q64 (
    project_id NUMBER(10),
    employee_id NUMBER(10),
    CONSTRAINT pk_project_q64 PRIMARY KEY (project_id, employee_id),
    CONSTRAINT fk_project_q64 FOREIGN KEY (employee_id) REFERENCES Employee_Q64(employee_id)
);

-- Q65
CREATE TABLE Product_Q65 (
    product_id NUMBER(10) PRIMARY KEY,
    product_name VARCHAR2(255),
    unit_price NUMBER(10)
);

CREATE TABLE Sales_Q65 (
    seller_id NUMBER(10),
    product_id NUMBER(10),
    buyer_id NUMBER(10),
    sale_date DATE,
    quantity NUMBER(10),
    price NUMBER(10),
    CONSTRAINT fk_sales_q65 FOREIGN KEY (product_id) REFERENCES Product_Q65(product_id)
);

-- Q67
CREATE TABLE Customer_Q67 (
    customer_id NUMBER(10),
    name VARCHAR2(255),
    visited_on DATE,
    amount NUMBER(10),
    CONSTRAINT pk_customer_q67 PRIMARY KEY (customer_id, visited_on)
);

-- Q68
CREATE TABLE Scores_Q68 (
    player_name VARCHAR2(255),
    gender VARCHAR2(10),
    day DATE,
    score_points NUMBER(10),
    CONSTRAINT pk_scores_q68 PRIMARY KEY (gender, day)
);

-- Q69
CREATE TABLE Logs_Q69 (
    log_id NUMBER(10) PRIMARY KEY
);

-- Q70
CREATE TABLE Students_Q70 (
    student_id NUMBER(10) PRIMARY KEY,
    student_name VARCHAR2(255)
);

CREATE TABLE Subjects_Q70 (
    subject_name VARCHAR2(255) PRIMARY KEY
);

CREATE TABLE Examinations_Q70 (
    student_id NUMBER(10),
    subject_name VARCHAR2(255)
);

-- Q71
CREATE TABLE Employees_Q71 (
    employee_id NUMBER(10) PRIMARY KEY,
    employee_name VARCHAR2(255),
    manager_id NUMBER(10)
);

-- Q72
CREATE TABLE Transactions_Q72 (
    id NUMBER(10) PRIMARY KEY,
    country VARCHAR2(255),
    state VARCHAR2(20) CHECK (state IN ('approved', 'declined')),
    amount NUMBER(10),
    trans_date DATE
);

-- Q73
CREATE TABLE Actions_Q73 (
    user_id NUMBER(10),
    post_id NUMBER(10),
    action_date DATE,
    action VARCHAR2(20) CHECK (action IN ('view', 'like', 'reaction', 'comment', 'report', 'share')),
    extra VARCHAR2(255)
);

CREATE TABLE Removals_Q73 (
    post_id NUMBER(10) PRIMARY KEY,
    remove_date DATE
);

-- Q76
CREATE TABLE Salaries_Q76 (
    company_id NUMBER(10),
    employee_id NUMBER(10),
    employee_name VARCHAR2(255),
    salary NUMBER(10),
    CONSTRAINT pk_salaries_q76 PRIMARY KEY (company_id, employee_id)
);

-- Q77
CREATE TABLE Variables_Q77 (
    name VARCHAR2(255) PRIMARY KEY,
    value NUMBER(10)
);

CREATE TABLE Expressions_Q77 (
    left_operand VARCHAR2(255),
    operator VARCHAR2(5) CHECK (operator IN ('<', '>', '=')),
    right_operand VARCHAR2(255),
    CONSTRAINT pk_expressions_q77 PRIMARY KEY (left_operand, operator, right_operand)
);

-- Q79
CREATE TABLE Employee_Q79 (
    employee_id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(255),
    months NUMBER(10),
    salary NUMBER(10)
);

-- Q80
CREATE TABLE user_transactions_Q80 (
    transaction_id NUMBER(10) PRIMARY KEY,
    product_id NUMBER(10),
    spend NUMBER(10, 2),
    transaction_date TIMESTAMP
);

-- Q81
CREATE TABLE inventory_Q81 (
    item_id NUMBER(10) PRIMARY KEY,
    item_type VARCHAR2(255),
    item_category VARCHAR2(255),
    square_footage NUMBER(10, 2)
);

-- Q82
CREATE TABLE user_actions_Q82 (
    user_id NUMBER(10),
    event_id NUMBER(10) PRIMARY KEY,
    event_type VARCHAR2(50),
    event_date TIMESTAMP
);

-- Q83
CREATE TABLE search_frequency_Q83 (
    searches NUMBER(10) PRIMARY KEY,
    num_users NUMBER(10)
);

-- Q84
CREATE TABLE advertiser_Q84 (
    user_id VARCHAR2(255) PRIMARY KEY,
    status VARCHAR2(50)
);

CREATE TABLE daily_pay_Q84 (
    user_id VARCHAR2(255),
    paid NUMBER(10, 2)
);

-- Q85
CREATE TABLE server_utilization_Q85 (
    server_id NUMBER(10),
    status_time TIMESTAMP,
    session_status VARCHAR2(50)
);

-- Q86
CREATE TABLE transactions_Q86 (
    transaction_id NUMBER(10) PRIMARY KEY,
    merchant_id NUMBER(10),
    credit_card_id NUMBER(10),
    amount NUMBER(10),
    transaction_timestamp TIMESTAMP
);

-- Q87
CREATE TABLE customers_Q87 (
    customer_id NUMBER(10) PRIMARY KEY,
    signup_timestamp TIMESTAMP
);

CREATE TABLE trips_Q87 (
    dasher_id NUMBER(10),
    trip_id NUMBER(10) PRIMARY KEY,
    estimated_delivery_timestamp TIMESTAMP,
    actual_delivery_timestamp TIMESTAMP
);

CREATE TABLE orders_Q87 (
    order_id NUMBER(10) PRIMARY KEY,
    customer_id NUMBER(10),
    trip_id NUMBER(10),
    status VARCHAR2(255),
    order_timestamp TIMESTAMP,
    CONSTRAINT fk_orders_q87_cust FOREIGN KEY (customer_id) REFERENCES customers_Q87(customer_id),
    CONSTRAINT fk_orders_q87_trip FOREIGN KEY (trip_id) REFERENCES trips_Q87(trip_id)
);

-- Q90
CREATE TABLE Numbers_Q90 (
    num NUMBER(10) PRIMARY KEY,
    frequency NUMBER(10)
);

-- Q91
CREATE TABLE Employee_Q91 (
    employee_id NUMBER(10) PRIMARY KEY,
    department_id NUMBER(10)
);

CREATE TABLE Salary_Q91 (
    id NUMBER(10) PRIMARY KEY,
    employee_id NUMBER(10),
    amount NUMBER(10),
    pay_date DATE,
    CONSTRAINT fk_salary_q91 FOREIGN KEY (employee_id) REFERENCES Employee_Q91(employee_id)
);

-- Q93
CREATE TABLE Players_Q93 (
    player_id NUMBER(10) PRIMARY KEY,
    group_id NUMBER(10)
);

CREATE TABLE Matches_Q93 (
    match_id NUMBER(10) PRIMARY KEY,
    first_player NUMBER(10),
    second_player NUMBER(10),
    first_score NUMBER(10),
    second_score NUMBER(10)
);

-- Q94
CREATE TABLE Student_Q94 (
    student_id NUMBER(10) PRIMARY KEY,
    student_name VARCHAR2(255)
);

CREATE TABLE Exam_Q94 (
    exam_id NUMBER(10),
    student_id NUMBER(10),
    score NUMBER(10),
    CONSTRAINT pk_exam_q94 PRIMARY KEY (exam_id, student_id)
);

-- Q96
CREATE TABLE songs_history_Q96 (
    history_id NUMBER(10) PRIMARY KEY,
    user_id NUMBER(10),
    song_id NUMBER(10),
    song_plays NUMBER(10)
);

CREATE TABLE songs_weekly_Q96 (
    user_id NUMBER(10),
    song_id NUMBER(10),
    listen_time TIMESTAMP
);

-- Q97
CREATE TABLE emails_Q97 (
    email_id NUMBER(10) PRIMARY KEY,
    user_id NUMBER(10),
    signup_date TIMESTAMP
);

CREATE TABLE texts_Q97 (
    text_id NUMBER(10) PRIMARY KEY,
    email_id NUMBER(10),
    signup_action VARCHAR2(50),
    CONSTRAINT fk_texts_q97 FOREIGN KEY (email_id) REFERENCES emails_Q97(email_id)
);

-- Q98
CREATE TABLE tweets_Q98 (
    tweet_id NUMBER(10) PRIMARY KEY,
    user_id NUMBER(10),
    tweet_date TIMESTAMP
);

-- Q99
CREATE TABLE activities_Q99 (
    activity_id NUMBER(10) PRIMARY KEY,
    user_id NUMBER(10),
    activity_type VARCHAR2(50),
    time_spent NUMBER(12, 4),
    activity_date TIMESTAMP
);

CREATE TABLE age_breakdown_Q99 (
    user_id NUMBER(10) PRIMARY KEY,
    age_bucket VARCHAR2(50)
);

-- Q100
CREATE TABLE personal_profiles_Q100 (
    profile_id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(255),
    followers NUMBER(10)
);

CREATE TABLE company_pages_Q100 (
    company_id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(255),
    followers NUMBER(10)
);

CREATE TABLE employee_company_Q100 (
    personal_profile_id NUMBER(10),
    company_id NUMBER(10),
    CONSTRAINT pk_employee_company_q100 PRIMARY KEY (personal_profile_id, company_id),
    CONSTRAINT fk_emp_comp_prof FOREIGN KEY (personal_profile_id) REFERENCES personal_profiles_Q100(profile_id),
    CONSTRAINT fk_emp_comp_page FOREIGN KEY (company_id) REFERENCES company_pages_Q100(company_id)
    
)

-- Q51: World Table
INSERT INTO World_Q51 (name, continent, area, population, gdp) VALUES ('Afghanistan', 'Asia', 652230, 25500100, 20343000000);
INSERT INTO World_Q51 (name, continent, area, population, gdp) VALUES ('Albania', 'Europe', 28748, 2831741, 12960000000);
INSERT INTO World_Q51 (name, continent, area, population, gdp) VALUES ('Algeria', 'Africa', 2381741, 37100000, 188681000000);
INSERT INTO World_Q51 (name, continent, area, population, gdp) VALUES ('Andorra', 'Europe', 468, 78115, 3712000000);
INSERT INTO World_Q51 (name, continent, area, population, gdp) VALUES ('Angola', 'Africa', 1246700, 20609294, 100990000000);

-- Q52: Customer Table
INSERT INTO Customer_Q52 (id, name, referee_id) VALUES (1, 'Will', NULL);
INSERT INTO Customer_Q52 (id, name, referee_id) VALUES (2, 'Jane', NULL);
INSERT INTO Customer_Q52 (id, name, referee_id) VALUES (3, 'Alex', 2);
INSERT INTO Customer_Q52 (id, name, referee_id) VALUES (4, 'Bill', NULL);
INSERT INTO Customer_Q52 (id, name, referee_id) VALUES (5, 'Zack', 1);
INSERT INTO Customer_Q52 (id, name, referee_id) VALUES (6, 'Mark', 2);

-- Q53: Customers & Orders Tables
INSERT INTO Customers_Q53 (id, name) VALUES (1, 'Joe');
INSERT INTO Customers_Q53 (id, name) VALUES (2, 'Henry');
INSERT INTO Customers_Q53 (id, name) VALUES (3, 'Sam');
INSERT INTO Customers_Q53 (id, name) VALUES (4, 'Max');

INSERT INTO Orders_Q53 (id, customerId) VALUES (1, 3);
INSERT INTO Orders_Q53 (id, customerId) VALUES (2, 1);

-- Q54: Employee Table
INSERT INTO Employee_Q54 (employee_id, team_id) VALUES (1, 8);
INSERT INTO Employee_Q54 (employee_id, team_id) VALUES (2, 8);
INSERT INTO Employee_Q54 (employee_id, team_id) VALUES (3, 8);
INSERT INTO Employee_Q54 (employee_id, team_id) VALUES (4, 7);
INSERT INTO Employee_Q54 (employee_id, team_id) VALUES (5, 9);
INSERT INTO Employee_Q54 (employee_id, team_id) VALUES (6, 9);

-- Q55: Person, Country, Calls Tables
INSERT INTO Person_Q55 (id, name, phone_number) VALUES (3, 'Jonathan', '051-1234567');
INSERT INTO Person_Q55 (id, name, phone_number) VALUES (12, 'Elvis', '051-7654321');
INSERT INTO Person_Q55 (id, name, phone_number) VALUES (1, 'Moncef', '212-1234567');
INSERT INTO Person_Q55 (id, name, phone_number) VALUES (2, 'Maroua', '212-6523651');
INSERT INTO Person_Q55 (id, name, phone_number) VALUES (7, 'Meir', '972-1234567');
INSERT INTO Person_Q55 (id, name, phone_number) VALUES (9, 'Rachel', '972-0011100');

INSERT INTO Country_Q55 (name, country_code) VALUES ('Peru', '051');
INSERT INTO Country_Q55 (name, country_code) VALUES ('Israel', '972');
INSERT INTO Country_Q55 (name, country_code) VALUES ('Morocco', '212');
INSERT INTO Country_Q55 (name, country_code) VALUES ('Germany', '049');
INSERT INTO Country_Q55 (name, country_code) VALUES ('Ethiopia', '251');

INSERT INTO Calls_Q55 (caller_id, callee_id, duration) VALUES (1, 9, 33);
INSERT INTO Calls_Q55 (caller_id, callee_id, duration) VALUES (2, 9, 4);
INSERT INTO Calls_Q55 (caller_id, callee_id, duration) VALUES (1, 2, 59);
INSERT INTO Calls_Q55 (caller_id, callee_id, duration) VALUES (3, 12, 102);
INSERT INTO Calls_Q55 (caller_id, callee_id, duration) VALUES (3, 12, 330);
INSERT INTO Calls_Q55 (caller_id, callee_id, duration) VALUES (12, 3, 5);
INSERT INTO Calls_Q55 (caller_id, callee_id, duration) VALUES (7, 9, 13);
INSERT INTO Calls_Q55 (caller_id, callee_id, duration) VALUES (7, 1, 3);
INSERT INTO Calls_Q55 (caller_id, callee_id, duration) VALUES (9, 7, 1);
INSERT INTO Calls_Q55 (caller_id, callee_id, duration) VALUES (1, 7, 7);

-- Q56: Activity Table
INSERT INTO Activity_Q56 (player_id, device_id, event_date, games_played) VALUES (1, 2, TO_DATE('2016-03-01', 'YYYY-MM-DD'), 5);
INSERT INTO Activity_Q56 (player_id, device_id, event_date, games_played) VALUES (1, 2, TO_DATE('2016-05-02', 'YYYY-MM-DD'), 6);
INSERT INTO Activity_Q56 (player_id, device_id, event_date, games_played) VALUES (2, 3, TO_DATE('2017-06-25', 'YYYY-MM-DD'), 1);
INSERT INTO Activity_Q56 (player_id, device_id, event_date, games_played) VALUES (3, 1, TO_DATE('2016-03-02', 'YYYY-MM-DD'), 0);
INSERT INTO Activity_Q56 (player_id, device_id, event_date, games_played) VALUES (3, 4, TO_DATE('2018-07-03', 'YYYY-MM-DD'), 5);

-- Q57: Orders Table
INSERT INTO Orders_Q57 (order_number, customer_number) VALUES (1, 1);
INSERT INTO Orders_Q57 (order_number, customer_number) VALUES (2, 2);
INSERT INTO Orders_Q57 (order_number, customer_number) VALUES (3, 3);
INSERT INTO Orders_Q57 (order_number, customer_number) VALUES (4, 3);

-- Q58: Cinema Table
INSERT INTO Cinema_Q58 (free) VALUES (1);
INSERT INTO Cinema_Q58 (free) VALUES (0);
INSERT INTO Cinema_Q58 (free) VALUES (1);
INSERT INTO Cinema_Q58 (free) VALUES (1);
INSERT INTO Cinema_Q58 (free) VALUES (1);

-- Q59: SalesPerson, Company, Orders Tables
INSERT INTO SalesPerson_Q59 (sales_id, name, salary, commission_rate, hire_date) VALUES (1, 'John', 100000, 6, TO_DATE('2006-04-01', 'YYYY-MM-DD'));
INSERT INTO SalesPerson_Q59 (sales_id, name, salary, commission_rate, hire_date) VALUES (2, 'Amy', 12000, 5, TO_DATE('2010-05-01', 'YYYY-MM-DD'));
INSERT INTO SalesPerson_Q59 (sales_id, name, salary, commission_rate, hire_date) VALUES (3, 'Mark', 65000, 12, TO_DATE('2008-12-25', 'YYYY-MM-DD'));
INSERT INTO SalesPerson_Q59 (sales_id, name, salary, commission_rate, hire_date) VALUES (4, 'Pam', 25000, 25, TO_DATE('2005-01-01', 'YYYY-MM-DD'));
INSERT INTO SalesPerson_Q59 (sales_id, name, salary, commission_rate, hire_date) VALUES (5, 'Alex', 5000, 10, TO_DATE('2007-02-03', 'YYYY-MM-DD'));

INSERT INTO Company_Q59 (com_id, name, city) VALUES (1, 'RED', 'Boston');
INSERT INTO Company_Q59 (com_id, name, city) VALUES (2, 'ORANGE', 'New York');
INSERT INTO Company_Q59 (com_id, name, city) VALUES (3, 'YELLOW', 'Boston');
INSERT INTO Company_Q59 (com_id, name, city) VALUES (4, 'GREEN', 'Austin');

INSERT INTO Orders_Q59 (order_id, order_date, com_id, sales_id, amount) VALUES (1, TO_DATE('2014-01-01', 'YYYY-MM-DD'), 3, 4, 10000);
INSERT INTO Orders_Q59 (order_id, order_date, com_id, sales_id, amount) VALUES (2, TO_DATE('2014-02-01', 'YYYY-MM-DD'), 4, 5, 5000);
INSERT INTO Orders_Q59 (order_id, order_date, com_id, sales_id, amount) VALUES (3, TO_DATE('2014-03-01', 'YYYY-MM-DD'), 1, 1, 50000);
INSERT INTO Orders_Q59 (order_id, order_date, com_id, sales_id, amount) VALUES (4, TO_DATE('2014-04-01', 'YYYY-MM-DD'), 1, 4, 25000);

-- Q60: Triangle Table
INSERT INTO Triangle_Q60 (x, y, z) VALUES (13, 15, 30);
INSERT INTO Triangle_Q60 (x, y, z) VALUES (10, 20, 15);

-- Q61: Point Table
INSERT INTO Point_Q61 (x) VALUES (-1);
INSERT INTO Point_Q61 (x) VALUES (0);
INSERT INTO Point_Q61 (x) VALUES (2);

-- Q62: ActorDirector Table
INSERT INTO ActorDirector_Q62 (actor_id, director_id, timestamp) VALUES (1, 1, 0);
INSERT INTO ActorDirector_Q62 (actor_id, director_id, timestamp) VALUES (1, 1, 1);
INSERT INTO ActorDirector_Q62 (actor_id, director_id, timestamp) VALUES (1, 1, 2);
INSERT INTO ActorDirector_Q62 (actor_id, director_id, timestamp) VALUES (1, 2, 3);
INSERT INTO ActorDirector_Q62 (actor_id, director_id, timestamp) VALUES (1, 2, 4);
INSERT INTO ActorDirector_Q62 (actor_id, director_id, timestamp) VALUES (2, 1, 5);
INSERT INTO ActorDirector_Q62 (actor_id, director_id, timestamp) VALUES (2, 1, 6);

-- Q63: Product, Sales Tables
INSERT INTO Product_Q63 (product_id, product_name) VALUES (100, 'Nokia');
INSERT INTO Product_Q63 (product_id, product_name) VALUES (200, 'Apple');
INSERT INTO Product_Q63 (product_id, product_name) VALUES (300, 'Samsung');

INSERT INTO Sales_Q63 (sale_id, product_id, year, quantity, price) VALUES (1, 100, 2008, 10, 5000);
INSERT INTO Sales_Q63 (sale_id, product_id, year, quantity, price) VALUES (2, 100, 2009, 12, 5000);
INSERT INTO Sales_Q63 (sale_id, product_id, year, quantity, price) VALUES (7, 200, 2011, 15, 9000);

-- Q64: Employee, Project Tables
INSERT INTO Employee_Q64 (employee_id, name, experience_years) VALUES (1, 'Khaled', 3);
INSERT INTO Employee_Q64 (employee_id, name, experience_years) VALUES (2, 'Ali', 2);
INSERT INTO Employee_Q64 (employee_id, name, experience_years) VALUES (3, 'John', 1);
INSERT INTO Employee_Q64 (employee_id, name, experience_years) VALUES (4, 'Doe', 2);

INSERT INTO Project_Q64 (project_id, employee_id) VALUES (1, 1);
INSERT INTO Project_Q64 (project_id, employee_id) VALUES (1, 2);
INSERT INTO Project_Q64 (project_id, employee_id) VALUES (1, 3);
INSERT INTO Project_Q64 (project_id, employee_id) VALUES (2, 1);
INSERT INTO Project_Q64 (project_id, employee_id) VALUES (2, 4);

-- Q65: Product, Sales Tables
INSERT INTO Product_Q65 (product_id, product_name, unit_price) VALUES (1, 'S8', 1000);
INSERT INTO Product_Q65 (product_id, product_name, unit_price) VALUES (2, 'G4', 800);
INSERT INTO Product_Q65 (product_id, product_name, unit_price) VALUES (3, 'iPhone', 1400);

INSERT INTO Sales_Q65 (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES (1, 1, 1, TO_DATE('2019-01-21', 'YYYY-MM-DD'), 2, 2000);
INSERT INTO Sales_Q65 (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES (1, 2, 2, TO_DATE('2019-02-17', 'YYYY-MM-DD'), 1, 800);
INSERT INTO Sales_Q65 (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES (2, 2, 3, TO_DATE('2019-06-02', 'YYYY-MM-DD'), 1, 800);
INSERT INTO Sales_Q65 (seller_id, product_id, buyer_id, sale_date, quantity, price) VALUES (3, 3, 4, TO_DATE('2019-05-13', 'YYYY-MM-DD'), 2, 2800);

-- Q67: Customer Table
INSERT INTO Customer_Q67 (customer_id, name, visited_on, amount) VALUES (1, 'Jhon', TO_DATE('2019-01-01', 'YYYY-MM-DD'), 100);
INSERT INTO Customer_Q67 (customer_id, name, visited_on, amount) VALUES (2, 'Daniel', TO_DATE('2019-01-02', 'YYYY-MM-DD'), 110);
INSERT INTO Customer_Q67 (customer_id, name, visited_on, amount) VALUES (3, 'Jade', TO_DATE('2019-01-03', 'YYYY-MM-DD'), 120);
INSERT INTO Customer_Q67 (customer_id, name, visited_on, amount) VALUES (4, 'Khaled', TO_DATE('2019-01-04', 'YYYY-MM-DD'), 130);
INSERT INTO Customer_Q67 (customer_id, name, visited_on, amount) VALUES (5, 'Winston', TO_DATE('2019-01-05', 'YYYY-MM-DD'), 110);
INSERT INTO Customer_Q67 (customer_id, name, visited_on, amount) VALUES (6, 'Elvis', TO_DATE('2019-01-06', 'YYYY-MM-DD'), 140);
INSERT INTO Customer_Q67 (customer_id, name, visited_on, amount) VALUES (7, 'Anna', TO_DATE('2019-01-07', 'YYYY-MM-DD'), 150);
INSERT INTO Customer_Q67 (customer_id, name, visited_on, amount) VALUES (8, 'Maria', TO_DATE('2019-01-08', 'YYYY-MM-DD'), 80);
INSERT INTO Customer_Q67 (customer_id, name, visited_on, amount) VALUES (9, 'Jaze', TO_DATE('2019-01-09', 'YYYY-MM-DD'), 110);
INSERT INTO Customer_Q67 (customer_id, name, visited_on, amount) VALUES (1, 'Jhon', TO_DATE('2019-01-10', 'YYYY-MM-DD'), 130);
INSERT INTO Customer_Q67 (customer_id, name, visited_on, amount) VALUES (3, 'Jade', TO_DATE('2019-01-10', 'YYYY-MM-DD'), 150);

-- Q68: Scores Table
INSERT INTO Scores_Q68 (player_name, gender, day, score_points) VALUES ('Aron', 'F', TO_DATE('2020-01-01', 'YYYY-MM-DD'), 17);
INSERT INTO Scores_Q68 (player_name, gender, day, score_points) VALUES ('Alice', 'F', TO_DATE('2020-01-07', 'YYYY-MM-DD'), 23);
INSERT INTO Scores_Q68 (player_name, gender, day, score_points) VALUES ('Bajrang', 'M', TO_DATE('2020-01-07', 'YYYY-MM-DD'), 7);
INSERT INTO Scores_Q68 (player_name, gender, day, score_points) VALUES ('Khali', 'M', TO_DATE('2019-12-25', 'YYYY-MM-DD'), 11);
INSERT INTO Scores_Q68 (player_name, gender, day, score_points) VALUES ('Slaman', 'M', TO_DATE('2019-12-30', 'YYYY-MM-DD'), 13);
INSERT INTO Scores_Q68 (player_name, gender, day, score_points) VALUES ('Joe', 'M', TO_DATE('2019-12-31', 'YYYY-MM-DD'), 3);
INSERT INTO Scores_Q68 (player_name, gender, day, score_points) VALUES ('Jose', 'M', TO_DATE('2019-12-18', 'YYYY-MM-DD'), 2);
INSERT INTO Scores_Q68 (player_name, gender, day, score_points) VALUES ('Priya', 'F', TO_DATE('2019-12-31', 'YYYY-MM-DD'), 23);
INSERT INTO Scores_Q68 (player_name, gender, day, score_points) VALUES ('Priyanka', 'F', TO_DATE('2019-12-30', 'YYYY-MM-DD'), 17);

-- Q69: Logs Table
INSERT INTO Logs_Q69 (log_id) VALUES (1);
INSERT INTO Logs_Q69 (log_id) VALUES (2);
INSERT INTO Logs_Q69 (log_id) VALUES (3);
INSERT INTO Logs_Q69 (log_id) VALUES (7);
INSERT INTO Logs_Q69 (log_id) VALUES (8);
INSERT INTO Logs_Q69 (log_id) VALUES (10);

-- Q70: Students, Subjects, Examinations Tables
INSERT INTO Students_Q70 (student_id, student_name) VALUES (1, 'Alice');
INSERT INTO Students_Q70 (student_id, student_name) VALUES (2, 'Bob');
INSERT INTO Students_Q70 (student_id, student_name) VALUES (13, 'John');
INSERT INTO Students_Q70 (student_id, student_name) VALUES (6, 'Alex');

INSERT INTO Subjects_Q70 (subject_name) VALUES ('Math');
INSERT INTO Subjects_Q70 (subject_name) VALUES ('Physics');
INSERT INTO Subjects_Q70 (subject_name) VALUES ('Programming');

INSERT INTO Examinations_Q70 (student_id, subject_name) VALUES (1, 'Math');
INSERT INTO Examinations_Q70 (student_id, subject_name) VALUES (1, 'Physics');
INSERT INTO Examinations_Q70 (student_id, subject_name) VALUES (1, 'Programming');
INSERT INTO Examinations_Q70 (student_id, subject_name) VALUES (2, 'Programming');
INSERT INTO Examinations_Q70 (student_id, subject_name) VALUES (1, 'Physics');
INSERT INTO Examinations_Q70 (student_id, subject_name) VALUES (1, 'Math');
INSERT INTO Examinations_Q70 (student_id, subject_name) VALUES (13, 'Math');
INSERT INTO Examinations_Q70 (student_id, subject_name) VALUES (13, 'Programming');
INSERT INTO Examinations_Q70 (student_id, subject_name) VALUES (13, 'Physics');
INSERT INTO Examinations_Q70 (student_id, subject_name) VALUES (2, 'Math');
INSERT INTO Examinations_Q70 (student_id, subject_name) VALUES (1, 'Math');

-- Q71: Employees Table
INSERT INTO Employees_Q71 (employee_id, employee_name, manager_id) VALUES (1, 'Boss', 1);
INSERT INTO Employees_Q71 (employee_id, employee_name, manager_id) VALUES (3, 'Alice', 3);
INSERT INTO Employees_Q71 (employee_id, employee_name, manager_id) VALUES (2, 'Bob', 1);
INSERT INTO Employees_Q71 (employee_id, employee_name, manager_id) VALUES (4, 'Daniel', 2);
INSERT INTO Employees_Q71 (employee_id, employee_name, manager_id) VALUES (7, 'Luis', 4);
INSERT INTO Employees_Q71 (employee_id, employee_name, manager_id) VALUES (8, 'Jhon', 3);
INSERT INTO Employees_Q71 (employee_id, employee_name, manager_id) VALUES (9, 'Angela', 8);
INSERT INTO Employees_Q71 (employee_id, employee_name, manager_id) VALUES (77, 'Robert', 1);

-- Q72: Transactions Table
INSERT INTO Transactions_Q72 (id, country, state, amount, trans_date) VALUES (121, 'US', 'approved', 1000, TO_DATE('2018-12-18', 'YYYY-MM-DD'));
INSERT INTO Transactions_Q72 (id, country, state, amount, trans_date) VALUES (122, 'US', 'declined', 2000, TO_DATE('2018-12-19', 'YYYY-MM-DD'));
INSERT INTO Transactions_Q72 (id, country, state, amount, trans_date) VALUES (123, 'US', 'approved', 2000, TO_DATE('2019-01-01', 'YYYY-MM-DD'));
INSERT INTO Transactions_Q72 (id, country, state, amount, trans_date) VALUES (124, 'DE', 'approved', 2000, TO_DATE('2019-01-07', 'YYYY-MM-DD'));

-- Q73: Actions, Removals Tables
INSERT INTO Actions_Q73 (user_id, post_id, action_date, action, extra) VALUES (1, 1, TO_DATE('2019-07-01', 'YYYY-MM-DD'), 'view', NULL);
INSERT INTO Actions_Q73 (user_id, post_id, action_date, action, extra) VALUES (1, 1, TO_DATE('2019-07-01', 'YYYY-MM-DD'), 'like', NULL);
INSERT INTO Actions_Q73 (user_id, post_id, action_date, action, extra) VALUES (1, 1, TO_DATE('2019-07-01', 'YYYY-MM-DD'), 'share', NULL);
INSERT INTO Actions_Q73 (user_id, post_id, action_date, action, extra) VALUES (2, 2, TO_DATE('2019-07-04', 'YYYY-MM-DD'), 'view', NULL);
INSERT INTO Actions_Q73 (user_id, post_id, action_date, action, extra) VALUES (2, 2, TO_DATE('2019-07-04', 'YYYY-MM-DD'), 'report', 'spam');
INSERT INTO Actions_Q73 (user_id, post_id, action_date, action, extra) VALUES (3, 4, TO_DATE('2019-07-04', 'YYYY-MM-DD'), 'view', NULL);
INSERT INTO Actions_Q73 (user_id, post_id, action_date, action, extra) VALUES (3, 4, TO_DATE('2019-07-04', 'YYYY-MM-DD'), 'report', 'spam');
INSERT INTO Actions_Q73 (user_id, post_id, action_date, action, extra) VALUES (4, 3, TO_DATE('2019-07-02', 'YYYY-MM-DD'), 'view', NULL);
INSERT INTO Actions_Q73 (user_id, post_id, action_date, action, extra) VALUES (4, 3, TO_DATE('2019-07-02', 'YYYY-MM-DD'), 'report', 'spam');
INSERT INTO Actions_Q73 (user_id, post_id, action_date, action, extra) VALUES (5, 2, TO_DATE('2019-07-03', 'YYYY-MM-DD'), 'view', NULL);
INSERT INTO Actions_Q73 (user_id, post_id, action_date, action, extra) VALUES (5, 2, TO_DATE('2019-07-03', 'YYYY-MM-DD'), 'report', 'racism');
INSERT INTO Actions_Q73 (user_id, post_id, action_date, action, extra) VALUES (5, 5, TO_DATE('2019-07-03', 'YYYY-MM-DD'), 'view', NULL);
INSERT INTO Actions_Q73 (user_id, post_id, action_date, action, extra) VALUES (5, 5, TO_DATE('2019-07-03', 'YYYY-MM-DD'), 'report', 'racism');

INSERT INTO Removals_Q73 (post_id, remove_date) VALUES (2, TO_DATE('2019-07-20', 'YYYY-MM-DD'));
INSERT INTO Removals_Q73 (post_id, remove_date) VALUES (3, TO_DATE('2019-07-18', 'YYYY-MM-DD'));

-- Q76: Salaries Table
INSERT INTO Salaries_Q76 (company_id, employee_id, employee_name, salary) VALUES (1, 1, 'Tony', 2000);
INSERT INTO Salaries_Q76 (company_id, employee_id, employee_name, salary) VALUES (1, 2, 'Pronub', 21300);
INSERT INTO Salaries_Q76 (company_id, employee_id, employee_name, salary) VALUES (1, 3, 'Tyrrox', 10800);
INSERT INTO Salaries_Q76 (company_id, employee_id, employee_name, salary) VALUES (2, 1, 'Pam', 300);
INSERT INTO Salaries_Q76 (company_id, employee_id, employee_name, salary) VALUES (2, 7, 'Bassem', 450);
INSERT INTO Salaries_Q76 (company_id, employee_id, employee_name, salary) VALUES (2, 9, 'Hermione', 700);
INSERT INTO Salaries_Q76 (company_id, employee_id, employee_name, salary) VALUES (3, 7, 'Bocaben', 100);
INSERT INTO Salaries_Q76 (company_id, employee_id, employee_name, salary) VALUES (3, 2, 'Ognjen', 2200);
INSERT INTO Salaries_Q76 (company_id, employee_id, employee_name, salary) VALUES (3, 13, 'Nyan Cat', 3300);
INSERT INTO Salaries_Q76 (company_id, employee_id, employee_name, salary) VALUES (3, 15, 'Morning Cat', 7777);

-- Q77: Variables, Expressions Tables
INSERT INTO Variables_Q77 (name, value) VALUES ('x', 66);
INSERT INTO Variables_Q77 (name, value) VALUES ('y', 77);

INSERT INTO Expressions_Q77 (left_operand, operator, right_operand) VALUES ('x', '>', 'y');
INSERT INTO Expressions_Q77 (left_operand, operator, right_operand) VALUES ('x', '<', 'y');
INSERT INTO Expressions_Q77 (left_operand, operator, right_operand) VALUES ('x', '=', 'y');
INSERT INTO Expressions_Q77 (left_operand, operator, right_operand) VALUES ('y', '>', 'x');
INSERT INTO Expressions_Q77 (left_operand, operator, right_operand) VALUES ('y', '<', 'x');
INSERT INTO Expressions_Q77 (left_operand, operator, right_operand) VALUES ('x', '=', 'x');

-- Q79: Employee Table
INSERT INTO Employee_Q79 (employee_id, name, months, salary) VALUES (12228, 'Rose', 15, 1968);
INSERT INTO Employee_Q79 (employee_id, name, months, salary) VALUES (33645, 'Angela', 1, 3443);
INSERT INTO Employee_Q79 (employee_id, name, months, salary) VALUES (45692, 'Frank', 17, 1608);
INSERT INTO Employee_Q79 (employee_id, name, months, salary) VALUES (56118, 'Patrick', 7, 1345);
INSERT INTO Employee_Q79 (employee_id, name, months, salary) VALUES (59725, 'Lisa', 11, 2330);
INSERT INTO Employee_Q79 (employee_id, name, months, salary) VALUES (74197, 'Kimberly', 16, 4372);
INSERT INTO Employee_Q79 (employee_id, name, months, salary) VALUES (78454, 'Bonnie', 8, 1771);
INSERT INTO Employee_Q79 (employee_id, name, months, salary) VALUES (83565, 'Michael', 6, 2017);
INSERT INTO Employee_Q79 (employee_id, name, months, salary) VALUES (98607, 'Todd', 5, 3396);
INSERT INTO Employee_Q79 (employee_id, name, months, salary) VALUES (99989, 'Joe', 9, 3573);

-- Q80: user_transactions Table
INSERT INTO user_transactions_Q80 (transaction_id, product_id, spend, transaction_date) VALUES (1341, 123424, 1500.60, TO_TIMESTAMP('2019-12-31 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO user_transactions_Q80 (transaction_id, product_id, spend, transaction_date) VALUES (1423, 123424, 1000.20, TO_TIMESTAMP('2020-12-31 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO user_transactions_Q80 (transaction_id, product_id, spend, transaction_date) VALUES (1623, 123424, 1246.44, TO_TIMESTAMP('2021-12-31 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO user_transactions_Q80 (transaction_id, product_id, spend, transaction_date) VALUES (1322, 123424, 2145.32, TO_TIMESTAMP('2022-12-31 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Q81: inventory Table
INSERT INTO inventory_Q81 (item_id, item_type, item_category, square_footage) VALUES (1374, 'prime_eligible', 'mini refrigerator', 68.00);
INSERT INTO inventory_Q81 (item_id, item_type, item_category, square_footage) VALUES (4245, 'not_prime', 'standing lamp', 26.40);
INSERT INTO inventory_Q81 (item_id, item_type, item_category, square_footage) VALUES (2452, 'prime_eligible', 'television', 85.00);
INSERT INTO inventory_Q81 (item_id, item_type, item_category, square_footage) VALUES (3255, 'not_prime', 'side table', 22.60);
INSERT INTO inventory_Q81 (item_id, item_type, item_category, square_footage) VALUES (1672, 'prime_eligible', 'laptop', 8.50);

-- Q82: user_actions Table
INSERT INTO user_actions_Q82 (user_id, event_id, event_type, event_date) VALUES (445, 7765, 'sign-in', TO_TIMESTAMP('2022-05-31 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO user_actions_Q82 (user_id, event_id, event_type, event_date) VALUES (742, 6458, 'sign-in', TO_TIMESTAMP('2022-06-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO user_actions_Q82 (user_id, event_id, event_type, event_date) VALUES (445, 3634, 'like', TO_TIMESTAMP('2022-06-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO user_actions_Q82 (user_id, event_id, event_type, event_date) VALUES (742, 1374, 'comment', TO_TIMESTAMP('2022-06-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO user_actions_Q82 (user_id, event_id, event_type, event_date) VALUES (648, 3124, 'like', TO_TIMESTAMP('2022-06-18 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Q83: search_frequency Table
INSERT INTO search_frequency_Q83 (searches, num_users) VALUES (1, 2);
INSERT INTO search_frequency_Q83 (searches, num_users) VALUES (2, 2);
INSERT INTO search_frequency_Q83 (searches, num_users) VALUES (3, 3);
INSERT INTO search_frequency_Q83 (searches, num_users) VALUES (4, 1);

-- Q84: advertiser, daily_pay Tables
INSERT INTO advertiser_Q84 (user_id, status) VALUES ('bing', 'NEW');
INSERT INTO advertiser_Q84 (user_id, status) VALUES ('yahoo', 'NEW');
INSERT INTO advertiser_Q84 (user_id, status) VALUES ('alibaba', 'EXISTING');

INSERT INTO daily_pay_Q84 (user_id, paid) VALUES ('yahoo', 45.00);
INSERT INTO daily_pay_Q84 (user_id, paid) VALUES ('alibaba', 100.00);

-- Q85: server_utilization Table
INSERT INTO server_utilization_Q85 (server_id, status_time, session_status) VALUES (1, TO_TIMESTAMP('2022-08-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'start');
INSERT INTO server_utilization_Q85 (server_id, status_time, session_status) VALUES (1, TO_TIMESTAMP('2022-08-04 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'stop');
INSERT INTO server_utilization_Q85 (server_id, status_time, session_status) VALUES (2, TO_TIMESTAMP('2022-08-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'start');
INSERT INTO server_utilization_Q85 (server_id, status_time, session_status) VALUES (2, TO_TIMESTAMP('2022-08-24 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'stop');

-- Q86: transactions Table
INSERT INTO transactions_Q86 (transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp) VALUES (1, 101, 1, 100, TO_TIMESTAMP('2022-09-25 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO transactions_Q86 (transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp) VALUES (2, 101, 1, 100, TO_TIMESTAMP('2022-09-25 12:08:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO transactions_Q86 (transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp) VALUES (3, 101, 1, 100, TO_TIMESTAMP('2022-09-25 12:28:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO transactions_Q86 (transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp) VALUES (4, 102, 2, 300, TO_TIMESTAMP('2022-09-25 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO transactions_Q86 (transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp) VALUES (6, 102, 2, 400, TO_TIMESTAMP('2022-09-25 14:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Q87: customers, trips, orders Tables
INSERT INTO customers_Q87 (customer_id, signup_timestamp) VALUES (8472, TO_TIMESTAMP('2022-05-30 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO customers_Q87 (customer_id, signup_timestamp) VALUES (2341, TO_TIMESTAMP('2022-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO customers_Q87 (customer_id, signup_timestamp) VALUES (1314, TO_TIMESTAMP('2022-06-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO customers_Q87 (customer_id, signup_timestamp) VALUES (1435, TO_TIMESTAMP('2022-06-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO customers_Q87 (customer_id, signup_timestamp) VALUES (5421, TO_TIMESTAMP('2022-06-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO trips_Q87 (dasher_id, trip_id, estimated_delivery_timestamp, actual_delivery_timestamp) VALUES (101, 100463, TO_TIMESTAMP('2022-06-05 09:42:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-05 09:38:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO trips_Q87 (dasher_id, trip_id, estimated_delivery_timestamp, actual_delivery_timestamp) VALUES (102, 100482, TO_TIMESTAMP('2022-06-05 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-05 15:46:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO trips_Q87 (dasher_id, trip_id, estimated_delivery_timestamp, actual_delivery_timestamp) VALUES (101, 100362, TO_TIMESTAMP('2022-06-07 15:33:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-07 16:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO trips_Q87 (dasher_id, trip_id, estimated_delivery_timestamp, actual_delivery_timestamp) VALUES (102, 100657, TO_TIMESTAMP('2022-07-07 15:52:00', 'YYYY-MM-DD HH24:MI:SS'), NULL);
INSERT INTO trips_Q87 (dasher_id, trip_id, estimated_delivery_timestamp, actual_delivery_timestamp) VALUES (103, 100213, TO_TIMESTAMP('2022-06-12 14:13:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-12 14:10:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO orders_Q87 (order_id, customer_id, trip_id, status, order_timestamp) VALUES (727424, 8472, 100463, 'completed successfully', TO_TIMESTAMP('2022-06-05 09:12:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders_Q87 (order_id, customer_id, trip_id, status, order_timestamp) VALUES (242513, 2341, 100482, 'completed incorrectly', TO_TIMESTAMP('2022-06-05 14:40:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders_Q87 (order_id, customer_id, trip_id, status, order_timestamp) VALUES (141367, 1314, 100362, 'completed incorrectly', TO_TIMESTAMP('2022-06-07 15:03:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders_Q87 (order_id, customer_id, trip_id, status, order_timestamp) VALUES (582193, 5421, 100657, 'never_received', TO_TIMESTAMP('2022-07-07 15:22:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO orders_Q87 (order_id, customer_id, trip_id, status, order_timestamp) VALUES (253613, 1314, 100213, 'completed successfully', TO_TIMESTAMP('2022-06-12 13:43:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Q90: Numbers Table
INSERT INTO Numbers_Q90 (num, frequency) VALUES (0, 7);
INSERT INTO Numbers_Q90 (num, frequency) VALUES (1, 1);
INSERT INTO Numbers_Q90 (num, frequency) VALUES (2, 3);
INSERT INTO Numbers_Q90 (num, frequency) VALUES (3, 1);

-- Q91: Employee, Salary Tables
INSERT INTO Employee_Q91 (employee_id, department_id) VALUES (1, 1);
INSERT INTO Employee_Q91 (employee_id, department_id) VALUES (2, 2);
INSERT INTO Employee_Q91 (employee_id, department_id) VALUES (3, 2);

INSERT INTO Salary_Q91 (id, employee_id, amount, pay_date) VALUES (1, 1, 9000, TO_DATE('2017-03-31', 'YYYY-MM-DD'));
INSERT INTO Salary_Q91 (id, employee_id, amount, pay_date) VALUES (2, 2, 6000, TO_DATE('2017-03-31', 'YYYY-MM-DD'));
INSERT INTO Salary_Q91 (id, employee_id, amount, pay_date) VALUES (3, 3, 10000, TO_DATE('2017-03-31', 'YYYY-MM-DD'));
INSERT INTO Salary_Q91 (id, employee_id, amount, pay_date) VALUES (4, 1, 7000, TO_DATE('2017-02-28', 'YYYY-MM-DD'));
INSERT INTO Salary_Q91 (id, employee_id, amount, pay_date) VALUES (5, 2, 6000, TO_DATE('2017-02-28', 'YYYY-MM-DD'));
INSERT INTO Salary_Q91 (id, employee_id, amount, pay_date) VALUES (6, 3, 8000, TO_DATE('2017-02-28', 'YYYY-MM-DD'));

-- Q93: Players, Matches Tables
INSERT INTO Players_Q93 (player_id, group_id) VALUES (15, 1);
INSERT INTO Players_Q93 (player_id, group_id) VALUES (25, 1);
INSERT INTO Players_Q93 (player_id, group_id) VALUES (30, 1);
INSERT INTO Players_Q93 (player_id, group_id) VALUES (45, 1);
INSERT INTO Players_Q93 (player_id, group_id) VALUES (10, 2);
INSERT INTO Players_Q93 (player_id, group_id) VALUES (35, 2);
INSERT INTO Players_Q93 (player_id, group_id) VALUES (50, 2);
INSERT INTO Players_Q93 (player_id, group_id) VALUES (20, 3);
INSERT INTO Players_Q93 (player_id, group_id) VALUES (40, 3);

INSERT INTO Matches_Q93 (match_id, first_player, second_player, first_score, second_score) VALUES (1, 15, 45, 3, 0);
INSERT INTO Matches_Q93 (match_id, first_player, second_player, first_score, second_score) VALUES (2, 30, 25, 1, 2);
INSERT INTO Matches_Q93 (match_id, first_player, second_player, first_score, second_score) VALUES (3, 30, 15, 2, 0);
INSERT INTO Matches_Q93 (match_id, first_player, second_player, first_score, second_score) VALUES (4, 40, 20, 5, 2);
INSERT INTO Matches_Q93 (match_id, first_player, second_player, first_score, second_score) VALUES (5, 35, 50, 1, 1);

-- Q94: Student, Exam Tables
INSERT INTO Student_Q94 (student_id, student_name) VALUES (1, 'Daniel');
INSERT INTO Student_Q94 (student_id, student_name) VALUES (2, 'Jade');
INSERT INTO Student_Q94 (student_id, student_name) VALUES (3, 'Stella');
INSERT INTO Student_Q94 (student_id, student_name) VALUES (4, 'Jonathan');
INSERT INTO Student_Q94 (student_id, student_name) VALUES (5, 'Will');

INSERT INTO Exam_Q94 (exam_id, student_id, score) VALUES (10, 1, 70);
INSERT INTO Exam_Q94 (exam_id, student_id, score) VALUES (10, 2, 80);
INSERT INTO Exam_Q94 (exam_id, student_id, score) VALUES (10, 3, 90);
INSERT INTO Exam_Q94 (exam_id, student_id, score) VALUES (20, 1, 80);
INSERT INTO Exam_Q94 (exam_id, student_id, score) VALUES (30, 1, 70);
INSERT INTO Exam_Q94 (exam_id, student_id, score) VALUES (30, 3, 80);
INSERT INTO Exam_Q94 (exam_id, student_id, score) VALUES (30, 4, 90);
INSERT INTO Exam_Q94 (exam_id, student_id, score) VALUES (40, 1, 60);
INSERT INTO Exam_Q94 (exam_id, student_id, score) VALUES (40, 2, 70);
INSERT INTO Exam_Q94 (exam_id, student_id, score) VALUES (40, 4, 80);

-- Q96: songs_history, songs_weekly Tables
INSERT INTO songs_history_Q96 (history_id, user_id, song_id, song_plays) VALUES (10011, 777, 1238, 11);
INSERT INTO songs_history_Q96 (history_id, user_id, song_id, song_plays) VALUES (12452, 695, 4520, 1);

INSERT INTO songs_weekly_Q96 (user_id, song_id, listen_time) VALUES (777, 1238, TO_TIMESTAMP('2022-08-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO songs_weekly_Q96 (user_id, song_id, listen_time) VALUES (695, 4520, TO_TIMESTAMP('2022-08-04 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO songs_weekly_Q96 (user_id, song_id, listen_time) VALUES (125, 9630, TO_TIMESTAMP('2022-08-04 16:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO songs_weekly_Q96 (user_id, song_id, listen_time) VALUES (695, 9852, TO_TIMESTAMP('2022-08-07 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Q97: emails, texts Tables
INSERT INTO emails_Q97 (email_id, user_id, signup_date) VALUES (125, 7771, TO_TIMESTAMP('2022-06-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO emails_Q97 (email_id, user_id, signup_date) VALUES (236, 6950, TO_TIMESTAMP('2022-07-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO emails_Q97 (email_id, user_id, signup_date) VALUES (433, 1052, TO_TIMESTAMP('2022-07-09 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO texts_Q97 (text_id, email_id, signup_action) VALUES (6878, 125, 'Confirmed');
INSERT INTO texts_Q97 (text_id, email_id, signup_action) VALUES (6920, 236, 'Not Confirmed');
INSERT INTO texts_Q97 (text_id, email_id, signup_action) VALUES (6994, 236, 'Confirmed');

-- Q98: tweets Table
INSERT INTO tweets_Q98 (tweet_id, user_id, tweet_date) VALUES (214252, 111, TO_TIMESTAMP('2022-06-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tweets_Q98 (tweet_id, user_id, tweet_date) VALUES (739252, 111, TO_TIMESTAMP('2022-06-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tweets_Q98 (tweet_id, user_id, tweet_date) VALUES (846402, 111, TO_TIMESTAMP('2022-06-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tweets_Q98 (tweet_id, user_id, tweet_date) VALUES (241425, 254, TO_TIMESTAMP('2022-06-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO tweets_Q98 (tweet_id, user_id, tweet_date) VALUES (137374, 111, TO_TIMESTAMP('2022-06-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Q99: activities, age_breakdown Tables
INSERT INTO activities_Q99 (activity_id, user_id, activity_type, time_spent, activity_date) VALUES (7274, 123, 'open', 4.50, TO_TIMESTAMP('2022-06-22 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO activities_Q99 (activity_id, user_id, activity_type, time_spent, activity_date) VALUES (2425, 123, 'send', 3.50, TO_TIMESTAMP('2022-06-22 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO activities_Q99 (activity_id, user_id, activity_type, time_spent, activity_date) VALUES (1413, 456, 'send', 5.67, TO_TIMESTAMP('2022-06-23 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO activities_Q99 (activity_id, user_id, activity_type, time_spent, activity_date) VALUES (1414, 789, 'chat', 11.00, TO_TIMESTAMP('2022-06-25 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO activities_Q99 (activity_id, user_id, activity_type, time_spent, activity_date) VALUES (2536, 456, 'open', 3.00, TO_TIMESTAMP('2022-06-25 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO age_breakdown_Q99 (user_id, age_bucket) VALUES (123, '31-35');
INSERT INTO age_breakdown_Q99 (user_id, age_bucket) VALUES (456, '26-30');
INSERT INTO age_breakdown_Q99 (user_id, age_bucket) VALUES (789, '21-25');

-- Q100: personal_profiles, company_pages, employee_company Tables
INSERT INTO personal_profiles_Q100 (profile_id, name, followers) VALUES (1, 'Nick Singh', 92000);
INSERT INTO personal_profiles_Q100 (profile_id, name, followers) VALUES (2, 'Zach Wilson', 199000);
INSERT INTO personal_profiles_Q100 (profile_id, name, followers) VALUES (3, 'Daliana Liu', 171000);
INSERT INTO personal_profiles_Q100 (profile_id, name, followers) VALUES (4, 'Ravit Jain', 107000);
INSERT INTO personal_profiles_Q100 (profile_id, name, followers) VALUES (5, 'Vin Vashishta', 139000);
INSERT INTO personal_profiles_Q100 (profile_id, name, followers) VALUES (6, 'Susan Wojcicki', 39000);

INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (1, 'The Data Science Podcast', 8000);
INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (2, 'Airbnb', 700000);
INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (3, 'The Ravit Show', 6000);
INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (4, 'DataLemur', 200);
INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (5, 'YouTube', 1600000);
INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (6, 'DataScience.Vin', 4500);
INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (9, 'Ace The Data Science Interview', 4479);

INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (1, 4);
INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (1, 9);
INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (2, 2);
INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (3, 1);
INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (4, 3);
INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (5, 6);
INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (6, 5);

-- 1. Drop existing tables if they exist
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE employee_company_Q100 CASCADE CONSTRAINTS PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE personal_profiles_Q100 CASCADE CONSTRAINTS PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE company_pages_Q100 CASCADE CONSTRAINTS PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

-- 2. Create Tables for Q100
CREATE TABLE personal_profiles_Q100 (
    profile_id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(255),
    followers NUMBER(10)
);

CREATE TABLE company_pages_Q100 (
    company_id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(255),
    followers NUMBER(10)
);

CREATE TABLE employee_company_Q100 (
    personal_profile_id NUMBER(10),
    company_id NUMBER(10),
    CONSTRAINT pk_employee_company_q100 PRIMARY KEY (personal_profile_id, company_id),
    CONSTRAINT fk_emp_comp_prof FOREIGN KEY (personal_profile_id) REFERENCES personal_profiles_Q100(profile_id),
    CONSTRAINT fk_emp_comp_page FOREIGN KEY (company_id) REFERENCES company_pages_Q100(company_id)
);

-- 3. Insert Data into personal_profiles_Q100
INSERT INTO personal_profiles_Q100 (profile_id, name, followers) VALUES (1, 'Nick Singh', 92000);
INSERT INTO personal_profiles_Q100 (profile_id, name, followers) VALUES (2, 'Zach Wilson', 199000);
INSERT INTO personal_profiles_Q100 (profile_id, name, followers) VALUES (3, 'Daliana Liu', 171000);
INSERT INTO personal_profiles_Q100 (profile_id, name, followers) VALUES (4, 'Ravit Jain', 107000);
INSERT INTO personal_profiles_Q100 (profile_id, name, followers) VALUES (5, 'Vin Vashishta', 139000);
INSERT INTO personal_profiles_Q100 (profile_id, name, followers) VALUES (6, 'Susan Wojcicki', 39000);

-- 4. Insert Data into company_pages_Q100
INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (1, 'The Data Science Podcast', 8000);
INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (2, 'Airbnb', 700000);
INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (3, 'The Ravit Show', 6000);
INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (4, 'DataLemur', 200);
INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (5, 'YouTube', 1600000);
INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (6, 'DataScience.Vin', 4500);
INSERT INTO company_pages_Q100 (company_id, name, followers) VALUES (9, 'Ace The Data Science Interview', 4479);

-- 5. Insert Data into employee_company_Q100
INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (1, 4);
INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (1, 9);
INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (2, 2);
INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (3, 1);
INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (4, 3);
INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (5, 6);
INSERT INTO employee_company_Q100 (personal_profile_id, company_id) VALUES (6, 5);

COMMIT;
