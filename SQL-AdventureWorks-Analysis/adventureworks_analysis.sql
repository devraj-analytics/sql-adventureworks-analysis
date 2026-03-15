--Project: Querying a Large Relational Database

--Location:https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks
--File Name: AdventureWorks2012.bak


Use AdventureWorks2012



Select * From [Person].[PersonPhone]
Select * From [Person].[EmailAddress]
Select * From [Person].[Person]
Select * From [Person].[PhoneNumberType]


--Objective 1- Get all the details from the person table including email ID, phone number and phone number type
Select
    p.BusinessEntityID,
    p.FirstName,
    p.LastName,
    e.EmailAddress,
    ph.PhoneNumber,
    pnt.Name AS PhoneNumberType
From
    Person.Person AS p
    Left Join Person.EmailAddress AS e
        ON p.BusinessEntityID = e.BusinessEntityID
    Left Join Person.PersonPhone AS ph
        ON p.BusinessEntityID = ph.BusinessEntityID
    Left Join Person.PhoneNumberType AS pnt
        ON ph.PhoneNumberTypeID = pnt.PhoneNumberTypeID;




Select * From [Sales].[SalesOrderHeader]

--Objective 2- Get the details of the sales header order made in May 2011
Select * From Sales.SalesOrderHeader
Where OrderDate >= '2011-05-01'
And OrderDate < '2011-06-01'
Order By OrderDate;



Select * From [Sales].[SalesOrderDetail]
Select * From [Sales].[SalesOrderHeader]

--Objective 3- Get the details of the sales details order made in the month of May 2011
Select * 
From Sales.SalesOrderDetail AS sod
Join Sales.SalesOrderHeader AS soh
On sod.SalesOrderID=soh.SalesOrderID
Where OrderDate >= '2011-05-01'
And OrderDate < '2011-06-01'
Order By soh.OrderDate, sod.SalesOrderID, sod.SalesOrderDetailID;




--Objective 4- Get the total sales made in May 2011
Select Sum(TotalDue) AS TotalSalesMay2011
From Sales.SalesOrderHeader
Where OrderDate >= '2011-05-01'
And OrderDate < '2011-06-01';




--Objective 5- Get the total sales made in the year 2011 by month order by increasing sales
Select
    Year(OrderDate) AS Sales_Year,
    Month(OrderDate) AS Sales_Month,
    Sum(TotalDue) AS Total_Sales
From Sales.SalesOrderHeader
Where OrderDate >= '2011-01-01'
And OrderDate < '2012-01-01'
Group By Year(OrderDate), Month(OrderDate)
Order By Sum(TotalDue) ASC;


Select * From Person.Person
Select * From Sales.SalesOrderHeader
Select * From Sales.Customer
Select * From Person.BusinessEntityContact



--Objective 6- Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'
Select
    p.FirstName,
    p.LastName,
    Sum(soh.TotalDue) AS TotalSales
From Sales.SalesOrderHeader AS soh
Join Sales.Customer AS c
    On soh.CustomerID = c.CustomerID
Join Person.Person AS p
    ON p.BusinessEntityID = c.PersonID
Where p.FirstName = 'Gustavo'
  And p.LastName = 'Achong'
Group By
    p.FirstName,
    p.LastName;





