# 1
SELECT CompanyName, Address, City, PostalCode, Country, Phone
FROM Customers
WHERE Country IN ('Mexico', 'Canada', 'USA');


#2
select FirstName, LastName, HireDate, DATEDIFF(CURDATE(), HireDate)/365 AS DaysSinceHireDateAnniversary
from Employees
order by DaysSinceHireDateAnniversary desc;

#3
select o.OrderID, e.FirstName, e.LastName
from Orders o 
join Employees e
	on e.EmployeeID = o.EmployeeID
where e.FirstName = 'Janet' and e.LastName = 'Leverling';


#4
select CategoryName, CategoryID from Categories;
select ProductName from Products;

#given the lack of a surefire way to identify packaging type, the products that definately are not bottles, glasses or jars are excluded
#and those that could be are included


select ProductName
from Products
where CategoryID IN (1, 2, 3, 4); 

#5
SELECT orderid, productid, (quantity * UnitPrice) AS before_discount, 
	(quantity * UnitPrice * (1 - discount)) AS after_discount
FROM OrderDetails;


#6
SELECT SupplierID, CompanyName
from Suppliers
where Fax IS NULL;

#7
select * from CustomerGroupThresholds;



CREATE TABLE LowGroup AS
SELECT
    c.CompanyName,
    SUM(od.Quantity) AS TotalOrderQuantity,
    'Low' AS GroupDescription
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY
    c.CompanyName
HAVING
    SUM(od.Quantity) < (SELECT MAX(RangeTop) FROM CustomerGroupThresholds WHERE GroupDescription = 'Low');

CREATE TABLE MediumGroup AS
SELECT
    c.CompanyName,
    SUM(od.Quantity) AS TotalOrderQuantity,
    'Medium' AS GroupDescription
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY
    c.CompanyName
HAVING
    SUM(od.Quantity) >= (SELECT MIN(RangeBottom) FROM CustomerGroupThresholds WHERE GroupDescription = 'Medium')
    AND
    SUM(od.Quantity) < (SELECT MAX(RangeTop) FROM CustomerGroupThresholds WHERE GroupDescription = 'Medium');

CREATE TABLE HighGroup AS
SELECT
    c.CompanyName,
    SUM(od.Quantity) AS TotalOrderQuantity,
    'High' AS GroupDescription
FROM
    Customers c
JOIN
    Orders o ON c.CustomerID = o.CustomerID
JOIN
    OrderDetails od ON o.OrderID = od.OrderID
GROUP BY
    c.CompanyName
HAVING
    SUM(od.Quantity) >= (SELECT MIN(RangeBottom) FROM CustomerGroupThresholds WHERE GroupDescription = 'High');
    
    

