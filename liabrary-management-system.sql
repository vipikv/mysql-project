#Liabrary Management System

CREATE DATABASE liabrary;
USE liabrary;

#table-branch
CREATE TABLE branch(
branch_no INT PRIMARY KEY,
manager_id INT,
branch_address VARCHAR(50),
contact_no INT
);
desc branch;
INSERT INTO branch(branch_no,manager_id,branch_address,contact_no)
	VALUES 
    (1, 101, 'New Delhi', 55512345),
    (2, 102, 'Mumbai', 55523456),
    (3, 103, 'Bangalore', 55534569),
    (4, 104, 'Kolkata', 55545690),
    (5, 105, 'Chennai', 55556781);

SELECT * FROM branch;

#table-employee
CREATE TABLE employee(
emp_id INT PRIMARY KEY,
emp_name VARCHAR(25),
position VARCHAR(25),
salary INT,
branch_no INT,
FOREIGN KEY (branch_no) REFERENCES branch(branch_no) ON DELETE CASCADE
);

SELECT CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'employee' AND COLUMN_NAME = 'branch_no';

desc employee;

INSERT INTO employee (emp_id, emp_name, position, salary, branch_no)
VALUES 
	(1, 'Rajesh Kumar', 'Engineer', 60000, 1),
    (2, 'Priya Sharma', 'Doctor', 50000, 2),
    (3, 'Amit Patel', 'Architect', 40000, 1),
    (4, 'Neha Gupta', 'Accountant', 55000, 3),
    (5, 'Ananya Singh', 'HR Specialist', 48000, 2),
    (6, 'Manoj Singh', 'Marketing Manager', 65000, 1),
    (7, 'Deepika Mishra', 'Teacher', 42000, 4),
    (8, 'Vikram Verma', 'IT Specialist', 58000, 3),
    (9, 'Neha Sharma', 'Financial Analyst', 60000, 5),
    (10, 'Amit Kumar', 'Operations Manager', 70000, 2);
SELECT * FROM employee;

#table-books
CREATE TABLE books(
isbn INT PRIMARY KEY,
book_title VARCHAR(50),
category VARCHAR(50),
rental_price INT,
status ENUM("yes","no"),
author VARCHAR(25),
publisher VARCHAR(25)
);

