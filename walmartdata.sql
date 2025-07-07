create database Walmart;
use Walmart;
select * from `walmartsalesdata.csv (2)` limit 10;
rename table `walmartsalesdata.csv (2)` to walmart_sales;
select * from walmart_sales limit 10;
select Gender from walmart_sales;
-- Total sale 
select sum(Total) as total_sales from walmart_sales;
select City from walmart_sales;
select City,sum(Total) as total_revenue from walmart_sales group by City order by total_revenue desc;
select `Product line`,sum(`gross income`) as total_gross_income from walmart_sales group by `Product line` order by total_gross_income desc;
select Payment ,count(*) as usage_count from walmart_sales group by Payment order by usage_count desc;
select `Customer type`,count(*) as customers from walmart_sales group by `Customer type` order by customers desc;
select Gender, `Customer type`, sum(Total) as total_customer_sales from walmart_sales group by Gender,`Customer type` order by total_customer_sales desc;
select City,Payment ,count(*) as city_payment_mode from walmart_sales group by City,Payment order by city_payment_mode;
-- average unit price 
select avg(`Unit price`) as average_sales from walmart_sales;
select Gender,`Product line`,avg(total) as average_total from walmart_sales group by Gender,`Product line` order by average_total desc;

select `Customer type`,`Invoice ID`,sum(Total) as total_spent,count(*) as transaction_count from walmart_sales group by `Customer type`, `Invoice ID` order by total_spent desc limit 10;
-- days of the week sales
SELECT Dayname(`Date`) as day_of_week,sum(Total) as total_revenue,avg(Total) as avg_transaction_value from walmart_sales group by Dayname(`Date`) order by total_revenue desc;