
	 --populate products
      insert into dim_product
select ProductID,ProductName, Discontinued from Northwind.dbo.Products

      --populate employees
      insert into DWN.dbo.dim_employee
  select [EmployeeID],[FirstName] + ' ' + [LastName] as EmployeeName, [City], [Country] 
  from Northwind.dbo.Employees
  
      --populate suppliers
      insert into DWN.dbo.dim_supplier
  Select SupplierID, CompanyName, City, Country from Northwind.dbo.Suppliers
      
      --poplulate customers
      insert into DWN.dbo.dim_customer
  select CustomerID, CompanyName, City, Country from Northwind.dbo.Customers
      
      
      --populate Date (refer to file)
            
      
      --Populate Fact table
      --select  *  from Northwind.dbo.Orders a, Northwind.dbo.[Order Details] b where a.OrderID = b.OrderID
      
      Insert into DWN.dbo.fact_sales
      Select
         (select d.customer_ident  from DWN.dbo.dim_customer d where d.customer_id = a.CustomerID) as Customer_ident,
         (select p.product_ident from DWN.dbo.dim_product p where p.product_id = b.ProductID) as Product_indent,
		(select  e.employee_ident from DWN.dbo.dim_employee e where e.employee_id = a.EmployeeID) as Employee_ident,
      (select  s.supplier_ident from DWN.dbo.dim_supplier s where s.supplier_id = (select supplierid from Northwind.dbo.Products pd where ProductID = b.ProductID )) as Supplier_ident,
      UnitPrice*Quantity-Discount TotalSales,
      (select dt.Datekey from DWN.dbo.dimdate dt where dt.DATE = OrderDate) as Datekey 
           
      From  Northwind.dbo.Orders a, Northwind.dbo.[Order Details] b where a.OrderID = b.OrderID