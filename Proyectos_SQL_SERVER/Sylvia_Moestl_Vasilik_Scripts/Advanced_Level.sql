----NIVEL AVANZADO----

--32.High-value customers (6 row(s) affected)

--We want to send all of our high-value customers a special VIP gift. 
--We're defining high-value customers as those who've made at least 1 order with a total value (not including the discount) equal to $10,000 or more. 
--We only want to consider orders made in the year 2016.

SELECT cust.CustomerID,cust.CompanyName,ord.OrderID,SUM(ordDetail.UnitPrice*ordDetail.Quantity) AS TotalOrderAmount
FROM Customers cust INNER JOIN Orders ord ON ord.CustomerID=cust.CustomerID
     INNER JOIN OrderDetails ordDetail ON ordDetail.OrderID=ord.OrderID AND YEAR(ord.OrderDate)='2016'
GROUP BY cust.CustomerID,cust.CompanyName,ord.OrderID
HAVING SUM(ordDetail.UnitPrice*ordDetail.Quantity)>=10000
ORDER BY TotalOrderAmount DESC

--33.High-value customers - total orders (9 row(s) affected)

--The manager has changed his mind. Instead of requiring that customers have at least one individual orders totaling $10,000 or more,
-- he wants to define high-value customers as those who have orders totaling $15,000 or more in 2016. How would you change the answer to the problem above?

SELECT cust.CustomerID,cust.CompanyName,SUM(ordDetail.UnitPrice*ordDetail.Quantity) AS TotalOrderAmount
FROM Customers cust INNER JOIN Orders ord ON ord.CustomerID=cust.CustomerID
     INNER JOIN OrderDetails ordDetail ON ordDetail.OrderID=ord.OrderID AND YEAR(ord.OrderDate)='2016'
GROUP BY cust.CustomerID,cust.CompanyName
HAVING SUM(ordDetail.UnitPrice*ordDetail.Quantity)>=15000
ORDER BY TotalOrderAmount DESC

--34. High-value customers - with discount (11 row(s) affected)

--Change the above query to use the discount when calculating high-value customers. 
--Order by the total amount which includes the discount.

SELECT cust.CustomerID,cust.CompanyName,SUM(ordDetail.UnitPrice*ordDetail.Quantity) AS TotalWithoutDiscount,
       SUM((ordDetail.UnitPrice)*ordDetail.Quantity*(1-ordDetail.Discount)) AS TotalsWithDiscount
FROM Customers cust INNER JOIN Orders ord ON ord.CustomerID=cust.CustomerID
     INNER JOIN OrderDetails ordDetail ON ordDetail.OrderID=ord.OrderID AND YEAR(ord.OrderDate)='2016'
GROUP BY cust.CustomerID,cust.CompanyName
HAVING SUM((ordDetail.UnitPrice)*ordDetail.Quantity*(1-ordDetail.Discount))>=10000
ORDER BY TotalsWithDiscount DESC

--35. Month-end orders (26 row(s) affected)

--At the end of the month, salespeople are likely to try much harder to get orders, to meet their month-end quotas. 
--Show all orders made on the last day of the month. Order by EmployeeID and OrderID

SELECT EmployeeID,OrderID,OrderDate
FROM Orders
WHERE DATEDIFF(DAY,OrderDate,EOMONTH(OrderDate))=0
ORDER BY EmployeeID,OrderID ASC

--36. Orders with many line items (10 row(s) affected)

--The Northwind mobile app developers are testing an app that customers will use to show orders. 
--In order to make sure that even the largest orders will show up correctly on the app, 
--they'd like some samples of orders that have lots of individual line items. Show the 10 orders with the most line items, in order of total line items.

SELECT TOP 10 Ord.OrderID,COUNT(OrdDetail.OrderID) AS TotalOrderDetails
FROM Orders Ord INNER JOIN OrderDetails OrdDetail ON OrdDetail.OrderID=Ord.OrderID
GROUP BY Ord.OrderID
ORDER BY COUNT(OrdDetail.OrderID) DESC

