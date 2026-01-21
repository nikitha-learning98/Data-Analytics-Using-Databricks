/*Sales Dashboard Dataset Queries*/
select 
sum(fs.sales_amount) as TotalSales,
count(c.customer_key) as TotalCustomers,
count(p.product_id) as TotalProducts,
count(fs.order_number) as TotalOrders,
sum(fs.price) as TotalPrice,
sum(fs.quantity) as TotalQuantity
from fact_sales fs
left join dim_products p
on fs.product_key = p.product_key
left join dim_customers c
on fs.customer_key = c.customer_key;

--Lists Sales by Product 
select 
sum(sales_amount) as Sales,
p.product_name 
from workspace.salesdb.fact_sales f
left join workspace.salesdb.dim_products p
on f.product_key = p.product_key
group by p.product_name

--Lists Orders over time
select 
date_trunc('month',order_date),
Sum(sales_amount)
from workspace.salesdb.fact_sales
group by date_trunc('month',order_date)

/*========================================================*/
  
/*Customer Dashboard Dataset Queries*/

  --Tptal customer count
select count(*) as totalCustomers
from dim_customers;

--Average Sales per customer
SELECT
  AVG(total_sales) AS avg_sales_per_customer
FROM
  (
    SELECT
      customer_key,
      SUM(sales_amount) AS total_sales
    FROM fact_sales
    WHERE customer_key IS NOT NULL
    GROUP BY customer_key
  )

--Total order count
 select count(distinct order_number) as totalorders
 from fact_sales

--Orders by Age Group
with cte_agegroup as
(select 
customer_key,
case  
 when age<30 then 'under 30'
 when age between 30 and 60 then 'between 30 and 60'
 when age> 60 then 'above 60'
 else 'unknown'
end as AgeGroup
from (select 
*,
datediff(year, birthdate ,current_date) as age
from dim_customers)t)

select 
cte.AgeGroup,
count(distinct fs.order_number)  as distinct_orders
from fact_sales fs 
left join cte_agegroup cte 
on fs.customer_key = cte.customer_key
group by cte.AgeGroup

/*Top 10 Customer by sales*/
select 
customer_key, 
sum(sales_amount)
from fact_sales
group by customer_key
order by sum(sales_amount) desc
limit 10
 