INSERT INTO books (isbn, book_title, category, rental_price, status, author, publisher) VALUES 
(12345678, 'The Great Gatsby', 'Fiction', 10, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
(23456788, 'Clean Code', 'Programming', 18, 'yes', 'Robert C. Martin', 'Prentice Hall'),
(23456789, 'The Shining', 'Horror', 12, 'no', 'Stephen King', 'Doubleday'),
(34567890, 'Introduction to Algorithms', 'Computer Science', 15, 'yes', 'Thomas H. Cormen', 'MIT Press'),
(45678901, 'A People''s History of the United States', 'History', 10, 'yes', 'Howard Zinn', 'Harper & Row'),
(56789012, 'Data Structures and Algorithms in Python', 'Computer Science', 20, 'yes', 'Michael T. Goodrich', 'Wiley'),
(67890123, '1984', 'Dystopian', 11, 'yes', 'George Orwell', 'Secker & Warburg'),
(78901234, 'To Kill a Mockingbird', 'Classic', 9, 'yes', 'Harper Lee', 'J. B. Lippincott & Co.'),
(90123456, 'The Lord of the Rings', 'Fantasy', 10, 'yes', 'J.R.R. Tolkien', 'George Allen & Unwin'),
(12345679, 'The Catcher in the Rye', 'Fiction', 10, 'yes', 'J.D. Salinger', 'Little, Brown and Company');

SELECT * FROM books;

#table-customer
CREATE TABLE customer(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(25),
customer_address VARCHAR(50),
reg_date DATE
);
INSERT INTO customer (customer_id, customer_name, customer_address, reg_date) VALUES 
(1, 'Rahul Sharma', '123, Main Street, Mumbai', '2024-04-01'),
(2, 'Priya Patel', '456, Park Avenue, Delhi', '2024-04-02'),
(3, 'Aarav Gupta', '789, Elm Road, Bangalore', '2024-04-03'),
(4, 'Neha Singh', '101, Oak Lane, Kolkata', '2024-04-04'),
(5, 'Vivek Shah', '234, Maple Drive, Chennai', '2024-04-05'),
(6, 'Aisha Khan', '567, Cedar Court, Hyderabad', '2024-04-06'),
(7, 'Ananya Joshi', '890, Pine Street, Pune', '2024-04-07'),
(8, 'Rohan Desai', '123, Birch Avenue, Jaipur', '2024-04-08'),
(9, 'Sneha Reddy', '456, Willow Lane, Ahmedabad', '2024-04-09'),
(10, 'Kiran Kumar', '789, Spruce Road, Lucknow', '2024-04-10');

SELECT * FROM customer;

#issuestatus
CREATE TABLE issueStatus(
issue_id INT PRIMARY KEY,
issued_cust INT,
issue_date DATE,
isbn_book INT,
FOREIGN KEY (issued_cust) REFERENCES customer(customer_id) ON DELETE CASCADE,
FOREIGN KEY (isbn_book) REFERENCES books(isbn) ON DELETE CASCADE
);

desc issueStatus;

INSERT INTO issueStatus (issue_id, issued_cust, issue_date, isbn_book) VALUES 
(1, 1, '2024-04-01', 12345678),
(2, 2, '2024-04-02', 23456788),
(3, 3, '2024-04-03', 23456789),
(4, 4, '2024-04-04', 34567890),
(5, 5, '2024-04-05', 45678901),
(6, 6, '2024-04-06', 56789012),
(7, 7, '2024-04-07', 67890123),
(8, 8, '2024-04-08', 78901234),
(9, 9, '2024-04-09', 90123456),
(10, 10, '2024-04-10', 12345679);

SELECT * FROM issueStatus;

#table-return status

CREATE TABLE returnStatus(
return_id INT PRIMARY KEY,
return_cust INT,
return_book_name VARCHAR(50),
return_date DATE,
isbn_book2 INT,
FOREIGN KEY (isbn_book2) REFERENCES books(isbn) ON DELETE CASCADE
);

INSERT INTO returnStatus (return_id, return_cust, return_book_name, return_date, isbn_book2) VALUES 
(1, 1, 'The Great Gatsby', '2024-04-11', 12345678),
(2, 2, 'Clean Code', '2024-04-12', 23456788),
(3, 3, 'The Shining', '2024-04-13', 23456789),
(4, 4, 'Introduction to Algorithms', '2024-04-14', 34567890),
(5, 5, 'A People''s History of the United States', '2024-04-15', 45678901),
(6, 6, 'Data Structures and Algorithms in Python', '2024-04-16', 56789012),
(7, 7, '1984', '2024-04-17', 67890123),
(8, 8, 'To Kill a Mockingbird', '2024-04-18', 78901234),
(9, 9, 'The Lord of the Rings', '2024-04-19', 90123456),
(10, 10, 'The Catcher in the Rye', '2024-04-20', 12345679);

SELECT * FROM returnStatus;

-- 1. Retrieve the book title, category, and rental price of all available books. 

SELECT book_title,category,rental_price FROM books WHERE status = "yes";

-- 2. List the employee names and their respective salaries in descending order of salary.

SELECT emp_name,salary FROM employee ORDER BY salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.book_title,c.customer_name FROM books b
INNER JOIN issueStatus i ON i.isbn_book = b.isbn
INNER JOIN customer c ON c.customer_id = i.issued_cust;

-- 4. Display the total count of books in each category.
SELECT category,COUNT(*) FROM books GROUP BY category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT emp_name,position,salary FROM employee WHERE salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT customer_name FROM customer WHERE (reg_date < '2022-01-01') and (customer_id NOT IN (SELECT issued_cust FROM issueStatus));

-- 7. Display the branch numbers and the total count of employees in each branch.
SELECT branch_no,COUNT(*) as total_employees FROM employee GROUP BY branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
SELECT c.customer_name,i.issue_date FROM customer c INNER JOIN issueStatus i ON Month(i.issue_date) = 6 and YEAR(i.issue_date) = 2023;

-- 9. Retrieve book_title from book table containing history.

SELECT book_title,category FROM books WHERE category = 'history';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

SELECT branch_no,COUNT(*) AS employee_no FROM employee GROUP BY branch_no HAVING COUNT(*) > 5;