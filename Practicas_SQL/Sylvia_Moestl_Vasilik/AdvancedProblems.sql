USE northwind;
/* Exercise 32 */
SELECT c.CustomerID, c.CompanyName, o.OrderID, sum(od.UnitPrice * od.Quantity) AS amount
FROM Customers AS c
INNER JOIN Orders AS o ON c.CustomerID = o.CustomerID
INNER JOIN OrderDetails AS od ON o.OrderID = od.OrderID
WHERE YEAR(o.OrderDate) = 2016
GROUP BY c.CustomerID, c.CompanyName, o.OrderID
HAVING sum(od.UnitPrice * od.Quantity) >= 10000
ORDER BY amount DESC;

/* Exercise 33 */
SELECT c.CustomerID, c.CompanyName, sum(od.UnitPrice * od.Quantity) AS amount
FROM Customers AS c
JOIN Orders AS o ON c.CustomerID = o.CustomerID
JOIN OrderDetails AS od ON o.OrderID = od.OrderID
WHERE o.OrderDate BETWEEN '20160101' AND '20170101'
GROUP BY c.CustomerID, c.CompanyName
HAVING sum(od.UnitPrice * od.Quantity) >= 15000
ORDER BY amount DESC;

/* Exercise 34 */
Select Customers.CustomerID,Customers.CompanyName,SUM(Quantity * UnitPrice) AS TotalsWithoutDiscount ,
       SUM(Quantity *UnitPrice *(1-Discount)) AS TotalsWithDiscount
From Customers Join Orders
     on Orders.CustomerID =Customers.CustomerID Join OrderDetails
     on Orders.OrderID =OrderDetails.OrderID
Where OrderDate >='20160101' and OrderDate  <'20170101'
Group by Customers.CustomerID,Customers.CompanyName
Having sum(Quantity * UnitPrice *(1-Discount))>10000
Order by TotalsWithDiscount DESC;


/* Exercise 35  NOTA--->ME TRAE SOLO 24 REGISTROS*/
Select EmployeeID,OrderID,OrderDate,EOMONTH(OrderDate ) 
From Orders
Where OrderDate =EOMONTH(OrderDate)
Order by EmployeeID,OrderID


/* Exercise 36 */
SELECT TOP 10 od.OrderID, COUNT(*) AS TotalOrders
FROM OrderDetails AS od
JOIN Orders ON od.OrderID = Orders.OrderID
GROUP BY od.OrderID
ORDER BY TotalOrders DESC


/* Exercise 37 NO HACER-->CASO MUY ESPECIFICO*/

--SELECT COUNT(*) * 0.02 INTO @nrow FROM Orders;
--SET @expr = CONCAT('SELECT OrderID FROM Orders ORDER BY RAND() LIMIT', @nrow);
--prepare stmt from @expr;
--EXECUTE stmt;

/* Exercise 38 */
SELECT OrderID
FROM OrderDetails
WHERE Quantity >= 60
GROUP BY OrderID, Quantity
HAVING COUNT(*) > 1
ORDER BY OrderID;

/* Exercise 39 */
;with PotentialDuplicates as (
Select OrderID 
From OrderDetails
Where Quantity >=60
Group By OrderID,Quantity
Having Count(*)>1)
Select
OrderID,ProductID,UnitPrice,Quantity,Discount
From OrderDetails 
Where
OrderID in(Select OrderID from PotentialDuplicates)
Order by OrderID,Quantity

/* Exercise 40 */
SELECT od.OrderID, ProductID, UnitPrice, Quantity, Discount
FROM OrderDetails AS od
JOIN (
	SELECT DISTINCT OrderID
	FROM OrderDetails
	WHERE Quantity >= 60
	GROUP BY OrderID, Quantity
	HAVING COUNT(*) > 1
) as ode
ON od.OrderID = ode.OrderID;

/* Exercise 41 */
SELECT OrderID,
		CAST(OrderDate AS DATE) AS OrderDate,
		CAST(RequiredDate AS DATE) AS RequiredDate,
        CAST(ShippedDate AS DATE) AS ShippedDate
FROM Orders
WHERE RequiredDate <=ShippedDate

