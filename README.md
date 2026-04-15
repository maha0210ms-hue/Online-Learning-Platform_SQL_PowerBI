# Online Learning Platform Analysis Dashboard – SQL & Power BI

A comprehensive analysis of an online learning platform to understand learner behavior, course performance, revenue trends, and country-wise purchases to support data-driven decisions.

## 📖 Table of Contents

* [Project Overview](#-project-overview)
* [Data Source](#-data-source)
* [Tools & Technologies](#-tools--technologies)
* [Data Cleaning & Preparation](#-data-cleaning--preparation)
* [Exploratory Data Analysis (EDA)](#-exploratory-data-analysis-eda)
* [Key Insights](#-key-insights)
* [Recommendations](#-recommendations)
* [How to Use](#-how-to-use)

## 📊 Project Overview

This project analyzes an **online learning platform dataset** to understand learner spending behavior, course demand, and revenue distribution.

The primary objectives were:

* To identify top learners based on total spending
* To analyze most purchased courses
* To evaluate category-wise revenue performance
* To identify learners purchasing across multiple categories
* To detect courses with zero purchases
* To analyze country-wise purchase distribution

The analysis was performed using **SQL for data extraction and Power BI for visualization**, enabling actionable insights for course performance and learner engagement.

## 🗂️ Data Source

* **Source:** Simulated Online Learning Platform Dataset
* **Format:** SQL Database
* **Tables:** 3 relational tables

**Key Variables:**

* learner_id
* full_name
* country
* course_id
* course_name
* category
* unit_price
* purchase_id
* quantity
* purchase_date

The dataset contains detailed **learner information, course details, and purchase transactions**, enabling end-to-end sales and learner behavior analysis.

## 🛠️ Tools & Technologies

* **Database:** MySQL
* **Query Language:** SQL
* **Visualization Tool:** Power BI
* **Data Modeling:** Relational Model

## 🧹 Data Cleaning & Preparation

The following preprocessing steps were performed before analysis:

1. Verified primary key and foreign key relationships.
2. Ensured proper joins between learners, courses, and purchases tables.
3. Checked for duplicate purchase records.
4. Validated numeric fields such as quantity and unit_price.
5. Handled missing values where applicable.
6. Structured dataset for analysis-ready format.

These steps ensured the dataset was **clean, structured, and ready for analysis**.

## 🔍 Exploratory Data Analysis (EDA)

The following business questions were explored:

* Who are the top learners based on total spending?
* Which courses are most purchased?
* Which courses generate highest revenue?
* Which categories perform best?
* Which learners purchased multiple categories?
* Which courses have zero demand?
* Which country generates highest purchases?

Analysis techniques used:

* SQL Joins (INNER JOIN, LEFT JOIN)
* Aggregate Functions (SUM, COUNT)
* GROUP BY and HAVING clauses
* CTE (Common Table Expressions)
* Revenue calculation (quantity × unit_price)

Visualizations created:

* KPI Cards (Total Revenue, Total Purchases, Quantity Sold)
* Bar Chart (Learner Total Spending)
* Column Chart (Top Purchased Courses)
* Bar Chart (Top Revenue Courses)
* Combo Chart (Category Revenue & Unique Learners)
* Table (Learners purchasing multiple categories)
* Table (Courses not purchased)
* Map (Purchases by Country)

## 💡 Key Insights

* A small group of learners contribute to a large portion of total revenue.
* Certain courses generate significantly higher revenue than others.
* Some courses have zero purchases indicating low demand.
* Top courses dominate overall quantity sold.
* Few learners purchase across multiple categories.
* Category-wise revenue highlights top performing segments.
* Country-wise purchases show a global learner base.

## 🚀 Recommendations

* Promote high-performing courses to maximize revenue.
* Improve visibility for courses with zero purchases.
* Encourage learners to explore multiple categories.
* Focus marketing efforts on top-performing countries.
* Create bundles based on high-demand courses.
* Monitor learner spending patterns for targeted offers.

## ⚙️ How to Use

To explore this project:

1.Import the dataset into MySQL database.
2.Execute the provided SQL queries for analysis.
3.Open Power BI to view the simple dashboard.
4.Analyze visualizations for insights.

No additional tools are required beyond **MySQL and Power BI**.
