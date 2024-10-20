CREATE TABLE product_details (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    product_description VARCHAR(255),
    category varchar(255),
    price float,
    stock int,
    rating float
);
show tables;
insert into product_details values(1,'apple','keeps doctor away','fruit',50,10,5);
select * from product_details;
create table customer_details (Name varchar(255), Phone_No int primary key,password varchar(255));
insert into customer_details values('Alan',7907020552,'alan123');
alter table customer_details modify Phone_No bigint;
select * from customer_details;
create table order_details (quantity int, prod_ID int, transaction_ID int);
create table transaction_details (transaction_ID int primary key, Phone_No bigint,total_amount float, Date date,payment_mode varchar(255),FOREIGN KEY (Phone_No) REFERENCES customer_details(Phone_No));
insert into transaction_details values(1,7907020552,50,"2024-10-20",'cash');
ALTER TABLE order_details
ADD FOREIGN KEY (prod_ID) REFERENCES Product_details(Product_ID);
ALTER TABLE order_details
ADD FOREIGN KEY (transaction_ID) REFERENCES transaction_details(transaction_ID);
insert into order_details values(1,1,1);
select * from order_details;
select * from transaction_details;