/* Exercise 42 */
SELECT o.EmployeeID, e.LastName, COUNT(*) AS TotalLateOrders
FROM Employees AS e
JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
WHERE CAST(o.ShippedDate AS DATE) >= CAST(o.RequiredDate AS DATE)
GROUP BY o.EmployeeID, e.LastName
ORDER BY COUNT(*) DESC;

/* Exercise 43 */

---SOLUCION DEL LIBRO---
;With LateOrders as (
Select EmployeeID,Count(*) AS TotalOrders
From Orders 
Where RequiredDate <=ShippedDate
Group By EmployeeID)
,AllOrders as (
Select EmployeeID,Count(*) AS TotalOrders 
From Orders 
Group By EmployeeID)
Select Employees.EmployeeID,LastName,AllOrders.TotalOrders AS AllOrders,LateOrders.TotalOrders AS LateOrders 
From Employees
Join AllOrders on AllOrders.EmployeeID =Employees.EmployeeID
Join LateOrders on LateOrders.EmployeeID =Employees.EmployeeID

---SOLUCION CON SUB-CONSULTAS---
SELECT Employees.EmployeeID,LastName,AllOrders.TotalOrders AS AllOrders,LateOrders.TotalOrders AS LateOrders 
FROM Employees
INNER JOIN (Select EmployeeID,Count(*) AS TotalOrders 
            From Orders 
	        Group By EmployeeID) AllOrders on AllOrders.EmployeeID=Employees.EmployeeID
INNER JOIN (Select EmployeeID,Count(*) AS TotalOrders 
            From Orders 
	        Where RequiredDate <=ShippedDate 
	        Group By EmployeeID) LateOrders on LateOrders.EmployeeID=Employees.EmployeeID
ORDER BY Employees.EmployeeID ASC

/* Exercise 44 */ 

---SOLUCION DEL SCRIPT(TIENE ERRORES)---
--SELECT e.EmployeeID, e.LastName,COUNT(*) AS TotalOrders,late.TotalLateOrders
--FROM Employees AS e
--JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
--LEFT JOIN (
--	SELECT o.EmployeeID, e.LastName, COUNT(*) AS TotalLateOrders
--	FROM Employees AS e
--	JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
--	WHERE CAST(o.ShippedDate AS DATE) >= CAST(o.RequiredDate AS DATE)
--	GROUP BY o.EmployeeID, e.LastName
--	ORDER BY COUNT(*) DESC
--) AS late ON e.EmployeeID = late.EmployeeID
--GROUP BY e.EmployeeID, e.LastName,late.TotalLateOrders

---SOLUCION DEL LIBRO---
;With LateOrders as (
Select EmployeeID,Count(*) AS TotalOrders
From Orders 
Where RequiredDate <=ShippedDate
Group By EmployeeID)
,AllOrders as (
Select EmployeeID,Count(*) AS TotalOrders
From Orders 
Group By EmployeeID)
Select Employees.EmployeeID,LastName,AllOrders.TotalOrders AS AllOrders,LateOrders.TotalOrders AS LateOrders
From Employees Join AllOrders on AllOrders.EmployeeID=Employees.EmployeeID 
     Left Join LateOrders on LateOrders.EmployeeID =Employees.EmployeeID
Order by Employees.EmployeeID ASC

---USANDO SUB-CONSULTAS---
Select Employees.EmployeeID,LastName,AllOrders.TotalOrders AS AllOrders,LateOrders.TotalOrders AS LateOrders
From Employees 
INNER JOIN (Select EmployeeID,Count(*) AS TotalOrders
            From Orders 
            Group By EmployeeID) AllOrders on AllOrders.EmployeeID=Employees.EmployeeID 
LEFT JOIN (Select EmployeeID,Count(*) AS TotalOrders
           From Orders 
           Where RequiredDate <=ShippedDate
           Group By EmployeeID) LateOrders on LateOrders.EmployeeID =Employees.EmployeeID
Order by Employees.EmployeeID ASC

/* Exercise 45 */ 

