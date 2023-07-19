-- Hyper Market Sales Management
--  Establish a schema to support the implementation.
create database cproject; # creating database
use cproject;
/* Prepare the Tables like products, customers, sales etc., with suitable constraints to store the 
records*/
create table products(product_id int primary key, # creating product table
product_name varchar(60) not null,
category varchar(40) not null,
price int);
create table customer(cid int primary key,# creating customer table
cname varchar(30) not null,
phn_no varchar(40) not null,
city varchar(40) not null,
state varchar(30) not null,
country varchar(20) not null);
drop tables customer;
create table sales(# creating sales table
sale_id int primary key,
product_id int,
foreign key(product_id) references products(product_id),
cid int,
foreign key (cid) references customer(cid),
sales_date date not null,
sales_price int not null,
sale_quantity int not null,
month_of_sale varchar(25) not null);
drop tables sales;
INSERT INTO Products (product_id, product_name, category, price) # inserting values into products table
VALUES (1, 'Samsung Galaxy S21', 'Electronics', 999),
       (2, 'Apple iPhone 13', 'Electronics', 1199),
       (3, 'Sony 65-inch 4K TV', 'Electronics', 1499),
       (4, 'HP Pavilion 15 Laptop', 'Electronics', 899),
       (5, 'Dell XPS 13 Laptop', 'Electronics', 1099),
       (6, 'Bose QuietComfort Earbuds', 'Electronics', 249),
       (7, 'Nike Air Max 270', 'Shoes', 129),
       (8, 'Adidas Ultraboost', 'Shoes', 139),
       (9, 'Levi\'s 501 Original Fit Jeans', 'Clothing', 69),
       (10, 'Calvin Klein T-Shirt', 'Clothing', 29),
       (11, 'Timberland Men\'s Boots', 'Shoes', 179),
       (12, 'Casio G-Shock Watch', 'Watches', 99),
       (13, 'Amazon Echo Dot', 'Electronics', 49),
       (14, 'Fitbit Charge 5', 'Electronics', 179),
       (15, ' Coffee Maker', 'Kitchen Appliances', 249),
       (16, 'KitchenAid Stand Mixer', 'Kitchen Appliances', 399),
       (17, 'Roomba Robot Vacuum', 'Home Appliances', 699),
       (18, 'Instant Pot Duo 7-in-1', 'Kitchen Appliances', 119),
       (19, 'SodaStream Fizzi', 'Kitchen Appliances', 89),
       (20, 'Lululemon Yoga Pants', 'Clothing', 98);
INSERT INTO Customer (cid, cname, phn_no, city, state, country) VALUES # inserting values into customer table
(1, 'Ram', '9876543210', 'Chennai', 'Tamil Nadu', 'India'),
(2, 'Nikitha', '9988776655', 'Pune', 'Maharashtra', 'India'),
(3, 'Anderson', '9123456780', 'Hyderabad', 'Telangana', 'India'),
(4, 'Alice Johnson', '9444444444', 'Bangalore', 'Karnataka', 'India'),
(5, 'Mathew', '9555555555', 'Chennai', 'Tamil Nadu', 'India'),
(6, 'Shalini', '9666666666', 'Pune', 'Maharashtra', 'India '),
(7, 'Arun', '9777777777', 'Hyderabad', 'Telangana', 'India'),
(8, 'Deepika', '9888888888', 'Bangalore', 'Karnataka', 'India'),
(9, 'Vijay', '8999999999', 'Chennai', 'Tamil Nadu', 'India'),
(10, 'Umar', '8901234567', 'Pune', 'Maharashtra', 'India'),
(11, 'Hari', '8098765432', 'Hyderabad', 'Telangana', 'India'),
(12, 'Rajagopal', '8000000000', 'Bangalore', 'Karnataka', 'India'),
(13, 'Kumar', '8111111111', 'Chennai', 'Tamil Nadu', 'India'),
(14, 'Akalya', '8222222222', 'Pune', 'Maharashtra', 'India'),
(15, 'Divya', '8333333333', 'Hyderabad', 'Telangana', 'India'),
(16, 'Karmeghakuzhali', '8444444444', 'Bangalore', 'Karnataka', 'India'),
(17, 'Thomas', '8555555555', 'Chennai', 'Tamil Nadu', 'India'),
(18, 'Salman', '8666666666', 'Pune', 'Maharashtra', 'India'),
(19, 'Rishi', '8777777777', 'Hyderabad', 'Telangana', 'India'),
(20, 'Dhoni', '8888888888', 'Bangalore', 'Karnataka', 'India');

       INSERT INTO sales (sale_id, product_id, cid, sales_date, sales_price,sale_quantity,month_of_sale)# inserting values into Sales table
