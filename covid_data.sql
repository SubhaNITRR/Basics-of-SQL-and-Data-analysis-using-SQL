create database covid;
use covid;
select * from covid_death;
select location,date,total_cases,new_cases,population from covid_death;
select location,date,total_cases,new_cases,population from covid_death
where location like "Bangla%";
select location,date,total_cases,new_cases,population from covid_death
where location like "D%";
select location,date,total_cases,new_cases,population,(new_cases/total_cases)*100 as new_cases_percentage,(total_cases/population)*100 as infected_percentage from covid_death
where location like "Ban%";
select * from covid_death limit 4;
select location,date,new_cases,total_cases,new_deaths,total_deaths,population from covid_death where location like "Ban%" order by date;
select location,date,new_cases,total_cases,(new_cases/total_cases)*100 as new_cases_percentage ,(total_cases/population)*100 as infected_percentage ,new_deaths,total_deaths,(total_deaths/population)*100 as death_percentage ,population from covid_death where location like "Ban%" order by date;
select location,date,population,max(new_cases) as most_cases_per_day,max(new_deaths) as highest_deaths_per_day from covid_death group by location order by population desc;
select location,date ,population,new_cases,total_cases,new_deaths,total_deaths from covid_death where location like "Ban%";
select location,date,max(total_cases) as Highest_infection_count,max(total_cases/population) as percentage_population_infected from covid_death
group by location,population
order by percentage_population_infected desc; 
select location,max(total_deaths) as total_death_count from covid_death
group by location
order by total_death_count desc;
select location,max(new_cases) as newcasescount from covid_death
where continent is not null
group by location
order by newcasescount desc;
select location,max(new_deaths) as newdeathcount from covid_death
where continent is not null
group by location
order by newdeathcount desc;
select continent,max(new_deaths) as newcasescount from covid_death
where continent is not null
group by continent
order by newcasescount desc;
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as death_percentage from covid_death
where location like "Chin%" 
order by date;
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as infected_death_percentage from covid_death
where location like "Chi%" 
order by infected_death_percentage desc ;
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 as infected_death_percentage from covid_death
where location like "Aus%" 
order by infected_death_percentage desc ;
select location,max(total_deaths) from covid_death
select sum(new_cases) as total_cases,sum(new_deaths) as total_deaths from covid_death
order by 1,2;
where location like "Argen%";