---SOLUCION DEL SCRIPT(TIENE ERRORES)---
--SELECT e.EmployeeID,
--	   e.LastName,
--       COUNT(*) AS TotalOrders,
--       CASE WHEN late.TotalLateOrders IS NULL THEN 0 ELSE late.TotalLateOrders END AS TotalLateOrders
--FROM Employees AS e
--JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
--LEFT JOIN (
--	SELECT o.EmployeeID, e.LastName, COUNT(*) AS TotalLateOrders
--	FROM Employees AS e
--	JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
--	WHERE CAST(o.ShippedDate AS DATE) >= CAST(o.RequiredDate AS DATE)
--	GROUP BY o.EmployeeID, e.LastName
--	ORDER BY COUNT(*) DESC
--) AS late ON e.EmployeeID = late.EmployeeID
--GROUP BY e.EmployeeID, e.LastName;

---SOLUCION DEL LIBRO---
;With LateOrders as (
Select EmployeeID,Count(*) AS TotalOrders
From Orders 
Where RequiredDate <=ShippedDate
Group By EmployeeID)
,AllOrders as (
Select EmployeeID,Count(*) AS TotalOrders 
From Orders 
Group By EmployeeID)
Select Employees.EmployeeID,LastName,AllOrders.TotalOrders AS AllOrders,IsNull(LateOrders.TotalOrders,0) AS LateOrders
From Employees Join AllOrders on AllOrders.EmployeeID=Employees.EmployeeID
     Left Join LateOrders on LateOrders.EmployeeID=Employees.EmployeeID
Order by Employees.EmployeeID ASC

---USANDO SUB-CONSULTAS---
Select Employees.EmployeeID,LastName,AllOrders.TotalOrders AS AllOrders,IsNull(LateOrders.TotalOrders,0) AS LateOrders
From Employees
INNER JOIN (Select EmployeeID,Count(*) AS TotalOrders 
            From Orders 
            Group By EmployeeID)AllOrders on AllOrders.EmployeeID=Employees.EmployeeID
LEFT JOIN (Select EmployeeID,Count(*) AS TotalOrders
           From Orders 
           Where RequiredDate <=ShippedDate
           Group By EmployeeID) LateOrders on LateOrders.EmployeeID=Employees.EmployeeID
Order by Employees.EmployeeID ASC

/* Exercise 46 */

---SOLUCION DEL SCRIPT(TIENE ERRORES)---
--SELECT e.EmployeeID,
--	   e.LastName,
--       COUNT(*) AS TotalOrders,
--       CASE WHEN late.TotalLateOrders IS NULL
--       THEN 0
--       ELSE late.TotalLateOrders
--       END AS TotalLateOrders,
--       (CASE WHEN late.TotalLateOrders IS NULL
--       THEN 0
--       ELSE late.TotalLateOrders
--       END) / COUNT(*) AS 'Percent Late Orders'
--FROM Employees AS e
--JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
--LEFT JOIN (
--	SELECT o.EmployeeID, e.LastName, COUNT(*) AS TotalLateOrders
--	FROM Employees AS e
--	JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
--	WHERE CAST(o.ShippedDate AS DATE) >= CAST(o.RequiredDate AS DATE)
--	GROUP BY o.EmployeeID, e.LastName
--	ORDER BY COUNT(*) DESC
--) AS late ON e.EmployeeID = late.EmployeeID
--GROUP BY e.EmployeeID, e.LastName;

---SOLUCION DEL LIBRO---
;With LateOrders as (
Select EmployeeID,TotalOrders=Count(*)
From Orders 
Where RequiredDate <=ShippedDate
Group By EmployeeID)
,AllOrders as (
Select EmployeeID,TotalOrders=Count(*)
From Orders 
Group By
EmployeeID)
Select Employees.EmployeeID,LastName,AllOrders=AllOrders.TotalOrders
,LateOrders =IsNull(LateOrders.TotalOrders,0)
,PercentLateOrders =
(IsNull(LateOrders.TotalOrders,0)*1.00)/AllOrders.TotalOrders
From Employees Join AllOrders on AllOrders.EmployeeID =Employees.EmployeeID Left Join LateOrders
     on LateOrders.EmployeeID =Employees.EmployeeID

---USANDO SUB-CONSULTAS---
Select Employees.EmployeeID,LastName,AllOrders.TotalOrders AS AllOrders,IsNull(LateOrders.TotalOrders,0) AS LateOrders,
      (IsNull(LateOrders.TotalOrders,0)*1.00)/AllOrders.TotalOrders AS PercentLateOrders 
