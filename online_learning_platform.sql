-- PROJECT NAME: online learning platform analysis
-- Task 1
# Create a Database for this project 
CREATE DATABASE IF NOT EXISTS online_learning_platform;
USE online_learning_platform;

# Create all three tables in MySQL with appropriate data types and relationships.
-- Learners Table
CREATE TABLE learners(learner_id INT AUTO_INCREMENT PRIMARY KEY,
full_name VARCHAR(100),
country VARCHAR(100));
DROP TABLE courses;
-- Courses Table
CREATE TABLE courses(course_id INT AUTO_INCREMENT PRIMARY KEY,
course_name VARCHAR(100),
category VARCHAR(100),
unit_price DECIMAL(10));

-- Purchases Table
CREATE TABLE purchases(purchase_id INT AUTO_INCREMENT PRIMARY KEY,
learner_id INT, 
course_id INT,
quantity INT,
purchase_date DATE DEFAULT (CURRENT_DATE),
FOREIGN KEY(learner_id) REFERENCES learners(learner_id),
FOREIGN KEY(course_id) REFERENCES courses(course_id));

#Insert sample data 
-- Inserting data into learners table
INSERT INTO learners VALUES(100,'Abinaya','India');
INSERT INTO learners(full_name,country) VALUES('Aditya','Singapore'),
('Amudha','India'),('Bhavesh','USA'),('Bharath','Canada'),('Chaitanya','India'),('David','Singapore'),('Divya','Canada'),
('Gayathri','Singapore'),('Elakiya','USA'),('Karthika','Singapore'),('Kavitha','USA'),('Lavanya','Singapore'),('Magizhini','India'),
('Madhumitha','Canada'),('Narmada','USA'),('Padma','India'),('Preethi','Canada'),('Prakash','Singapore'),('Ramya','India'),
('Rekha','USA'),('Rajesh','USA'),('Ravi','Singapore'),('Raghu','UK'),('Ravi','Canada'),('Suchithra','India'),('Sanjana','USA'),
('Saravana','USA'),('Sushmitha','UK'),('Tamilselvi','UK');

SELECT * FROM learners;

-- Inserting data into course table
INSERT INTO courses (course_name,category,unit_price) VALUES
('Python for Beginners', 'Python Development',1499),
('Intermediate Python', 'Python Development',2999),
('Advanced Python Programming', 'Python Development',4999),
('HTML & CSS Basics', 'Web Development',999),
('JavaScript Essentials', 'Web Development',2499),
('Full Stack Web Development', 'Web Development',5999),
('SQL for Beginners', 'SQL & Databases',1299),
('Advanced SQL & Optimization', 'SQL & Databases',4499),
('Power BI Fundamentals', 'Data Visualization',1999),
('Excel for Data Analysis', 'Data Analysis',1499),
('Python for Data Analysis', 'Data Analysis',3499),
('Machine Learning Basics', 'Machine Learning',3999),
('Cloud Computing Basics', 'Cloud Computing',1799);

INSERT INTO courses (course_name,category,unit_price) VALUES
('Tableau for Data Analysis', 'Data Analysis',2499);
SELECT * FROM courses;

-- inserting data into purchases table
INSERT INTO purchases VALUES (1000,100,1,2,'2026-01-03');
INSERT INTO purchases(learner_id,course_id,quantity,purchase_date) VALUES
(101,2,3,'2026-02-01'),(102,3,2,'2026-01-16'),(103,13,1,'2026-01-29'),
(104,12,2,'2026-02-27'),(110,10,3,'2026-03-04'),(105,5,2,'2026-03-14'),
(106,6,1,'2026-03-12'),(107,5,1,'2026-04-03'),(115,11,3,'2026-01-22'),
(129,4,2,'2026-01-27'),(122,2,2,'2026-02-20'),(120,5,6,'2026-03-28'),
(109,9,5,'2026-04-01');
INSERT INTO purchases(learner_id,course_id,quantity) VALUES
(108,7,3),(112,8,1),(115,2,3),(116,3,2),(125,1,4),(127,4,2),(117,12,1);
INSERT INTO purchases(learner_id,course_id,quantity) VALUES
(108,1,5);

