

<h1>LIABRARY MANAGEMENT SYSTEM</h1>

This Project is a liabrary management system for books and customers in relational database.This project helps to keep track of liabrary information and records for books,customers, book issuance and its returns.
Data is stored in structures named branch,book,customer,employee,issueStatus and returnStatus.

<h1>Overview</h1>
Database liabrary consists of several table structures with attributes which stores data to keep track of the liabrary management system.

Branch: This stores information of id, manager_id, address of the branch and its contact number.
emoployee: This has attributes which stores data like id, name, salary,position and  branch_no.
Books: It stores information on book_title, isbn, category of the book,rental price,status,author of the book and publisher of the book.
customer: it stores Customer_Id, Customer_name , Customer_address and register date.
issueStatus : Issue_Id of the book, customer id of issued,date of Issue, Isbn of the book.
ReturnStatus : id,return customer id,name of the book,date,isbn of the book.

<h1>Queries Used</h1>
1. Retrieve the book title, category, and rental price of all available books.
2. List the employee names and their respective salaries in descending order of salary.
3. Retrieve the book titles and the corresponding customers who have issued those books.
4. Display the total count of books in each category.
5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
7. Display the branch numbers and the total count of employees in each branch.
8. Display the names of customers who have issued books in the month of June 2023.
9. Retrieve book_title from book table containing history.
10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
11. Function to get a book by its isbn.
12. function to get books by its issue_date.
13.get total books in liabrary.
14 add new customer

<h1>conclusion</h1>
Liabrary management system helps to keep track of books.It helps in improving the services and helps easier to track books and customer details and its issue and return status.