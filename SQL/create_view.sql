-- Create a view
create view sales_data as
select sales."SalesID", sales."CustomerID", sales."SalesDate", customers."CityID", 
sales."ProductID", products."ProductName", products."Price",products."CategoryID", 
categories."CategoryName", sales."Quantity", sales."Discount", cities."CityName", 
countries."CountryID", countries."CountryName",
products."Price" * sales."Quantity" AS revenue
from sales
join products on products."ProductID" = sales."ProductID"
join customers on customers."CustomerID" = sales."CustomerID"
join categories on categories."CategoryID" = products."CategoryID"
join cities on customers."CityID" = cities."CityID"
join countries on cities."CountryID" = countries."CountryID";