SELECT * FROM purchases;

# Data Exploration Using Joins
-- Format currency values to 2 decimal places.
-- Use aliases for column names (e.g., AS total_revenue).
-- Sort results appropriately (e.g., highest total_spent first).

SELECT p.purchase_id Purchase_ID, l.full_name Learners_Name, l.country Learners_Country,
c.course_name Course_Name, (FORMAT((c.unit_price * p.quantity),2)) AS Total_Revenue
FROM purchases p 
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses c ON p.course_id = c.course_id
ORDER BY (c.unit_price * p.quantity) DESC;

-- INNER JOIN
# Combine learner, course, and purchase data.
SELECT p.purchase_id,l.full_name Learners_Name,l.country Learners_Country,c.course_name,c.category,FORMAT(c.unit_price,2) unit_price,p.quantity
,p.purchase_date
FROM purchases p
JOIN learners l ON p.learner_id = l.learner_id
JOIN courses c ON p.course_id = c.course_id;

#Display each learner’s purchase details (course name, category, quantity, total amount, and purchase date).

SELECT l.*,c.course_name,c.category,p.quantity,FORMAT((c.unit_price * p.quantity),2) total_amount,p.purchase_date
FROM purchases p 
RIGHT JOIN learners l ON l.learner_id = p.learner_id
LEFT JOIN courses c ON c.course_id = p.course_id;

-- Analytical Queries
-- Display each learner’s total spending (quantity × unit_price) along with their country.
SELECT l.*, FORMAT(SUM(p.quantity * c.unit_price),2) Total_Spending
FROM purchases p 
JOIN learners l ON l.learner_id = p.learner_id
JOIN courses c ON c.course_id = p.course_id
GROUP BY l.learner_id,l.full_name,l.country;


-- Find the top 3 most purchased courses based on total quantity sold.
SELECT c.course_name,SUM(p.quantity) Total_quantity_sold
FROM purchases p 
JOIN courses c ON p.course_id = c.course_id
GROUP BY p.course_id
ORDER BY Total_quantity_sold DESC
LIMIT 3;


-- Show each course category’s total revenue and the number of unique learners who purchased from that category.

SELECT c.category,FORMAT(SUM(p.quantity * c.unit_price),2) Total_Revenue,COUNT(DISTINCT(p.learner_id)) Number_of_unique_learners
FROM purchases p
JOIN courses c ON p.course_id = c.course_id
GROUP BY c.category;

-- List all learners who have purchased courses from more than one category.
WITH learners_purchased_morethanone_category AS(
SELECT l.learner_id,l.full_name learners_name,COUNT(DISTINCT(c.category)) category_count
FROM learners l
JOIN purchases p ON p.learner_id = l.learner_id
JOIN courses c ON c.course_id = p.course_id
GROUP BY learner_id,learners_name
HAVING category_count > 1)
SELECT * FROM learners_purchased_morethanone_category;

-- Identify courses that have not been purchased at all.
SELECT c.course_id,c.course_name FROM courses c
LEFT JOIN purchases p
ON p.course_id = c.course_id
WHERE p.purchase_id IS NULL;

-- Top 5 courses based on total Revenue

SELECT c.course_name, FORMAT(SUM(p.quantity * c.unit_price),2) Total_Revenue
FROM purchases p
JOIN courses c
ON c.course_id = p.course_id
GROUP BY c.course_id
ORDER BY SUM(p.quantity * c.unit_price) DESC
LIMIT 5;

-- Course on high demand based on quantity sold
SELECT c.course_name,SUM(p.quantity) Total_quantity_sold 
FROM courses c
JOIN purchases p ON c.course_id = p.course_id
GROUP BY c.course_id
ORDER BY Total_quantity_sold DESC
LIMIT 1;

-- Purchases by Country

SELECT l.country, COUNT(p.purchase_id) Total_purchases, FORMAT(SUM(p.quantity * c.unit_price),2) Total_Revenue
FROM learners l
JOIN purchases p
ON p.learner_id = l.learner_id
JOIN courses c
ON c.course_id = p.course_id
GROUP BY l.country
ORDER BY Total_Revenue DESC;