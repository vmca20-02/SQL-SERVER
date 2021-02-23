----NIVEL BASICO----

--1.Which shippers do we have? (3 row(s) affected)

--We have a table called Shippers. Return all the fields from all the shippers 

SELECT *
FROM Shippers

--2.Certain fields from Categories (8 row(s) affected)

--In the Categories table, selecting all the fields using this SQL

SELECT *
FROM Categories

--3.Sales Representative (6 row(s) affected)

--We’d like to see just the FirstName, LastName, and HireDate of all the employees with the Title of Sales Representative. 
--Write a SQL statement that returns only those employees.

SELECT FirstName,LastName,HireDate
FROM Employees
WHERE Title LIKE 'Sales Representative'

--4.Sales Representatives in the United States (3 row(s) affected)

--Now we’d like to see the same columns as above, but only for those employees that both have the title of Sales Representative, 
--and also are in the United States.

SELECT FirstName,LastName,HireDate
FROM Employees
WHERE Title LIKE 'Sales Representative' AND Country='USA'

--5.Orders placed by specific EmployeeID (42 row(s) affected)

--Show all the orders placed by a specific employee. The EmployeeID for this Employee (Steven Buchanan) is 5.

SELECT OrderID,OrderDate
FROM Orders
WHERE EmployeeID=5

--6. Suppliers and ContactTitles (24 row(s) affected)

--In the Suppliers table, show the SupplierID, ContactName, and ContactTitle for 
--those Suppliers whose ContactTitle is not Marketing Manager.

SELECT SupplierID,ContactName,ContactTitle
FROM Suppliers
WHERE ContactTitle NOT LIKE 'Marketing Manager'

--7.Products with “queso” in ProductName (2 row(s) affected)

--In the products table, we’d like to see the ProductID and ProductName for those products 
--where the ProductName includes the string “queso”.

SELECT ProductID,ProductName
FROM Products
WHERE ProductName LIKE '%queso%'

--8.Orders shipping to France or Belgium (96 row(s) affected)

--Looking at the Orders table, there’s a field called ShipCountry. Write a query that shows the OrderID, CustomerID, 
--and ShipCountry for the orders where the ShipCountry is either France or Belgium.

SELECT OrderID,CustomerID,ShipCountry
FROM Orders
WHERE ShipCountry IN('France','Belgium')

--9.Orders shipping to any country in Latin America (173 row(s) affected)

--Now, instead of just wanting to return all the orders from France of Belgium, we want to show all the orders 
--from any Latin American country. But we don’t have a list of Latin American countries in a table in the Northwind database. 
--So, we’re going to just use this list of Latin American countries that happen to be in the Orders table:

SELECT OrderID,CustomerID,ShipCountry
FROM Orders
WHERE ShipCountry IN('Brazil','Mexico','Argentina','venezuela')

--10.Employees, in order of age (9 row(s) affected)

--For all the employees in the Employees table, show the FirstName, LastName, Title, and BirthDate. 
--Order the results by BirthDate, so we have the oldest employees first.

SELECT FirstName,LastName,Title,BirthDate
FROM Employees
ORDER BY BirthDate

--11.Showing only the Date with a DateTime field (9 row(s) affected)

--In the output of the query above, showing the Employees in order of BirthDate, we see the time of the BirthDate field, 
--which we don’t want. Show only the date portion of the BirthDate field.

SELECT FirstName,LastName,Title,FORMAT(BirthDate,'yyyy-MM-dd') AS DateOnlyBirthDate1,
       CAST(BirthDate AS DATE) AS DateOnlyBirthDate2
FROM Employees
ORDER BY BirthDate

--12.Employees full name (9 row(s) affected)

--Show the FirstName and LastName columns from the Employees table, and then create a new column called FullName, 
--showing FirstName and LastName joined together in one column, with a space in-between.

SELECT FirstName,LastName,FirstName+' '+LastName AS FullName
FROM Employees

--13.OrderDetails amount per line item (2155 row(s) affected)

--In the OrderDetails table, we have the fields UnitPrice and Quantity. 
--Create a new field, TotalPrice, that multiplies these two together. We’ll ignore the Discount field for now.
--In addition, show the OrderID, ProductID, UnitPrice, and Quantity. Order by OrderID and ProductID.

SELECT OrderID,ProductID,UnitPrice,Quantity,UnitPrice * Quantity AS TotalPrice
FROM OrderDetails
ORDER BY OrderID,ProductID

--14. How many customers? (1 row(s) affected)

--How many customers do we have in the Customers table? Show one value only, 
--and don’t rely on getting the recordcount at the end of a resultset.

SELECT COUNT(*) AS TotalCustomers
FROM Customers

--15.When was the first order? (1 row(s) affected)

--Show the date of the first order ever made in the Orders table.

SELECT MIN(OrderDate) AS FirstOrder
FROM Orders

--16. Countries where there are customers (21 row(s) affected)

--Show a list of countries where the Northwind company has customers.

SELECT DISTINCT(Country)
FROM Customers

--17. Contact titles for customers (12 row(s) affected)

--Show a list of all the different values in the Customers table for ContactTitles. Also include a count for each ContactTitle.
--This is similar in concept to the previous question “Countries where there are customers”, except we now want a count for each ContactTitle.

SELECT DISTINCT(ContactTitle),COUNT(ContactTitle) AS TotalContactTitle
FROM Customers
GROUP BY ContactTitle
ORDER BY TotalContactTitle DESC

---IMPORTANTE
--18. Products with associated supplier names (77 row(s) affected)

--We’d like to show, for each product, the associated Supplier. Show the ProductID, ProductName, and the CompanyName of the Supplier. Sort by ProductID.
--This question will introduce what may be a new concept, the Join clause in SQL. 
--The Join clause is used to join two or more relational database tables together in a logical way.
--Here’s a data model of the relationship between Products and Suppliers

SELECT produc.ProductID,produc.ProductName,supp.CompanyName AS Supplier
FROM Suppliers supp INNER JOIN Products produc ON supp.SupplierID=produc.SupplierID

SELECT ProductID, ProductName, CompanyName
FROM Products
JOIN
   (SELECT SupplierID, CompanyName
	FROM Suppliers) AS sup
ON Products.SupplierID = sup.SupplierID
ORDER BY ProductID

---IMPORTANTE---
--19. Orders and the Shipper that was used (52 row(s) affected)

--We’d like to show a list of the Orders that were made, including the Shipper that was used. 
--Show the OrderID, OrderDate (date only), and CompanyName of the Shipper, and sort by OrderID.
--In order to not show all the orders (there’s more than 800), show only those rows with an OrderID of less than 10300.

SELECT ord.OrderID,FORMAT(ord.OrderDate,'yyyy-MM-dd') AS OrderDate,shipp.CompanyName AS Shipper
FROM Orders ord INNER JOIN Shippers shipp ON ord.ShipVia=shipp.ShipperID
WHERE ord.OrderID<10300

SELECT OrderID, CAST(OrderDate AS DATE) AS OrderDate, Shipper
FROM Orders
JOIN (SELECT ShipperID, CompanyName AS Shipper
	  FROM Shippers) AS shipper
ON Orders.ShipVia = shipper.ShipperID
WHERE OrderID < 10300
ORDER BY OrderID