From Employees 
INNER JOIN (Select EmployeeID,Count(*) AS TotalOrders
            From Orders 
            Group By EmployeeID)AllOrders on AllOrders.EmployeeID =Employees.EmployeeID 
LEFT JOIN (Select EmployeeID,Count(*) AS TotalOrders
           From Orders 
           Where RequiredDate <=ShippedDate
           Group By EmployeeID) LateOrders on LateOrders.EmployeeID =Employees.EmployeeID
ORDER BY Employees.EmployeeID ASC

/* Exercise 47 */  ---FALTA VERIFICAR ESTE QUERY---
---SOLUCION DEL SCRIPT(TIENE ERRORES)---
--SELECT e.EmployeeID,
--	   e.LastName,
--       COUNT(*) AS TotalOrders,
--       CASE WHEN late.TotalLateOrders IS NULL
--       THEN 0
--       ELSE late.TotalLateOrders
--       END AS TotalLateOrders,
--       CAST((CASE WHEN late.TotalLateOrders IS NULL
--       THEN 0
--       ELSE late.TotalLateOrders
--       END) / COUNT(*) AS DECIMAL(8,2)) AS 'Percent Late Orders'
--FROM Employees AS e
--JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
--LEFT JOIN (
--	SELECT o.EmployeeID, e.LastName, COUNT(*) AS TotalLateOrders
--	FROM Employees AS e
--	JOIN Orders AS o ON o.EmployeeID = e.EmployeeID
--	WHERE CAST(o.ShippedDate AS DATE) >= CAST(o.RequiredDate AS DATE)
--	GROUP BY o.EmployeeID, e.LastName
--	ORDER BY COUNT(*) DESC
--) AS late ON e.EmployeeID = late.EmployeeID
--GROUP BY e.EmployeeID, e.LastName;

---SOLUCION DEL LIBRO---
;With LateOrders as (
Select EmployeeID,TotalOrders =Count(*)
From Orders 
Where RequiredDate <=ShippedDate
Group By EmployeeID)
,AllOrders as(
Select EmployeeID,TotalOrders =Count(*)
From Orders 
Group By EmployeeID)
Select Employees.EmployeeID,LastName,AllOrders=AllOrders.TotalOrders
,LateOrders =IsNull(LateOrders.TotalOrders,0)
,PercentLateOrders =
Convert(Decimal (10,2),(IsNull(LateOrders.TotalOrders,0)*1.00)/AllOrders.TotalOrders)
From Employees Join AllOrders on AllOrders.EmployeeID =Employees.EmployeeID 
     Left Join LateOrders on LateOrders.EmployeeID =Employees.EmployeeID


---USANDO SUB-CONSULTAS---
Select Employees.EmployeeID,LastName,AllOrders.TotalOrders AS AllOrders,
        IsNull(LateOrders.TotalOrders,0) AS LateOrders,
		Convert(Decimal (10,2),(IsNull(LateOrders.TotalOrders,0)*1.00)/AllOrders.TotalOrders) AS PercentLateOrders
From Employees 
INNER JOIN (Select EmployeeID, Count(*) AS TotalOrders
            From Orders 
            Group By EmployeeID) AllOrders on AllOrders.EmployeeID=Employees.EmployeeID 
LEFT JOIN(Select EmployeeID,Count(*) AS TotalOrders
          From Orders 
          Where RequiredDate <=ShippedDate
          Group By EmployeeID) LateOrders on LateOrders.EmployeeID=Employees.EmployeeID
ORDER BY Employees.EmployeeID ASC


/* Exercise 48 */
---SOLUCION DEL SCRIPT(TIENE ERRORES)---
--SELECT *,
--	   CASE WHEN
--       totorder BETWEEN 0 AND 1000 THEN 'Low' WHEN
--       totorder BETWEEN 1000 AND 5000 THEN 'Medium' WHEN
--       totorder BETWEEN 5000 AND 10000 THEN 'High' WHEN
--       totorder >= 10000 THEN 'Very high' 
--       END AS customergroup
--FROM (
--	SELECT o.CustomerID,
--		   c.CompanyName,
--		   SUM(od.UnitPrice * od.Quantity) AS totorder
--	FROM Orders AS o
--	JOIN OrderDetails AS od ON o.OrderID = od.OrderID
--	JOIN Customers AS c ON o.CustomerID = c.CustomerID
--	WHERE o.OrderDate BETWEEN '20160101' AND '20170101'
--	GROUP BY o.CustomerID, c.CompanyName
--	ORDER BY o.CustomerID, c.CompanyName
--) AS mt;