--37(EJERCISIO DESCARTADO)

--38. Orders - accidental double-entry (5 row(s) affected)

--Janet Leverling, one of the salespeople, has come to you with a request. 
--She thinks that she accidentally double-entered a line item on an order, with a different ProductID, 
--but the same quantity. She remembers that the quantity was 60 or more. 
--Show all the OrderIDs with line items that match this, in order of OrderID.

SELECT OrderID
FROM OrderDetails
GROUP BY OrderID,Quantity
HAVING Quantity>=60 AND COUNT(OrderID)>1

--39/40 (16 row(s) affected)

--39.Orders - accidental double-entry details

--Based on the previous question, we now want to show details of the order, for orders that match the above criteria.

--40. Orders - accidental double-entry details, derived table

--Here's another way of getting the same results as in the previous problem, using a derived table instead of a CTE. 
--However, there's a bug in this SQL. It returns 20 rows instead of 16. Correct the SQL.

SELECT OrderId,ProductID,UnitPrice,Quantity,Discount
FROM OrderDetails
WHERE OrderId IN(SELECT subOrderDetails.OrderID
                 FROM (SELECT OrderID,Quantity,COUNT(OrderID) AS cantDetails
                       FROM OrderDetails
                       GROUP BY OrderID,Quantity
                       HAVING Quantity>=60 AND COUNT(OrderID)>=2) subOrderDetails)
ORDER BY OrderId,Quantity ASC,ProductID,UnitPrice DESC

--41.Late orders (39 row(s) affected)

--Some customers are complaining about their orders arriving late. Which orders are late?

SELECT OrderID,FORMAT(OrderDate,'yyyy-MM-dd') AS OrderDate,
       FORMAT(RequiredDate,'yyyy-MM-dd') AS RequiredDate,
	   FORMAT(ShippedDate,'yyyy-MM-dd') AS ShippedDate
FROM Orders
WHERE RequiredDate<=ShippedDate

--42.Late orders - which employees? (8 row(s) affected)

--Some salespeople have more orders arriving late than others. 
--Maybe they're not following up on the order process, and need more training. 
--Which salespeople have the most orders arriving late?

SELECT employ.EmployeeID,employ.LastName,COUNT(ord.OrderID) AS TotalLateOrders
FROM Orders ord INNER JOIN Employees employ ON ord.EmployeeID=employ.EmployeeID
WHERE ord.RequiredDate<=ord.ShippedDate
GROUP BY employ.EmployeeID,employ.LastName
ORDER BY TotalLateOrders DESC

--43. Late orders vs. total orders (8 row(s) affected)

--Andrew, the VP of sales, has been doing some more thinking some more about the problem of late orders. 
--He realizes that just looking at the number of orders arriving late for each salesperson isn't a good idea. 
--It needs to be compared against the total number of orders per salesperson.

SELECT employ.EmployeeID,employ.LastName,AllOrdersEmployee.AllOrders,LateOrdersEmployee.LateOrders
FROM	
(SELECT ord.EmployeeID,COUNT(ord.OrderID) AS LateOrders
 FROM Orders ord 
 WHERE ord.RequiredDate<=ord.ShippedDate
 GROUP BY ord.EmployeeID) LateOrdersEmployee INNER JOIN Employees employ ON employ.EmployeeID=LateOrdersEmployee.EmployeeID
 INNER JOIN
(SELECT ord.EmployeeID,COUNT(ord.OrderID) AS AllOrders
 FROM Orders ord 
 GROUP BY ord.EmployeeID) AllOrdersEmployee ON AllOrdersEmployee.EmployeeID=employ.EmployeeID
ORDER BY employ.EmployeeID

--44. Late orders vs. total orders - missing employee (9 row(s) affected)

--There's an employee missing in the answer from the problem above. 
--Fix the SQL to show all employees who have taken orders.

