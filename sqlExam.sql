create database exam;
use exam;

-- sales and profit by region in the year 2022
select region,sum(sales_amount) as sales,sum(profit) as profit from sales_data where year(orderDate)=2022 group by region;
-- Top 5 customers based on total purchase
select c.customerName as customers,sum(sales_amount) purchases,dense_rank() over (order by sum(sales_amount) desc) as CustomerPlace
  from sales_data s join customer_data c on s.customerId=c.customerId
  group by c.customerName limit 5;
  -- Products with >20% discount but positive profit
 select  p.productName as Product,`Discount (%)` as discount,s.profit from sales_data s join product_data p on s.productId=p.productId 
 where `Discount (%)`>20 and s.profit>0;
-- Region-wise average discount
select region,avg(`Discount (%)`) as averageDiscount from sales_data group by region;
 -- Year-wise sales growth %
 select year(orderDate) as year,count(orderId)/1000 as PercentageOfsalesOfThisYear from sales_data group by year(orderDate) order by year;
 -- medium questions 
 -- Product category with highest profit margin
 select p.category as category,avg((s.profit/s.sales_Amount)*100) as margin from product_data p join sales_data s on p.productId=s.productId
 group by category order by margin desc;
 -- AOV per customer segment
 select c.CustomerName, sum(s.sales_Amount)/sum(Quantity) as AOV from customer_data c join sales_data s on c.customerId=s.customerId 
 group by c.customerName;
 
 
 
 
 
 

 


