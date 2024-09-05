create database sqlprj1;
use sqlprj1;

-- create table olympics
create table olympics(
ID int,
Name varchar(500),
Sex varchar(10),
Age int,
Height int,
Weight int,
Team varchar(350),
NOC varchar(100),
Games varchar(500),
Year int,
Season varchar(400),
City varchar(300),
Sport varchar(500),
Event varchar(400),
Medal varchar(200));

show variables like "secure_file_priv";

load data infile  "C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/Athletes_Transformed.csv"
into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;


select*from olympics
where medal='Gold' and age <15;
-- SQL PROJECT

-- 1. Show how many medal counts present for entire data
select medal,count(Medal) as totalmedalsearned
from olympics
where medal   <> 'nomedal' 
group by medal;

describe olympics;
select*from olympics
limit 4;
-- 2. Show count of unique sports present in Olympics
select count(distinct sport) as unisport_count
from olympics;


-- 3. Show how many different medals won by team India
select medal,count(medal) from olympics
where team='india' and medal <>'nomedal'
group by medal;





-- 4. Show event wise medals won by India show from highest to lowest medals won in order

select event,count(medal) as countofmedal,medal from olympics
where team='india' and medal <> 'nomedal'
group by medal,event
order by countofmedal desc;

-- 5. Show event wise medals won by India in order of year
select event,count(medal),medal,year from olympics
where team='india' and medal <> 'nomedal'
group by event,medal,year
order by year

;


-- 6. show country who won maximum medals.

select team,count(medal) as countofmedal from olympics
where medal <> 'nomedal'
group by team
order by countofmedal desc;


-- 7.show top 10 countries whowon gold
select medal,count(medal) as countofmedal ,team from olympics
where   medal='gold'
group by medal,team
order by countofmedal desc;


--  8. show in which year did United states won most gold medal
select count(medal) as countofmedal,year from olympics
where team='united states' and medal='gold' 
group by year
order by countofmedal desc
;

-- 9. In which sports United States has most medals.
select sport,count(medal)as countofmedal from olympics
where team='united states' and medal <> 'nomedal'
group by sport
order by countofmedal desc;


-- 10. Find top three players who won most medals along with their sports and country
select team as country,sport,name,count(medal) as countofmedal from olympics
where medal <> 'nomedal'
group by name,sport,team
order by countofmedal desc
limit 3;



-- 11. Find player with most gold medals in cycling along with his country.
select team as country,name,count(medal) from olympics
where medal='gold' and sport='cycling'
group by name,team
order by count(medal) desc
limit 1;


-- 12.Find player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select team as country,name,count(medal) as noofmedal from olympics
where sport ='basketball' and medal <> 'nomedal'
group by name,team
order by noofmedal desc
limit 1;


-- 13. Find out the count of different medals of the top basketball player Teresa Edwards
select name,medal,count(medal) from olympics
where name='teresa edwards' and medal <> 'nomedal'
group by medal,name;

-- 14. Find out medals won by male,female each year , Export this data and plot graph in excel
select medal,sex,year,count(medal) from olympics
where medal <> 'nomedal'
group by medal,sex,year
order by year;