SELECT employ.EmployeeID,employ.LastName,AllOrdersEmployee.AllOrders,LateOrdersEmployee.LateOrders
FROM	
(SELECT ord.EmployeeID,COUNT(ord.OrderID) AS LateOrders
 FROM Orders ord 
 WHERE ord.RequiredDate<=ord.ShippedDate
 GROUP BY ord.EmployeeID) LateOrdersEmployee RIGHT JOIN Employees employ ON LateOrdersEmployee.EmployeeID=employ.EmployeeID
 INNER JOIN
(SELECT ord.EmployeeID,COUNT(ord.OrderID) AS AllOrders
 FROM Orders ord 
 GROUP BY ord.EmployeeID) AllOrdersEmployee ON AllOrdersEmployee.EmployeeID=employ.EmployeeID
ORDER BY employ.EmployeeID

--45.Late orders vs. total orders - fix null (9 row(s) affected)

--Continuing on the answer for above query, let's fix the results for row 5 - Buchanan. 
--He should have a 0 instead of a Null in LateOrders.

SELECT employ.EmployeeID,employ.LastName,AllOrdersEmployee.AllOrders,ISNULL(LateOrdersEmployee.LateOrders,0) AS LateOrders
FROM	
(SELECT ord.EmployeeID,COUNT(ord.OrderID) AS LateOrders
 FROM Orders ord 
 WHERE ord.RequiredDate<=ord.ShippedDate
 GROUP BY ord.EmployeeID) LateOrdersEmployee RIGHT JOIN Employees employ ON employ.EmployeeID=LateOrdersEmployee.EmployeeID
 INNER JOIN
(SELECT ord.EmployeeID,COUNT(ord.OrderID) AS AllOrders
 FROM Orders ord 
 GROUP BY ord.EmployeeID) AllOrdersEmployee ON AllOrdersEmployee.EmployeeID=employ.EmployeeID
ORDER BY employ.EmployeeID

--46.Late orders vs. total orders - percentage (9 row(s) affected)

--Now we want to get the percentage of late orders over total orders.

SELECT employ.EmployeeID,employ.LastName,AllOrdersEmployee.AllOrders,
       ISNULL(LateOrdersEmployee.LateOrders,0) AS LateOrders,
	   CAST((CAST(ISNULL(LateOrdersEmployee.LateOrders,0) AS FLOAT)/CAST(AllOrdersEmployee.AllOrders AS FLOAT)) AS DECIMAL(14,13)) AS PercentLateOrders
FROM	
(SELECT ord.EmployeeID,COUNT(ord.OrderID) AS LateOrders
 FROM Orders ord 
 WHERE ord.RequiredDate<=ord.ShippedDate
 GROUP BY ord.EmployeeID) LateOrdersEmployee RIGHT JOIN Employees employ ON employ.EmployeeID=LateOrdersEmployee.EmployeeID
 INNER JOIN
(SELECT ord.EmployeeID,COUNT(ord.OrderID) AS AllOrders
 FROM Orders ord 
 GROUP BY ord.EmployeeID) AllOrdersEmployee ON AllOrdersEmployee.EmployeeID=employ.EmployeeID
ORDER BY employ.EmployeeID

--47. Late orders vs. total orders - fix decimal (9 row(s) affected)

--So now for the PercentageLateOrders, we get a decimal value like we should. But to make the output easier to read, 
--let's cut the PercentLateOrders off at 2 digits to the right of the decimal point.

SELECT employ.EmployeeID,employ.LastName,AllOrdersEmployee.AllOrders,
       ISNULL(LateOrdersEmployee.LateOrders,0) AS LateOrders,
	   CAST((CAST(ISNULL(LateOrdersEmployee.LateOrders,0) AS FLOAT)/CAST(AllOrdersEmployee.AllOrders AS FLOAT)) AS DECIMAL(10,2)) AS PercentLateOrders
