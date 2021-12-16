use school;
create table employeesnew(
emp_id int not null,
first_name varchar(20),
last_name varchar(20),
salary int,
primary key(emp_id));
insert into employeesnew values(009,'alok','sharma',35000);
insert into employeesnew values(010,'ratiranjan','kanungo',25000);
insert into employeesnew values(011,'govind','mohanty',29000);
insert into employeesnew values(004,'debasish','das',27000);
insert into employeesnew values(012,'irasis','swain',25000);
insert into employeesnew values(005,'imran','khan',23000);
insert into employeesnew values(013,'parimal','agarwal',33000);
insert into employeesnew values(009,'alok','sharma',35000);
select * from employeesnew;
select * from employees;
select emp_id,first_name,salary from employees union select emp_id,first_name,salary from employeesnew;
select emp_id,first_name from employees union select emp_id,first_name from employeesnew;
alter table employees add column dept varchar(20);
describe employees;
select * from employees;
create table department(
dept_id int,
dept_name varchar(20),
dept_capacity int,
dept_performance_scale int,
primary key(dept_id));
describe department;
insert into department values(001,'sales',90,7);
insert into department values(002,'marketing',220,8);
insert into department values(003,'finance',65,8);
insert into department values(004,'tech',40,9);
insert into department values(005,'r and d',10,8);
insert into department values(006,'hrd',20,7);
select * from department;   
alter table employees rename column dept to dept_name;
describe employees;
select e.emp_id,e.first_name,e.dept_name,d.dept_performance_scale from employees e inner join department d on e.dept_name=d.dept_name;
select k.first_name,p.dept_name,p.dept_capacity from employees k inner join department p on k.dept_name=p.dept_name;
update employees set dept_name='loan' where emp_id=004;
update employees set dept_name='pr' where emp_id=005;
select * from employees;
select k.first_name,k.dept_name,p.dept_capacity from employees k left outer join department p on k.dept_name=p.dept_name;
select e.emp_id,e.first_name,e.dept_name,d.dept_name,d.dept_performance_scale from employees e left outer join department d on e.dept_name=d.dept_name;
select e.emp_id,e.first_name,e.dept_name,d.dept_name,d.dept_performance_scale from employees e right join department d on e.dept_name=d.dept_name;
select k.first_name,p.dept_name,p.dept_capacity from employees k left outer join department p on k.dept_name=p.dept_name;
select e.emp_id,e.first_name,e.dept_name,d.dept_name,d.dept_capacity from employees e left outer join department d on e.dept_name=d.dept_name union
select e.emp_id,e.first_name,e.dept_name,d.dept_name,d.dept_capacity from employees e right outer join department d on e.dept_name=d.dept_name;
