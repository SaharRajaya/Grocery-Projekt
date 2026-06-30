-- Columnnames, types
select column_name, data_type
from information_schema."columns"
where table_schema = 'Grocery' 
and table_name = 'sales'

select column_name, data_type
from information_schema."columns"
where table_schema = 'Grocery' 
and table_name = 'products'

-- Converting empty text to null
update sales
set "SalesDate" = null
where "SalesDate" = '';

-- Changing SalesDate type to timestampz
alter table sales 
alter column "SalesDate" 
type timestamptz
using "SalesDate" :: timestamptz;


-- Missing Data Proportion
SELECT
    COUNT(*) FILTER (WHERE "SalesDate" is null) * 1.0 / COUNT(*) AS missing_anteil_salesdate,
    COUNT(*) FILTER (WHERE "SalesPersonID" is null) * 1.0 / COUNT(*) AS missing_anteil_salespersonid,
    COUNT(*) FILTER (WHERE "CustomerID" is null) * 1.0 / COUNT(*) AS missing_anteil_customerid,
    COUNT(*) FILTER (WHERE "ProductID" is null) * 1.0 / COUNT(*) AS missing_anteil_ProductID,
    COUNT(*) FILTER (WHERE "Quantity" is null) * 1.0 / COUNT(*) AS missing_anteil_Quantity,
    COUNT(*) FILTER (WHERE "Discount" is null) * 1.0 / COUNT(*) AS missing_anteil_Discount,
    COUNT(*) FILTER (WHERE "CustomerID" is null) * 1.0 / COUNT(*) AS missing_anteil_customerid
FROM sales


-- cleaning 1% missing data in SalesDate
delete 
from sales
where "SalesDate" is null

-- Is there any quantity = 0
select count(*)
from sales
where "Quantity" = 0

SELECT table_schema, table_name
FROM information_schema.views
WHERE table_name = 'sales_data_2';