FROM	
(SELECT ord.EmployeeID,COUNT(ord.OrderID) AS LateOrders
 FROM Orders ord 
 WHERE ord.RequiredDate<=ord.ShippedDate
 GROUP BY ord.EmployeeID) LateOrdersEmployee RIGHT JOIN Employees employ ON employ.EmployeeID=LateOrdersEmployee.EmployeeID
 INNER JOIN
(SELECT ord.EmployeeID,COUNT(ord.OrderID) AS AllOrders
 FROM Orders ord 
 GROUP BY ord.EmployeeID) AllOrdersEmployee ON AllOrdersEmployee.EmployeeID=employ.EmployeeID
ORDER BY employ.EmployeeID

--48/49 (81 row(s) affected)

--48.Customer grouping 

--Andrew Fuller, the VP of sales at Northwind, would like to do a sales campaign for existing customers. 
--He'd like to categorize customers into groups, based on how much they ordered in 2016. 
--Then, depending on which group the customer is in, he will target the customer with different sales materials.
--The customer grouping categories are 0 to 1,000, 1,000 to 5,000, 5,000 to 10,000, and over 10,000.
--A good starting point for this query is the answer from the problem “High-value customers - total orders. 
--We don’t want to show customers who don’t have any orders in 2016.
--Order the results by CustomerID.

--49. Customer grouping - fix null

--There's a bug with the answer for the previous question. The CustomerGroup value for one of the rows is null.
--Fix the SQL so that there are no nulls in the CustomerGroup field.

SELECT orderCustomer.CustomerID,orderCustomer.CompanyName,orderCustomer.TotalWithoutDiscount,
       CASE WHEN ((orderCustomer.TotalWithoutDiscount>=0) AND (orderCustomer.TotalWithoutDiscount<=1000)) 
	   THEN 'Low' ELSE (CASE WHEN ((orderCustomer.TotalWithoutDiscount>1000) AND (orderCustomer.TotalWithoutDiscount<=5000))  
	   THEN 'Medium' ELSE (CASE WHEN ((orderCustomer.TotalWithoutDiscount>5000) AND (orderCustomer.TotalWithoutDiscount<=10000)) 
	   THEN 'High' ELSE (CASE WHEN (orderCustomer.TotalWithoutDiscount>10000) THEN 'Very High' END) END) END) END AS CustomerGroup
FROM
(SELECT cust.CustomerID,cust.CompanyName,SUM(ordDetail.UnitPrice*ordDetail.Quantity) AS TotalWithoutDiscount
	   FROM Customers cust INNER JOIN Orders ord ON ord.CustomerID=cust.CustomerID
       INNER JOIN OrderDetails ordDetail ON ordDetail.OrderID=ord.OrderID AND YEAR(ord.OrderDate)='2016'
GROUP BY cust.CustomerID,cust.CompanyName) orderCustomer
ORDER BY orderCustomer.CustomerID ASC

--50. Customer grouping with percentage (4 row(s) affected) (ANALIZAR ESTO EN FOROS)

--Based on the above query, show all the defined CustomerGroups, and the percentage in each. 
--Sort by the total in each group, in descending order.

---VERSION 1---

DECLARE @AllOrders INT;

SET @AllOrders=(SELECT COUNT(CustomerID)
                FROM
               (SELECT cust.CustomerID
                FROM Customers cust INNER JOIN Orders ord ON cust.CustomerID=ord.CustomerID AND YEAR(ord.OrderDate)='2016'
                GROUP BY cust.CustomerID) TEMP)

