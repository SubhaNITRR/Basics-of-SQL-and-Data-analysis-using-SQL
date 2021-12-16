use school;
create table bank_details(
product char(20),
quantity int,
price real,
purchase_cost decimal(6,2),
estimated_sales_price float);
describe bank_details;
insert into bank_details values('paycard',3,330,8008,9009);
select * from bank_details;
insert into bank_details values('paypoints',4,200,8000,6800);
alter table bank_details add geo_location varchar(20);
update bank_details set geo_location='kolkata' where quantity=3;
select geo_location from bank_details where product='paycard';
select char_length(product) from bank_details where product='paycard';
select char_length(product) from bank_details where product='paypoints';
alter table bank_details modify product varchar(25);
describe bank_details;
alter table bank_details modify product varchar(20);
describe bank_details;
select product as new_product from bank_details;
select substr(product,1,4) from bank_details;
select * from bank_details limit 2;


