VALUES (1, 1, 1, '2022-01-01', 999,11,'Jan'),
       (2, 2, 2, '2022-04-02', 1199,13,'Apr'),
       (3, 3, 3, '2022-01-01', 1499,16,'Jan'),
       (4, 4, 4, '2022-04-04', 899,67,'Apr'),
       (5, 5, 5, '2022-01-01', 1099,51,'Jan'),
       (6, 6, 6, '2022-04-06', 2490,26,'Apr'),
       (7, 7, 7, '2022-01-01', 129,14,'Jan'),
       (8, 8, 8, '2022-03-08', 139,13,'Mar'),
       (9, 9, 9, '2022-01-01', 69,21,'Jan'),
       (10, 10, 10, '2022-03-10', 29,24,'Mar'),
       (11, 11, 11, '2022-01-01', 179,31,'Jan'),
       (12, 12, 12, '2022-01-01', 99,14,'Jan'),
       (13, 13, 1, '2022-03-13', 49,16,'Mar'),
       (14, 14, 2, '2022-01-01', 179,21,'Jan'),
       (15, 15, 3, '2022-01-01', 249,17,'Jan'),
       (16, 16, 4, '2022-01-01', 399,19,'Jan'),
       (17, 17, 5, '2022-04-17', 1600,36,'apr'),
       (18, 18, 6, '2022-01-01', 119,15,'Jan'),
       (19, 19, 7, '2022-01-01', 89,9,'Jan'),
       (20, 20, 8, '2022-01-01', 98,8,'Jan');
       select * from products;
       select * from customer;
       select * from sales;
       -- Queries
       -- 1)Populate the data and display the data by joining the top sold product in Chennai and Bangalore
select p.product_id,p.product_name ,sum(s.sale_quantity) as total_Sales_in_bangolore_and_chennai from products p
inner join sales s on s.product_id=p.product_id
inner join customer c on c.cid=s.cid
where c.city in ('Chennai' , 'Banglore')
group by p.product_id
order by total_Sales_in_bangolore_and_chennai  desc
limit 1;

-- 2) Display the Products which are least sold in Pune and Hyderabad.
select p.product_id,p.product_name,sum(s.sale_quantity) as total_Sales_in_pune_and_hyderabad from products p
inner join sales s on s.product_id=p.product_id
inner join customer c on c.cid=s.cid
where c.city in ('Pune','Hyderabad')
group by p.product_id
order by total_Sales_in_pune_and_hyderabad asc
limit 1;
-- 3) Display the customers data who purchased >50,000/- in a month in any outlet.
select c.cid,c.cname,month_of_sale,sum(s.sales_price*s.sale_quantity) as total_sales from customer c

inner join sales s on s.cid=c.cid
where year(s.sales_date)=2022
group by c.cname,c.cid
having  total_sales>50000;
-- 4) List out top 10 products sold on 01st January 2022
select p.product_id,p.product_name ,s.sales_date from products p
inner join sales s on s.product_id=p.product_id
where s.sales_date='2022-01-01'
order by p.product_id desc
limit 10;
-- 5)Display the maximum, minimum and average sales of each product in the month of March 2022
select p. product_name,  max(s.sale_quantity) as max_sales,min(s.sale_quantity) as min_Sales,avg(s.sale_quantity) as average_sales
 from sales s
inner join products p on p.product_id=s.product_id
where extract(month from s.sales_date)=3 and extract(year from s.sales_date)=2022
group by p.product_name;
-- 6)observations for betterment in sale
/*--> exciting offers and good deals might be offered
-->like abroad countries ,special days like 'boxing day sale' ,'Black Friday sale' might be introduced which might increase the sale 
-->Analyze the Sales data and explore which product is selling the most and the least selling product
-->Monitoring Inventory Levels
-->Collect Customer Data and Feedback
-->Optimal pricing Startegies
--> Enhance online presence


-- 7)These are some of the common implementations that hypermarkets use for database management. Implementing these systems can help hypermarkets in India to improve their efficiency, reduce costs, and provide better customer experiences.
-- 7)These are some of the common implementations that hypermarkets use for database management. Implementing these systems can help hypermarkets in India to improve their efficiency, reduce costs, and provide better customer experiences.
Cloud-based Database Management
Using Data analytics tools
Real-time Reporting & Dashboarding
Customer feedback and reviews
Supply  Chain Management
E-commerce Integration
Customer Relationship Management(CRM)
Point of Sale(POS)
*/