SELECT CustomerGroup,COUNT(CustomerID) AS TotalInGroup,(CAST(COUNT(CustomerID) AS FLOAT)/CAST(@AllOrders AS FLOAT)) AS PercentageInGroup
FROM
(SELECT orderCustomer.CustomerID,orderCustomer.CompanyName,orderCustomer.TotalWithoutDiscount,
       CASE WHEN ((orderCustomer.TotalWithoutDiscount>=0) AND (orderCustomer.TotalWithoutDiscount<=1000)) THEN 'Low' 
	   ELSE (CASE WHEN ((orderCustomer.TotalWithoutDiscount>1000) AND (orderCustomer.TotalWithoutDiscount<=5000))  THEN 'Medium' 
	   ELSE (CASE WHEN ((orderCustomer.TotalWithoutDiscount>5000) AND (orderCustomer.TotalWithoutDiscount<=10000)) THEN 'High' 
	   ELSE (CASE WHEN (orderCustomer.TotalWithoutDiscount>10000) THEN 'Very High' END) END) END) END AS CustomerGroup
FROM
(SELECT cust.CustomerID,cust.CompanyName,SUM(ordDetail.UnitPrice*ordDetail.Quantity) AS TotalWithoutDiscount
 FROM Customers cust INNER JOIN Orders ord ON ord.CustomerID=cust.CustomerID
      INNER JOIN OrderDetails ordDetail ON ordDetail.OrderID=ord.OrderID AND YEAR(ord.OrderDate)='2016'
  GROUP BY cust.CustomerID,cust.CompanyName) orderCustomer) customerGroupOrder
GROUP BY CustomerGroup
ORDER BY COUNT(CustomerID) DESC

---VERSION 2---R

DECLARE @AllOrders INT;

CREATE TABLE #TempOrders(CustomerID NCHAR(5),CompanyName NVARCHAR(40),TotalWithoutDiscount MONEY)

INSERT INTO #TempOrders
SELECT cust.CustomerID,cust.CompanyName,SUM(ordDetail.UnitPrice*ordDetail.Quantity) AS TotalWithoutDiscount
FROM Customers cust INNER JOIN Orders ord ON ord.CustomerID=cust.CustomerID
     INNER JOIN OrderDetails ordDetail ON ordDetail.OrderID=ord.OrderID AND YEAR(ord.OrderDate)='2016'
GROUP BY cust.CustomerID,cust.CompanyName

