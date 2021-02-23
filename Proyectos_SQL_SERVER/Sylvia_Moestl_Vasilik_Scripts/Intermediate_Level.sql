----NIVEL INTERMEDIO----

---IMPORTANTE---
--20.Categories, and the total products in each category (8 row(s) affected)

--For this problem, we’d like to see the total number of products in each category. 
--Sort the results by the total number of products, in descending order.

SELECT categ.CategoryName,COUNT(product.ProductID) AS TotalProducts
FROM Products product INNER JOIN Categories categ ON product.CategoryID=categ.CategoryID
GROUP BY categ.CategoryName
ORDER BY COUNT(product.ProductID) DESC

---IMPORTANTE---
--21. Total customers per country/city (69 row(s) affected)

--In the Customers table, show the total number of customers per Country and City.

SELECT Country,City,COUNT(CustomerID) AS TotalCustomer
FROM Customers  
GROUP BY Country,City
ORDER BY COUNT(CustomerID) DESC

--22.Products that need reordering (18 row(s) affected)

--What products do we have in our inventory that should be reordered? For now, just use the fields UnitsInStock and ReorderLevel, 
--where UnitsInStock is less than the ReorderLevel, ignoring the fields UnitsOnOrder and Discontinued.
--Order the results by ProductID.

SELECT ProductID,ProductName,UnitsInStock,ReorderLevel
FROM Products
WHERE UnitsInStock<ReorderLevel

--23.Products that need reordering, continued (2 row(s) affected)

--Now we need to incorporate these fields—UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued—into our calculation.
--We’ll define “products that need reordering” with the following:

--*UnitsInStock plus UnitsOnOrder are less than or equal to ReorderLevel
--*The Discontinued flag is false (0).

SELECT ProductID,ProductName,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued
FROM Products
WHERE ((UnitsInStock+UnitsOnOrder)<=ReorderLevel) AND (Discontinued=0)

---IMPORTANTE---
--24.Customer list by region (91 row(s) affected)

--A salesperson for Northwind is going on a business trip to visit customers, and would like to see a list of all customers, sorted by region, alphabetically.
--However, he wants the customers with no region (null in the Region field) to be at the end, instead of at the top, where you’d normally find the null values. 
--Within the same region, companies should be sorted by CustomerID.

---MY SOLUTION---
SELECT CustomerID,CompanyName,Region	 
FROM Customers
ORDER BY (CASE WHEN Region IS NULL THEN 'Z' ELSE Region END) ASC,CustomerID ASC

---THE SOLUTION OF THE BOOK---
SELECT CustomerID, CompanyName, Region
FROM Customers
ORDER BY CASE WHEN Region IS NULL THEN 1 ELSE 0 END ASC, Region ASC, CustomerID;

--25.High freight charges (3 row(s) affected)

--Some of the countries we ship to have very high freight charges. 
--We'd like to investigate some more shipping options for our customers, to be able to offer them lower freight charges. 
--Return the three ship countries with the highest average freight overall, in descending order by average freight.

SELECT TOP 3 ShipCountry,AVG(Freight) AS AverageFreight
FROM Orders
GROUP BY  ShipCountry
ORDER BY AVG(Freight) DESC

--26/27
--26. High freight charges - 2015 (3 row(s) affected)

--We're continuing on the question above on high freight charges. 
--Now, instead of using all the orders we have, we only want to see orders from the year 2015.

SELECT TOP 3 ShipCountry,AVG(Freight) AS AverageFreight
FROM Orders
WHERE YEAR(OrderDate)='2015'
GROUP BY  ShipCountry
ORDER BY AVG(Freight) DESC

--28.High freight charges - last year (3 row(s) affected)

--We're continuing to work on high freight charges.
--We now want to get the three ship countries with the highest average freight charges. 
--But instead of filtering for a particular year, we want to use the last 12 months of order data, 
--using as the end date the last OrderDate in Orders.

---MY SOLUTION---
SELECT TOP 3 ord.ShipCountry,AVG(Freight) AS AverageFreight
FROM 
(SELECT ShipCountry,DATEADD(mm,-12,MAX(OrderDate)) AS StartDateOrder,MAX(OrderDate) AS LastDateOrder
FROM Orders
GROUP BY ShipCountry) DateByCountry INNER JOIN Orders ord ON DateByCountry.ShipCountry=ord.ShipCountry
WHERE ord.OrderDate BETWEEN DateByCountry.StartDateOrder AND DateByCountry.LastDateOrder
GROUP BY ord.ShipCountry
ORDER BY AverageFreight DESC

---THE SOLUTION OF THE BOOK---
SELECT TOP 3 ShipCountry, AVG(Freight) AS AverageFreight
FROM Orders
WHERE OrderDate >= (DATEADD(year, -1, (SELECT MAX(OrderDate) FROM Orders)))
GROUP BY ShipCountry
ORDER BY AverageFreight DESC;

---IMPORTANTE---
--29. Inventory list (total 2155 rows)

--We're doing inventory, and need to show information like the below, for all orders. Sort by OrderID and Product ID.

SELECT empl.EmployeeID,empl.LastName,ord.OrderID,produc.ProductName,ordDetail.Quantity
FROM Orders ord INNER JOIN Employees empl ON empl.EmployeeID=ord.EmployeeID
     INNER JOIN OrderDetails ordDetail ON ordDetail.OrderID=ord.OrderID
	 INNER JOIN Products produc ON produc.ProductID=ordDetail.ProductID

---IMPORTANTE---
--30.Customers with no orders (2 row(s) affected)

--There are some customers who have never actually placed an order. Show these customers.

SELECT cust.CustomerID AS Customers_CustomerID,ord.CustomerID AS Orders_CustomerID
FROM Customers cust LEFT JOIN Orders ord ON ord.CustomerID=cust.CustomerID
WHERE ord.CustomerID IS NULL

---IMPORTANTE---
--31.Customers with no orders for EmployeeID 4 (16 row(s) affected)

--One employee (Margaret Peacock, EmployeeID 4) has placed the most orders. 
--However, there are some customers who've never placed an order with her. 
--Show only those customers who have never placed an order with her.

SELECT cust.CustomerID,employee_order.CustomerID
FROM Customers cust LEFT JOIN (SELECT ord.CustomerID 
                               FROM Employees empl INNER JOIN Orders ord ON ord.EmployeeID=empl.EmployeeID
							   WHERE empl.EmployeeID=4) employee_order ON cust.CustomerID=employee_order.CustomerID
WHERE employee_order.CustomerID IS NULL