---SOLUCION DEL LIBRO---
;with Orders2016 as (
Select Customers.CustomerID,Customers.CompanyName,
       TotalOrderAmount=SUM(Quantity *UnitPrice)
From Customers
Join Orders on Orders.CustomerID =Customers.CustomerID Join OrderDetails on Orders.OrderID =OrderDetails.OrderID
Where OrderDate >='20160101' and OrderDate  <'20170101'
Group by Customers.CustomerID,Customers.CompanyName)
Select CustomerID,CompanyName,TotalOrderAmount,CustomerGroup =
       Case when TotalOrderAmount between 0 and 1000 then'Low'
            when TotalOrderAmount between 1001 and 5000 then'Medium'
            when TotalOrderAmount between 5001 and 10000 then'High'
            when TotalOrderAmount > 10000 then'Very High'End
from Orders2016
Order by CustomerID

---USANDO SUB-CONSULTAS---
Select CustomerID,CompanyName,TotalOrderAmount,CustomerGroup =
       Case when TotalOrderAmount between 0 and 1000 then'Low'
            when TotalOrderAmount between 1001 and 5000 then'Medium'
            when TotalOrderAmount between 5001 and 10000 then'High'
            when TotalOrderAmount > 10000 then'Very High'End
from (
Select Customers.CustomerID,Customers.CompanyName,
       TotalOrderAmount=SUM(Quantity *UnitPrice)
From Customers Join Orders on Orders.CustomerID=Customers.CustomerID Join OrderDetails on Orders.OrderID=OrderDetails.OrderID
Where OrderDate >='20160101' and OrderDate < '20170101'
Group by Customers.CustomerID,Customers.CompanyName) Orders2016
Order by CustomerID


/* Exercise 49 */
---SOLUCION DEL SCRIPT(TIENE ERRORES)---
--SELECT *,
--	   CASE WHEN
--       totorder BETWEEN 0 AND 1000 THEN 'Low' WHEN
--       totorder BETWEEN 1000 AND 5000 THEN 'Medium' WHEN
--       totorder BETWEEN 5000 AND 10000 THEN 'High' WHEN
--       totorder >= 10000 THEN 'Very high' 
--       END AS customergroup
--FROM (
--	SELECT o.CustomerID,
--		   c.CompanyName,
--		   SUM(od.UnitPrice * od.Quantity) AS totorder
--	FROM Orders AS o
--	JOIN OrderDetails AS od ON o.OrderID = od.OrderID
--	JOIN Customers AS c ON o.CustomerID = c.CustomerID
--	WHERE o.OrderDate BETWEEN '20160101' AND '20170101'
--	GROUP BY o.CustomerID, c.CompanyName
--	ORDER BY o.CustomerID, c.CompanyName
--) AS mt
--WHERE mt.CustomerID = 'MAISD';

---SOLUCION DEL LIBRO---
;with Orders2016 as (
Select Customers.CustomerID,Customers.CompanyName,TotalOrderAmount=SUM(Quantity *UnitPrice)
From Customers
Join Orders on Orders.CustomerID =Customers.CustomerID Join OrderDetails on Orders.OrderID =OrderDetails.OrderID
Where OrderDate >='20160101' and OrderDate  <'20170101'
Group by Customers.CustomerID,Customers.CompanyName)
Select CustomerID,CompanyName,TotalOrderAmount,
       CustomerGroup = case
       when TotalOrderAmount >=0 and TotalOrderAmount  <1000 then'Low'
       when TotalOrderAmount >=1000 and TotalOrderAmount  <5000 then'Medium'
       when TotalOrderAmount >=5000 and TotalOrderAmount  <10000 then'High'
       when TotalOrderAmount >=10000 then'Very High'
end
from Orders2016
Order by CustomerID


/*Exercise 50*/

