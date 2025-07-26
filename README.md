📚 Online Book Store – SQL Project
This is an SQL-based project that simulates the backend of an Online Book Store. It includes the creation of a database schema with tables for customers, books, and orders, along with a variety of queries for data analysis and business intelligence.

📌 Project Overview
This project focuses on:

Designing a relational database for an online book store
Writing SQL queries to perform CRUD operations and extract insights
Practicing joins, aggregations, filtering, sorting, and group operations
Demonstrating real-world use cases such as calculating revenue, finding top-selling books, and customer insights
🗃️ Database Schema
1. customers
Stores customer information.

Column	Data Type
Customer_ID	INT (Primary Key)
Name	VARCHAR(100)
Email	VARCHAR(100)
Phone	VARCHAR(15)
City	VARCHAR(50)
Country	VARCHAR(150)
2. books
Stores book details.

Column	Data Type
Book_ID	SERIAL (Primary Key)
Title	VARCHAR(100)
Author	VARCHAR(100)
Genre	VARCHAR(50)
Published_Year	INT
Price	NUMERIC(10,2)
Stock	INT
3. orders
Stores order information.

Column	Data Type
Order_ID	INT (Primary Key)
Customer_ID	INT (Foreign Key → customers)
Book_ID	INT (Foreign Key → books)
Order_Date	DATE
Quantity	INT
Total_Amount	NUMERIC(10,2)
✅ SQL Queries
The project includes 20 real-world SQL queries:

Retrieve all fiction books
Find books published after 1950
List customers from Canada
Show orders placed in November 2023
Calculate total stock of books available
Find the most expensive book
List customers who ordered more than one quantity
Show orders with total amount > $20
List all unique genres
Find the book with the lowest stock
Calculate total revenue generated
Count books sold per genre
Average price of books in the "Fantasy" genre
Customers who placed at least two orders
Most frequently ordered book
Top 3 most expensive "Fantasy" books
Cities of customers who spent over $30
Total quantity sold by author
Top customer by total spending
Remaining stock after fulfilling all orders
##🛠️ Technologies Used SQL (PostgreSQL / MySQL compatible)

Relational Database Design

Data Analysis with SQL Queries

##👤 Author Nikita Mishra

Contact: nikita17.mishra@gmail.com Date: 26 July 2025
