use school;
create table bank_holiday(
holiday date,
start_time datetime,
end_time timestamp);
describe bank_holiday;
insert into bank_holiday values
(current_date(),current_date(),current_date());
select * from bank_holiday;
alter table bank_holiday modify end_time timestamp;
describe bank_holiday;
update bank_holiday set holiday=date_add(holiday,interval 5 day);
update bank_holiday set end_time=utc_timestamp();
select * from bank_holiday;