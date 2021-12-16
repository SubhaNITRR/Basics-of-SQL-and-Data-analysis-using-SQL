create database bank;
use bank;
show databases;
use bank;
create table Customers_personal_info(
customer_id bigint,
customer_name varchar(20),
date_of_birth date,
guardian_name varchar(20),
marital_status varchar(20),
identification_doc_type varchar(20),
id_doc_no varchar(20),
citizenship varchar(20),
constraint cust_pers_info_pk primary key(customer_id));
describe customers_personal_info;
create table customers_refference_info(
customer_id bigint,
refference_account_no bigint(16),
refference_account_name varchar(20),
refference_account_address varchar(50),
relation varchar(20),
constraint cust_ref_info_pk primary key(customer_id),
constraint cust_ref_info_fk foreign key(customer_id) references customers_personal_info(customer_id));

show tables;
create table banks_info(
ifsc_code varchar(15),
bank_name varchar(25),
bank_branch varchar(25),
constraint  bank_info_pk primary key(ifsc_code));
show tables;
create table accounts_info(
account_no bigint(16),
account_type varchar(20),
registration_date date,
activation_date date,
interest decimal(7,2),
initial_deposit bigint(16),
customer_id bigint,
ifsc_code varchar(15),
constraint acc_info_pk primary key(account_no),
constraint acc_info_cust_fk foreign key(customer_id) references customers_personal_info(customer_id),
constraint acc_info_bank_fk foreign key(ifsc_code) references banks_info(ifsc_code));

show tables ;

 