SET @AllOrders=(SELECT COUNT(CustomerID) FROM #TempOrders)

SELECT orders.CustomerGroup,COUNT(orders.CustomerID) AS TotalInGroup,(CAST(COUNT(orders.CustomerID) AS FLOAT)/CAST(@AllOrders AS FLOAT)) AS PercentageInGroup
FROM
(SELECT #TempOrders.CustomerID,#TempOrders.CompanyName,#TempOrders.TotalWithoutDiscount,
       CASE WHEN ((#TempOrders.TotalWithoutDiscount>=0) AND (#TempOrders.TotalWithoutDiscount<=1000)) THEN 'Low' 
	   ELSE (CASE WHEN ((#TempOrders.TotalWithoutDiscount>1000) AND (#TempOrders.TotalWithoutDiscount<=5000))  THEN 'Medium' 
	   ELSE (CASE WHEN ((#TempOrders.TotalWithoutDiscount>5000) AND (#TempOrders.TotalWithoutDiscount<=10000)) THEN 'High' 
	   ELSE (CASE WHEN (#TempOrders.TotalWithoutDiscount>10000) THEN 'Very High' END) END) END) END AS CustomerGroup
FROM #TempOrders) orders
GROUP BY orders.CustomerGroup
ORDER BY COUNT(orders.CustomerID) DESC

--DROP TABLE #TempOrders;

--51(VERSION ALTERNATIVA DE 48)

--52. Countries with suppliers or customers (25 row(s) affected)

--Some Northwind employees are planning a business trip, and would like to visit as many suppliers and customers as possible. 
--For their planning, they’d like to see a list of all countries where suppliers and/or customers are based.

SELECT Country
FROM Suppliers
UNION
SELECT Country
FROM Customers

--53. Countries with suppliers or customers, version 2 (25 row(s) affected)

--The employees going on the business trip don’t want just a raw list of countries, they want more details. 
--We’d like to see output like the below, in the Expected Results.

SELECT supplierCountry.Country AS supplierCountry,customerCountry.Country AS customerCountry
FROM
(SELECT Country
 FROM Suppliers) supplierCountry
 FULL OUTER JOIN
(SELECT Country
 FROM Customers) customerCountry
 ON customerCountry.Country=supplierCountry.Country
GROUP BY supplierCountry.Country,customerCountry.Country
ORDER BY CASE WHEN supplierCountry.Country IS NULL THEN customerCountry.Country 
              ELSE supplierCountry.Country END,supplierCountry.Country ASC

--54.Countries with suppliers or customers - version 3 (25 row(s) affected)

--The output of the above is improved, but it’s still not ideal
--What we’d really like to see is the country name, the total suppliers, and the total customers.

SELECT ISNULL(supp.Country,custom.Country) AS Country,ISNULL(supp.TotalSuppliers,0) AS TotalSuppliers,
       ISNULL(custom.TotalCustomers,0) AS TotalCustomers
FROM
(SELECT Country,COUNT(*) AS TotalSuppliers
FROM Suppliers
GROUP BY Country) supp
FULL OUTER JOIN 
(SELECT Country,COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country) custom ON custom.Country=supp.Country

--55.First order in each country (21 row(s) affected)

--Looking at the Orders table—we’d like to show details for each order that was the first in that particular 
--country, ordered by OrderID.

--So, we need one row per ShipCountry, and CustomerID, OrderID, and OrderDate should be of the first order 
--from that country.

SELECT ord.ShipCountry,ord.CustomerID,ord.OrderID,FORMAT(ord.OrderDate,'yyyy-MM-dd') AS OrderDate
FROM
(SELECT ShipCountry,MIN(OrderID) AS OrderID
 FROM Orders
 GROUP BY ShipCountry) firstOrderCountry
INNER JOIN Orders ord ON ord.OrderID=firstOrderCountry.OrderID
ORDER BY ord.ShipCountry ASC

--56. Customers with multiple orders in 5 day period (71 row(s) affected)

--There are some customers for whom freight is a major expense when ordering from Northwind.
--However, by batching up their orders, and making one larger order instead of multiple 
--smaller orders in a short period of time, they could reduce their freight costs significantly.
--Show those customers who have made more than 1 order in a 5 day period. The sales people will use this to help customers reduce their costs.
--Note: There are more than one way of solving this kind of problem. For this problem, we will not be using Window functions.

SELECT InitialOrder.CustomerID,InitialOrder.OrderID,
       CAST(InitialOrder.OrderDate AS DATE) AS InitialOrderDate,NextOrder.OrderID AS NextOrderId,
       CAST(NextOrder.OrderDate AS DATE) AS NextOrderDate,
	   DATEDIFF(DAY,InitialOrder.OrderDate,NextOrder.OrderDate) AS DaysBetween
FROM Orders InitialOrder INNER JOIN Orders NextOrder ON (NextOrder.CustomerID=InitialOrder.CustomerID) 
     AND (InitialOrder.OrderID<NextOrder.OrderID) 
WHERE  DATEDIFF(DAY,InitialOrder.OrderDate,NextOrder.OrderDate)<=5
ORDER BY InitialOrder.CustomerID,InitialOrder.OrderID ASC

--57. Customers with multiple orders in 5 day period, version 2

--There’s another way of solving the problem above, using Window functions. We would like to see the following results.

SELECT ORDERS.CustomerID,ORDERS.OrderDate,ORDERS.NextOrderDate,DATEDIFF(DAY,ORDERS.OrderDate,ORDERS.NextOrderDate) AS DaysBetweenOrders
FROM
(SELECT CustomerID,CAST(OrderDate AS DATE) AS OrderDate,
       (LEAD(CAST(OrderDate AS DATE)) OVER (PARTITION BY CustomerID ORDER BY CustomerID,OrderDate)) AS NextOrderDate
FROM Orders) ORDERS
WHERE DATEDIFF(DAY,ORDERS.OrderDate,ORDERS.NextOrderDate) BETWEEN 0 AND 5
GROUP BY ORDERS.CustomerID,ORDERS.OrderDate,ORDERS.NextOrderDate
ORDER BY ORDERS.CustomerID ASC