---SOLUCION DEL LIBRO---
;with Orders2016 as (
Select Customers.CustomerID,Customers.CompanyName,TotalOrderAmount=SUM(Quantity *UnitPrice)
From Customers join Orders on Orders.CustomerID =Customers.CustomerID
     join OrderDetails on Orders.OrderID =OrderDetails.OrderID
Where OrderDate >='20160101' and OrderDate  <'20170101'
Group By Customers.CustomerID,Customers.CompanyName),
CustomerGrouping as (
Select CustomerID,CompanyName,TotalOrderAmount,CustomerGroup =
case
when TotalOrderAmount >=0 and TotalOrderAmount < 1000 then 'Low'
when TotalOrderAmount >=1000 and TotalOrderAmount < 5000 then 'Medium'
when TotalOrderAmount >=5000 and TotalOrderAmount < 10000 then 'High'
when TotalOrderAmount >=10000 then'Very High'
end from Orders2016)
Select CustomerGroup,TotalInGroup =Count(*),PercentageInGroup =Count(*)*1.0/(select count(*) from CustomerGrouping)
from CustomerGrouping
group by CustomerGroup
order by TotalInGroup  desc

---USANDO SUB-CONSULTAS---
;with CustomerGrouping as (
Select CustomerID,CompanyName,TotalOrderAmount,CustomerGroup =
case
when TotalOrderAmount>=0 and TotalOrderAmount <1000 then'Low'
when TotalOrderAmount>=1000 and TotalOrderAmount<5000 then'Medium'
when TotalOrderAmount>=5000 and TotalOrderAmount <10000 then'High'
when TotalOrderAmount>=10000 then'Very High'
end from (Select Customers.CustomerID,Customers.CompanyName,TotalOrderAmount=SUM(Quantity *UnitPrice)
          From Customers join Orders on Orders.CustomerID =Customers.CustomerID inner join OrderDetails on Orders.OrderID =OrderDetails.OrderID
          Where OrderDate >='20160101' and OrderDate  <'20170101'
          Group By Customers.CustomerID,Customers.CompanyName) Orders2016)

Select CustomerGroup,Count(*) AS TotalInGroup,(Count(*)*1.0/(select count(*) from CustomerGrouping)) AS PercentageInGroup
from CustomerGrouping
group by CustomerGroup
order by TotalInGroup  desc

/*Exercise 51*/

---SOLUCION DEL LIBRO---
;with Orders2016 as (
Select Customers.CustomerID,Customers.CompanyName,TotalOrderAmount =SUM(Quantity *UnitPrice)
From Customers inner Join Orders on Orders.CustomerID =Customers.CustomerID
     Join OrderDetails on Orders.OrderID =OrderDetails.OrderID
Where OrderDate>='20160101' and OrderDate<'20170101'
Group by Customers.CustomerID,Customers.CompanyName)

Select CustomerID,CompanyName,TotalOrderAmount,CustomerGroupName
from Orders2016 Join CustomerGroupThresholds
     on Orders2016.TotalOrderAmount between CustomerGroupThresholds.RangeBottom and CustomerGroupThresholds.RangeTop
Order by CustomerID

---USANDO SUB-CONSULTAS---

Select CustomerID,CompanyName,TotalOrderAmount,CustomerGroupName
from (Select Customers.CustomerID,Customers.CompanyName,TotalOrderAmount =SUM(Quantity *UnitPrice)
      From Customers inner Join Orders on Orders.CustomerID =Customers.CustomerID
           Join OrderDetails on Orders.OrderID =OrderDetails.OrderID
      Where OrderDate>='20160101' and OrderDate<'20170101'
      Group by Customers.CustomerID,Customers.CompanyName) Orders2016 
	  Join CustomerGroupThresholds on Orders2016.TotalOrderAmount between CustomerGroupThresholds.RangeBottom and CustomerGroupThresholds.RangeTop
Order by CustomerID

/*Exercise 52*/

---SOLUCION DEL LIBRO---
Select Country From Customers
Union
Select Country From Suppliers
Order by Country

/*Exercise 53*/

---SOLUCION DEL LIBRO---
;With SupplierCountries as
(Select Distinct Country from Suppliers),CustomerCountries as (Select Distinct Country from Customers)
Select SupplierCountries.Country AS SupplierCountry,CustomerCountry=CustomerCountries .Country
From SupplierCountries Full Outer Join CustomerCountries on CustomerCountries.Country=SupplierCountries.Country

