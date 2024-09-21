create database sqlproject;

use sqlproject;


show variables like "secure_file_priv"; 

create table olympics
(
ID int,
Name varchar(500),
Sex varchar(10),
Age int,
Height int,
Weight int,
Team varchar(500),
NOC varchar(500),
Games varchar (500),
Year int,
Season varchar(500),
City varchar(200),
Sport varchar(300),
Event varchar(800),
Medal varchar(200)
);


load data infile 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/Athletes_Transformed.csv' 
into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

create table olympic
(
ID int,
Name varchar(500),
Sex varchar(10),
Age int,
Height int,
Weight int,
Team varchar(500),
NOC varchar(500),
Games varchar (500),
Year int,
Season varchar(500),
City varchar(200),
Sport varchar(300),
Event varchar(800),
Medal varchar(200)
);


load data infile 'C:/ProgramData/MySQL/MySQL Server 8.4/Uploads/Athletes_Transformed.csv' 
into table olympic
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from olympic
limit 100;

-- SQL PROJECT

-- 1. Show how many medal counts present for entire data (done)
 select Medal, count(Medal) as CountMedal from olympic
 where Medal <> "NoMedal"
 group by Medal;

-- 2. Show count of unique sports present in Olympics (Done)
select Sport, count(Sport) from olympic
group by Sport;

-- 3. Show how many different medals won by team India
select Medal, Team, count(Medal) from olympic
where Team = "India"
group by Medal;


-- 4. Show event wise medals won by India show from highest to lowest medals won in order (done)
select Medal, Team, count(Medal), Event from olympic
where Team = "India" 
group by Medal, Event
order by  count(Medal) desc;

-- 5. Show event wise medals won by India in order of year
select Team, Event, Medal, Year from olympic
where Team = "India"
order by Year;

select Team, Event, Medal, count(Medal), Year from olympic
where Team = "India"
group by Medal, Event, Year
order by Year;

-- 6. show country who won maximum medals. (Done)
select Team, count(Medal) from olympic
group by Team
 order by count(medal) desc
 limit 1;


-- 7.show top 10 countries whowon gold (Done)
select Team, Medal, count(Medal) as CountMedal from olympic
where Medal = "Gold"
group by Team
order by CountMedal desc
limit 10;


--  8. show in which year did United states won most gold medal (Done)
select Medal, Year, count(Medal) from olympic
where Team = "United States" and Medal = 'Gold'
group by year, Medal
order by count(medal) desc
limit 1;



-- 9. In which sports United States has most medals. (Done)
select count(Medal),Sport from olympic
where Team="United States" and Medal <> 'NoMedal'
group by Sport
order by count(Medal) desc
limit 1;

-- 10. Find top three players who won most medals along with their sports and country (Done)

select Name, Team, Sport, count(Medal) from olympic
group by Name, Team, Sport
order by count(Medal) desc
limit 3;

-- 11. Find player with most gold medals in cycling along with his country.

select Name, Team, count(Medal) from olympic
where Medal = "Gold" and Sport ="Cycling"
group by Name, Team
order by count(Medal) desc
limit 1;

-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select Name, count(Medal) from olympic
where Sport = "Basketball" and Medal <> 'NoMedal'
group by Name
order by count(Medal) desc
limit 1;

-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select Name, Medal, count(Medal) from olympic
where Name = "Teresa Edwards"
group by Medal, Name;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select Sex, Year, Medal, count(Medal) from olympic
where Medal <> 'NoMedal'
group by Sex, Year, Medal
order by Year asc;



