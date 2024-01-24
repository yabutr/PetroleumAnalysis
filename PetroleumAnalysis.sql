/* 

GLOBAL PETROLEUM TRADE ANALYSIS 

*/


select *
from dbo.Petroleum


-- Tables I want

--1. Oil Import & Export over time

select Year
	, sum(Trade_Value) as Total_value
from dbo.Petroleum
Group by Year
order by Year


--2. Total Oil Import & Export value by Country

Select sum(Trade_Value) as Total_value
	, Country
	, Continent
	, Action
from dbo.Petroleum
Group by action, country, Continent

--3. Total Oil Import & Export value by Continent

Select sum(Trade_Value) as Total_value
	, Continent
	, Action
from dbo.Petroleum
Group by action, Continent

--4. Top 10 Exporting Countries

select TOP 10 sum(trade_value) as Total_value
	, country
from dbo.Petroleum
where action in ('export')
group by Country
order by Total_value DESC 

--5. Top 10 Importing Countries

select TOP 10 sum(trade_value) as Total_value
	, country
from dbo.Petroleum
where action in ('import')
group by Country
order by Total_value DESC 

