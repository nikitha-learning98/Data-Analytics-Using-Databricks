/*Listing all the queries I have used for exploring datasets*/

show catalogs; --Lists all the available catalogs.

show schemas; --Lists all the schemas in current catalog.

SHOW TABLES; --Lists all the tables in the current schema.

DESCRIBE TABLE dim_customers; --Inspect Table structure.

==============================================================
  
--Lists unique customer countries
select distinct country from dim_customers ;


--Lists product categories, subcategories, and products
select 
category,
subcategory,
product_name
from dim_products;

==============================================================

--Lists total sales, total customers, total products, and total orders
select 
sum(fs.sales_amount) as TotalSales,
count(c.customer_key) as TotalCustomers,
count(p.product_id) as TotalProducts,
count(fs.order_number) as TotalOrders
from fact_sales fs
left join dim_products p
on fs.product_key = p.product_key
left join dim_customers c
on fs.customer_key = c.customer_key;

==============================================================
--Lists Sales by Product 
select 
p.product_name ,
sum(sales_amount) as Sales
from workspace.salesdb.fact_sales f
left join workspace.salesdb.dim_products p
on f.product_key = p.product_key
group by p.product_name
order by Sales desc

==============================================================
--Lists sales by category
select 
sum(sales_amount) as Sales,
p.category 
from workspace.salesdb.fact_sales f
left join workspace.salesdb.dim_products p
on f.product_key = p.product_key
group by p.category;

==============================================================
--Lists Orders over time
select 
date_trunc('month',order_date),
Sum(sales_amount)
from workspace.salesdb.fact_sales
group by date_trunc('month',order_date)


