/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
Select p.name, c.name 
from products as p
inner join categories as c
on p.CategoryID = c.CategoryID
where c.Name = 'computers';

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
Select p.Name as 'product names', p.price as 'product prices', r.rating as 'product ratings'
from products as p
inner join reviews as r
on p.ProductID = r.ProductID
where r.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.EmployeeID, e.FirstName, e.LastName, sum(s.Quantity) as "Total Sold"
from employees as e
inner join sales as s
on e.EmployeeID = s.EmployeeID
group by e.EmployeeID, e.FirstName, e.LastName
order by sum(s.Quantity)desc
limit 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
Select c.Name, d.Name
from categories as c
inner join departments as d
on d.DepartmentID = c.DepartmentID
where c.Name in ('Appliances','Games');

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
Select p.Name as "Product Name", sum(s.Quantity) as "Total Sold", sum(s.PricePerUnit *s.Quantity) as "Total Sales"
from products as p
inner join sales as s
on p.ProductID = s.ProductID
where p.Name like '%eagles: hotel california%'
group by p.Name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
Select p.Name, r.Reviewer, r.Rating, r.Comment
from products as p
inner join reviews as r
on p.ProductID = r.ProductID
where p.name like '%Visio TV%' 
and r.Rating =(select min(rating)from reviews where ProductID = p.ProductID);

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
Select e.EmployeeID, e.FirstName, e.LastName, p.Name, s.Quantity
from employees as e
inner join sales as s on s.EmployeeID = e.EmployeeID
inner join products as p on p.ProductID = s.ProductID;

