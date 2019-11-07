-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT Category.CategoryName, Product.ProductName FROM [Product]
JOIN Category on [Product].CategoryId = Category.Id


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT [Order].id, Shipper.CompanyName FROM [Order]
JOIN Shipper on [Order].ShipVia = Shipper.Id
WHERE OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT Product.ProductName, OrderDetail.Quantity FROM OrderDetail
JOIN Product on OrderDetail.ProductId = Product.Id
WHERE OrderId = '10251'
ORDER by ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT [Order].id as [Order Id], Customer.CompanyName as [Company Name], Employee.LastName as [Employee's Last Name] FROM [Order]
JOIN Customer, Employee
WHERE [Order].CustomerId = Customer.Id and [Order].EmployeeId = Employee.Id