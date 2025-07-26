
						-- SQL PROJECT ON ONLINE BOOK STORE --

CREATE DATABASE Project;
CREATE TABLE customers (
  Customer_ID  INT PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100),
  Phone VARCHAR(15),
  City VARCHAR(50),
  Country VARCHAR(150)
);

CREATE TABLE books (
  Book_ID SERIAL PRIMARY KEY,
  Title VARCHAR(100),
  Author VARCHAR(100),
  Genre VARCHAR(50),
  Published_Year INT,
  Price NUMERIC(10,2),
  Stock INT
); 

CREATE TABLE orders (
  Order_ID INT PRIMARY KEY,
  Customer_ID  INT REFERENCES customer (Customer_ID),
  Book_ID INT REFERENCES books (Book_ID),
  Order_Date DATE,
  Quantity INT,
  Total_Amount NUMERIC(10,2)
) ;

select * from books;
select * from customers;
select * from orders;

-- 1) Retrieves all books in the 'Fiction genre
SELECT Title , Genre FROM books
WHERE Genre = "Fiction";

-- 2) Find books published after the year 1950
SELECT Title , Published_Year FROM books
WHERE Published_Year > 1950 ;

-- 3) List all the customers from the country 'Canada'
SELECT * FROM customers
WHERE Country = "Canada" ;

-- 4) Show orders placed in November 2023
SELECT * FROM orders
where order_date LIKE '2023-11%';

-- 5) Retrieve the total stock of books available
SELECT Title , sum(Stock) AS Stock_Available
FROM books
GROUP BY Title;

-- 6) Find the details of the most expensive book
SELECT * FROM books
ORDER BY Price DESC
LIMIT 1;

-- 7) Show all customers who ordered more than 1 quantity of a book
SELECT c.Name , o.Quantity
FROM customers AS c
JOIN
orders AS o
ON c.Customer_ID = o.Order_ID
WHERE Quantity > 1;

-- 8) Retrieve all orders where the total amount exceeds $20
SELECT * FROM orders
WHERE Total_Amount > 20.00;

-- 9) List all the genres available in the books table
SELECT DISTINCT(Genre) as All_Genre FROM books;

-- 10) Find the book with the lowest Stock
SELECT Title , Stock AS Lowest_Stock                     
FROM books
ORDER BY Stock 
LIMIT 1;

-- 11) Calculate the total revenue generated from all orders
SELECT sum(total_Amount) as TOTAL_REVENUE_GENERATED FROM orders;
 
 -- 12) Retrieve the total number of books sold for each genre
 SELECT b.Genre , sum(o.Quantity) as Total_Books_Sold
 FROM books AS b
 JOIN
 orders AS o
 ON b.Book_ID = o.Book_ID
 GROUP BY Genre;
 
 -- 13) Find the average price of books in the "Fantasy" Genre
 SELECT avg(Price) FROM books
 where Genre = "Fantasy";
 
 -- 14) List Customers who have placed atleast two orders
 SELECT c.name ,c.Customer_ID, count(o.order_id) AS Orders
 FROM customers AS c
 JOIN
 orders AS o
 ON c.Customer_ID = o.Customer_ID
 GROUP BY Customer_ID
 HAVING count(o.order_id) >= 2 ;
 
 -- 15) Find the most frequently ordered book
 SELECT b.Book_ID , b.Title , count(o.Order_ID) AS Frequently_Ordered_Book 
 FROM books AS b
 JOIN
 orders AS o
 ON b.Book_ID = o.Book_ID
 GROUP BY b.Book_ID
 ORDER BY count(o.Order_ID) DESC
 LIMIT 1;
 
 -- 16) Show the Top 3 Most Expensive books of "Fantasy" Genre
 SELECT * FROM books
 WHERE Genre = "Fantasy"
 ORDER BY Price DESC
 LIMIT 3;
 
 -- 17) List the cities where customers who spent over $30 are located
 SELECT distinct(City) , Total_Amount 
 FROM customers
 JOIN
 orders 
 ON customers.Customer_ID = orders.Customer_ID
 WHERE Total_Amount > 30.00;
 
 -- 18) Retrieve the total quantity of books sold by each author
 SELECT Author , sum(Quantity) AS Total_Books_Sold
 FROM books 
 JOIN
 orders
 ON books.Book_ID = orders.Book_ID
 GROUP BY Author;
 
 -- 19) Find the customers who spent the most on orders
 SELECT c.Customer_ID as Customer_ID , c.Name AS Customer_Name , sum(o.Total_Amount) AS Total_Spent
 FROM customers AS c
 JOIN orders AS o
 ON c.Customer_ID = o.Customer_ID
 GROUP BY c.Customer_ID
 ORDER BY sum(o.Total_Amount) DESC
 LIMIT 1;
 
 -- 20) Calculate the stock remaining after fulfilling all orders
 SELECT b.book_id , b.title  , b.stock , COALESCE(SUM(o.quantity) , 0) AS Order_Quantity , b.stock-COALESCE(SUM(o.quantity) , 0) as Remaining_quantity
 FROM books AS b
 LEFT JOIN orders AS o
 ON b.Book_ID = o.Book_ID
 GROUP BY b.book_id;
 