---USANDO SUB-CONSULTAS---
Select SupplierCountries.Country AS SupplierCountry,CustomerCountry=CustomerCountries.Country
From (Select Distinct Country from Suppliers) SupplierCountries 
     Full Outer Join (Select Distinct Country from Customers) CustomerCountries 
	 on CustomerCountries.Country=SupplierCountries.Country

/*Exercise 54*/

---SOLUCION DEL LIBRO---
;With SupplierCountries as
(Select Country ,Total =Count(*)
 from Suppliers group by Country),CustomerCountries as
(Select Country ,Total =Count(*)from Customers group by Country)
Select Country=isnull(SupplierCountries.Country,CustomerCountries.Country),
       TotalSuppliers=isnull(SupplierCountries.Total,0),
	   TotalCustomers=isnull(CustomerCountries.Total,0)
From SupplierCountries Full Outer Join CustomerCountries on CustomerCountries.Country =SupplierCountries.Country

---USANDO SUB-CONSULTAS---
Select isnull(SupplierCountries.Country,CustomerCountries.Country) AS Country,
       isnull(SupplierCountries.Total,0) AS TotalSuppliers,
	   isnull(CustomerCountries.Total,0) AS TotalCustomers
From (Select Country ,Count(*) AS Total
      from Suppliers 
      group by Country) SupplierCountries 
	  Full Outer Join 
	  (Select Country ,Total =Count(*)
       from Customers 
       group by Country) CustomerCountries on CustomerCountries.Country=SupplierCountries.Country

/*Exercise 55*/

---SOLUCION DEL LIBRO---
;with OrdersByCountry as
(Select ShipCountry,CustomerID,OrderID ,OrderDate =convert(date,OrderDate),RowNumberPerCountry=Row_Number()
over (Partition by ShipCountry Order by ShipCountry,OrderID) From Orders)
Select ShipCountry,CustomerID,OrderID ,OrderDate
From OrdersByCountry 
Where RowNumberPerCountry=1
Order by ShipCountry

---USANDO SUB-CONSULTAS---
Select ShipCountry,CustomerID,OrderID ,OrderDate
From (Select ShipCountry,CustomerID,OrderID ,OrderDate =convert(date,OrderDate),RowNumberPerCountry=Row_Number()
      over (Partition by ShipCountry Order by ShipCountry,OrderID) From Orders) OrdersByCountry 
Where RowNumberPerCountry=1
Order by ShipCountry

/*Exercise 56*/

---SOLUCION DEL LIBRO---
Select InitialOrder.CustomerID,InitialOrderID =InitialOrder.OrderID,convert(date,InitialOrder.OrderDate) AS InitialOrderDate,
       NextOrder.OrderID AS NextOrderID,convert(date,NextOrder.OrderDate) AS NextOrderDate,
	   datediff(dd,InitialOrder.OrderDate,NextOrder.OrderDate) AS DaysBetween
from Orders InitialOrder join Orders NextOrder on InitialOrder.CustomerID=NextOrder.CustomerID
where InitialOrder.OrderID <NextOrder.OrderID and datediff(dd,InitialOrder.OrderDate,NextOrder.OrderDate)<=5
Order by InitialOrder.CustomerID,InitialOrder.OrderID


/*Exercise 57*/

---SOLUCION DEL LIBRO---
;With NextOrderDate as (
Select CustomerID,OrderDate=convert(date,OrderDate),NextOrderDate=convert(date,Lead(OrderDate,1) 
       OVER (Partition by CustomerID order by CustomerID,OrderDate))
From Orders)
Select CustomerID,OrderDate,NextOrderDate,DaysBetweenOrders =DateDiff(dd,OrderDate,NextOrderDate)
From NextOrderDate 
Where DateDiff(dd,OrderDate,NextOrderDate)<=5

---USANDO SUB-CONSULTAS---
Select CustomerID,OrderDate,NextOrderDate,DaysBetweenOrders =DateDiff(dd,OrderDate,NextOrderDate)
From (Select CustomerID,OrderDate=convert(date,OrderDate),NextOrderDate=convert(date,Lead(OrderDate,1) 
       OVER (Partition by CustomerID order by CustomerID,OrderDate))
From Orders) NextOrderDate 
Where DateDiff(dd,OrderDate,NextOrderDate)<=5





