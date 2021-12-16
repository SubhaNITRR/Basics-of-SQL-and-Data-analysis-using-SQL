create database library;
use library;
create table readers(
reader_id varchar(20),
fname varchar(20),
mname varchar(20),
lname varchar(20),
city varchar(20),
mobileno varchar(20),
occupation varchar(20),
dob date,
constraint readers_pk primary key(reader_id));
insert into readers values('C00001','Brijesh','kumar','Sharma','Delhi','9985547852','businesman','1976-05-09');
insert into readers values('C00002','Asish','kumar','Singh','madhyapradesh','9805471258','lecturer','1976-06-23');
insert into readers values('C00003','Dipen','vir','Patel','ahmedabad','9985693258','actor','1973-11-05');
insert into readers values('C00004','Alok','ranjan','Mohanty','cuttack','8982457451','service','1975-04-23');
insert into readers values('C00005','Pradeep','Singh','Sattawat','jodhpur','8982145789','player','1979-04-03');
insert into readers values('C00006','Sai','chiranjiv','Raju','visakhapatnam','9208125451','software engineer','1976-05-09');
insert into readers values('C00007','Ravi','sriam','reddy','hyderabad','9934524145','pilot','1975-04-23');
select * from readers;
describe readers; 
create table book(
bid varchar(20),
bname varchar(40),
bdomain varchar(20),
constraint book_pk primary key(bid));
alter table book modify bname varchar(40);
insert into book values('B00001','Ancient history of kalinga','History');
insert into book values('B00002','abc modern chemistry','science');
insert into book values('B00003','Baidehisa bilasha','odia literature');
insert into book values('B00004','Let us c','software');
insert into book values('B00005','time and space','science');
insert into book values('B00006','indian economy after independence','Economics');
insert into book values('B00007','war and peace','novel');
select * from book;
create table active_readers(
account_id varchar(20),
bid varchar(20),
reader_id varchar(20),
atype varchar(20),
astatus varchar(20),
constraint active_readers_pk primary key(account_id),
constraint active_readers_book_fk foreign key(bid) references book(bid),
constraint active_readers_reader_fk foreign key(reader_id) references readers(reader_id));
insert into active_readers values('A00001','B00001','C00001','regular','Active');
insert into active_readers values('A00002','B00005','C00005','regular','Active');
insert into active_readers values('A00003','B00006','C00006','premium','Suspended');
insert into active_readers values('A00004','B00003','C00003','regular','Active');
insert into active_readers values('A00005','B00004','C00004','premium','Terminated');
insert into active_readers values('A00006','B00007','C00007','premium','Suspended');
insert into active_readers values('A00007','B00002','C00002','regular','Terminated');
show tables;
select * from active_readers;
create table book_issue_details1(
book_issue_number varchar(20),
account_id varchar(20),
bid varchar(20),
bname varchar(20),
number_of_book_issued int,
constraint bookissue_details_pk primary key(book_issue_number),
constraint bookissue_details_active_readers1_fk foreign key(account_id) references active_readers(account_id));
alter table book_issue_details1 modify bname varchar(40);
insert into book_issue_details1 values('D00001','A00001','BOOOO1','Ancient history of kalinga',5);
select * from book_issue_details1;
show tables;       
