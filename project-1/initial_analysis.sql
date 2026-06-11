select * from walmart_sales ws;

--"Date" column is character varying data type i.e. its in text/string--
select column_name,data_type from information_schema.columns where table_name='walmart_sales';

-- output=Friday
select "Date",to_char(to_date("Date",'DD-MM-YYY'),'Day') as "Day" from walmart_sales ws where "Date"='01-07-2010';

--highest weekly_sale on 24th December 2010 i.e. Christmas Eve
select "Weekly_Sales","Date","Fuel_Price","Unemployment","CPI" from walmart_sales ws order by "Weekly_Sales" desc limit 1;

-- lowest weekly_sale on 3rd December 2010
select "Weekly_Sales","Date","Fuel_Price","Unemployment","CPI" from walmart_sales ws order by "Weekly_Sales" asc limit 1;

--Distinct Year
select distinct to_char(to_date("Date",'DD-MM-YYYY'),'YYYY') as "Year"
from walmart_sales ws; --Output: 2010,2011,2012

-- Monthly Sales of 2010
select to_char(to_date("Date",'DD-MM-YYY'),'Month') as "Month", sum("Weekly_Sales") as "Monthly_Sales" from walmart_sales ws 
where to_char(to_date("Date",'DD-MM-YYYY'),'YYYY')='2010' group by "Month" order by "Monthly_Sales" desc; 
-- Highest = December , Lowest = September --

--Monthly Sales of 2011
select to_char(to_date("Date",'DD-MM-YYY'),'Month') as "Month", sum("Weekly_Sales") as "Monthly_Sales" from walmart_sales ws 
where to_char(to_date("Date",'DD-MM-YYYY'),'YYYY')='2011' group by "Month" order by "Monthly_Sales" desc;
-- Highest = December , Lowest = January --

--Monthly Sales of 2012[till October]
select to_char(to_date("Date",'DD-MM-YYYY'),'Month') as "Month", sum("Weekly_Sales") as "Monthly_Sales" from walmart_sales ws 
where to_char(to_date("Date",'DD-MM-YYYY'),'YYYY')='2012' group by "Month" order by "Monthly_Sales" desc;
-- Highest = June , Lowest = January --

--Distinct Store's totalweekly sales [for 3 years: 2010-2012]
select distinct "Store" from walmart_sales ws order by "Store";

select "Store" , sum("Weekly_Sales") as "Total_Weekly_Sales" from walmart_sales group by "Store" 
order by "Total_Weekly_Sales" desc;
--Highest: Store 20, Lowest: Store 33 --

--Year wise, total weekly sales per store --
--2010:
select "Store", sum("Weekly_Sales") as "Total_Weekly_Sales" from walmart_sales ws 
where to_char(to_date("Date",'DD-MM-YYYY'),'YYYY')='2010' group by "Store" order by "Total_Weekly_Sales" desc;
--Highest: 14 Lowest:33--

--2011:
select "Store", sum("Weekly_Sales") as "Total_Weekly_Sales" from walmart_sales ws 
where to_char(to_date("Date",'DD-MM-YYYY'),'YYYY')='2011' group by "Store" order by "Total_Weekly_Sales" desc;
--Highest: 4 Lowest:33--

--2012:
select "Store", sum("Weekly_Sales") as "Total_Weekly_Sales" from walmart_sales ws 
where to_char(to_date("Date",'DD-MM-YYYY'),'YYYY')='2012' group by "Store" order by "Total_Weekly_Sales" desc;
--Highest: 4 Lowest:33--

--Why is Store 33's total weekly sales lowest for all 3 years? --
select * from walmart_sales ws where "Store"=33;

select * from walmart_sales ws where "Store"=4;

select max("Weekly_Sales") as "Max_Weekly_Sales", min("Weekly_Sales") as "Min_Weekly_Sales" from walmart_sales ws  
where "Store"=33;

select max("Weekly_Sales") as "Max_Weekly_Sales", min("Weekly_Sales") as "Min_Weekly_Sales" from walmart_sales ws  
where "Store"=4;

--Compare Store 4 and 33, via visualization--