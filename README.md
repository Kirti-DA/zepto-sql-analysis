# Zepto Grocery Data Analysis (SQL)

## 📚 Table of Contents
- [Objective](#-objective)
- [Project Structure](#-project-structure)
- [Tools & Skills Used](#-tools--skills-used)
- [Business Questions Answered](#-business-questions-answered)
- [Key Insights](#-key-insights)
- [What I Learned](#-what-i-learned)
- [Author](#-author)

## 🎯 Objective
Analyze Zepto's product and inventory dataset using SQL to answer business questions related to pricing, stock availability, product categories, and revenue generation.

## 📁 Project Structure
- [queries/zepto_analysis_queries.sql](queries/Zepto_analysis_queries.sql) – Contains all business queries and insights
- [data/zepto_data.csv](data/zepto_data.csv) – Dataset used for analysis
-

## 🛠 Tools & Skills Used
- PostgreSQL
- SQL (SELECT, WHERE, GROUP BY, ORDER BY, CASE, JOIN, Aggregates)
- Business Thinking
- Data Cleaning & Filtering

## 💼 Business Questions Answered

1. 🔍 Top 10 best value products based on discount %
2. 🚫 High-MRP products that are out of stock
3. 💰 Estimated revenue per product category
4. 🎯 MRP > ₹500 with <10% discount
5. 🏆 Top 5 categories with highest average discount
6. 📊 Price-per-gram calculation for items >100g
7. ⚖ Weight category segmentation (Low, Medium, Bulk)
8. 📦 Total inventory weight per category

## 📊 Key Insights

- Several *premium products* (MRP > ₹500) offer *very low discounts*, highlighting a premium pricing strategy.
- *Bulk weight products* generally provide *lower price per gram*, offering value to cost-conscious customers.
- *Top revenue-generating categories* can guide stocking & marketing decisions.
- Many *high-MRP products* are out of stock — indicating potential *demand-supply gaps*.

## 💡 What I Learned

- Writing optimized SQL queries for real business cases
- Performing aggregations, CASE statements, and sorting logic
- Deriving KPIs like price efficiency, weight segmentation, and revenue estimates
- Structuring SQL analysis projects for GitHub presentation

---

> ✍ Created by Kirti | Aspiring Data Analyst  
> 📧 [GitHub Profile](https://github.com/Kirti-DA)
