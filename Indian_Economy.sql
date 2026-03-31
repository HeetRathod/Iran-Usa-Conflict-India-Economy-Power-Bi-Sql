create database india_economy_db;
use india_economy_db;

-- Table 1: Oil Prices
create table Oil_Prices (
  Record_ID int primary key auto_increment,
  Price_Date date,
  Brent_Crude_USD decimal(10,2),
  WTI_Crude_USD decimal(10,2),
  India_Petrol_INR decimal(10,2),
  India_Diesel_INR decimal(10,2)
);

-- Table 2: Exchange Rates
create table Exchange_Rates (
  Record_ID int primary key auto_increment,
  Rate_Date date,
  USD_INR decimal(10,4),
  EUR_INR decimal(10,4),
  Gold_Price_INR decimal(10,2)
);

-- Table 3: Inflation Data
create table Inflation_Data (
  Record_ID int primary key auto_increment,
  Inf_Date date,
  Overall_CPI decimal(5,2),
  Food_Inflation decimal(5,2),
  Fuel_Inflation decimal(5,2),
  Transport_Inflation decimal(5,2)
);

-- Table 4: Sector Impact
create table Sector_Impact (
  Record_ID int primary key auto_increment,
  Sector_Date date,
  Sector_Name varchar(50),
  Cost_Index decimal(10,2),
  Impact_Level varchar(20)
);

-- Table 5: Trade Data
create table Trade_Data (
  Record_ID int primary key auto_increment,
  Trade_Date date,
  Export_Value_Cr decimal(15,2),
  Import_Value_Cr decimal(15,2),
  Trade_Deficit_Cr decimal(15,2)
);

-- Table 6: Stock Market
create table Stock_Market (
  Record_ID int primary key auto_increment,
  Market_Date date,
  Nifty_50 decimal(10,2),
  Sensex decimal(10,2),
  Nifty_Energy decimal(10,2),
  Market_Sentiment varchar(20)
);

-- Table 7: Conflict Events Timeline
create table Conflict_Events (
  Event_ID int primary key auto_increment,
  Event_Date date,
  Event_Description varchar(255),
  Severity varchar(20)
);

create table if not exists FII_Flows (
  Record_ID int primary key auto_increment,
  Flow_Date date,
  FII_Buy_Cr decimal(15,2),
  FII_Sell_Cr decimal(15,2),
  Net_Flow_Cr decimal(15,2),
  Market_Impact varchar(30)
);

create table if not exists Aviation_Impact (
  Record_ID int primary key auto_increment,
  Impact_Date date,
  Flights_Cancelled INT,
  Weekly_Loss_Cr decimal(10,2),
  Airspace_Status varchar(50),
  Fuel_Surcharge_Pct decimal(5,2)
);

select * from Oil_Prices;
select * from Exchange_Rates;
select * from Inflation_Data;
select * from Sector_Impact;
select * from Trade_Data;
select * from Stock_Market;
select * from Conflict_Events;
select * from FII_Flows;
select * from Aviation_Impact;

-- Q1: Monthly oil price trend
select Price_Date, Brent_Crude_USD, India_Petrol_INR 
from Oil_Prices order by Price_Date;

-- Q2: Rupee depreciation over time
select Rate_Date, USD_INR 
from Exchange_Rates order by Rate_Date;

-- Q3: Highest inflation months
select Inf_Date, Overall_CPI, Food_Inflation 
from Inflation_Data order by Overall_CPI desc;

-- Q4: Most impacted sectors
select Sector_Name, avg(Cost_Index) as Avg_Cost_Index, Impact_Level 
from Sector_Impact 
group by Sector_Name, Impact_Level 
order by Avg_Cost_Index desc;

-- Q5: Trade deficit trend
select Trade_Date, Export_Value_Cr, Import_Value_Cr, Trade_Deficit_Cr 
from Trade_Data order by Trade_Date;

-- Q6: Stock market vs oil price (JOIN)
select o.Price_Date, o.Brent_Crude_USD, s.Nifty_50, s.Market_Sentiment
from Oil_Prices o 
join Stock_Market s on o.Price_Date = s.Market_Date
order by o.Price_Date;


insert into  Oil_Prices values
-- 2025 baseline (pre-conflict, moderate levels)
(NULL,'2025-01-01',76.20,71.50,94.10,86.80),
(NULL,'2025-02-01',79.40,74.30,95.60,88.20),
(NULL,'2025-03-01',82.10,77.20,96.80,89.50),
(NULL,'2025-04-01',85.30,80.10,97.90,90.40),
(NULL,'2025-05-01',83.60,78.40,97.20,89.90),
(NULL,'2025-06-01',80.20,75.60,96.10,88.70),
(NULL,'2025-07-01',78.50,73.80,95.40,88.10),
(NULL,'2025-08-01',74.80,70.20,93.80,86.60),
(NULL,'2025-09-01',72.30,67.90,92.50,85.40),
(NULL,'2025-10-01',70.10,65.80,91.20,84.10),
(NULL,'2025-11-01',68.50,64.20,90.40,83.30),
(NULL,'2025-12-01',66.80,62.90,89.60,82.70),
-- Jan-Feb 2026 pre-war
(NULL,'2026-01-01',67.50,63.40,90.10,83.00),
(NULL,'2026-02-01',72.80,68.10,92.80,85.60),
-- Mar 2026 WAR ERUPTS — Week by week data
(NULL,'2026-03-02',82.00,76.80,96.00,88.50),
(NULL,'2026-03-09',120.00,115.40,111.50,102.80),
(NULL,'2026-03-16',117.30,112.80,110.20,101.50),
(NULL,'2026-03-23',98.65,94.20,104.80,96.40),
(NULL,'2026-03-26',99.95,95.60,105.20,97.00);

INSERT INTO Exchange_Rates VALUES
(NULL,'2025-01-01',85.10,92.40,76200),
(NULL,'2025-02-01',85.35,92.70,77800),
(NULL,'2025-03-01',85.62,93.10,79400),
(NULL,'2025-04-01',85.80,93.40,81200),
(NULL,'2025-05-01',85.55,93.20,80600),
(NULL,'2025-06-01',85.40,93.00,79800),
(NULL,'2025-07-01',85.68,93.35,81500),
(NULL,'2025-08-01',85.90,93.60,83200),
(NULL,'2025-09-01',85.78,93.40,84600),
(NULL,'2025-10-01',86.05,93.85,86500),
(NULL,'2025-11-01',86.20,94.10,88900),
(NULL,'2025-12-01',86.45,94.40,91200),
-- Jan-Feb 2026 pre-war
(NULL,'2026-01-01',85.20,93.00,98500),
(NULL,'2026-02-01',86.80,94.20,104200),
-- Mar 2026 WAR — rupee crashes, gold surges
(NULL,'2026-03-02',88.40,96.10,108600),
(NULL,'2026-03-09',91.20,99.40,115800),
(NULL,'2026-03-16',92.34,100.80,121400),
(NULL,'2026-03-23',93.88,102.20,128650),
(NULL,'2026-03-26',93.40,101.80,126900);

insert into Inflation_Data values
(NULL,'2025-01-01',5.22,7.40,8.80,6.40),
(NULL,'2025-02-01',4.26,5.80,8.20,6.10),
(NULL,'2025-03-01',3.34,3.90,7.60,5.20),
(NULL,'2025-04-01',3.16,3.40,7.20,4.80),
(NULL,'2025-05-01',4.75,5.20,7.80,5.40),
(NULL,'2025-06-01',5.08,6.10,8.10,5.80),
(NULL,'2025-07-01',3.65,5.40,7.90,5.10),
(NULL,'2025-08-01',3.65,5.60,7.70,5.00),
(NULL,'2025-09-01',5.49,9.24,8.10,6.20),
(NULL,'2025-10-01',6.21,10.87,8.30,6.50),
(NULL,'2025-11-01',5.48,9.04,7.80,6.00),
(NULL,'2025-12-01',5.22,8.85,7.60,5.90),
-- Jan-Feb 2026 pre-war (benign CPI)
(NULL,'2026-01-01',4.31,5.10,7.20,5.40),
(NULL,'2026-02-01',3.20,4.20,6.80,5.00),
-- Mar 2026 WAR — inflation spiking from oil shock
(NULL,'2026-03-09',4.80,6.40,14.20,8.60),
(NULL,'2026-03-16',5.60,7.80,16.80,10.20),
(NULL,'2026-03-23',5.20,7.20,15.40,9.40);

insert into Sector_Impact values
-- Pre-war baseline (Jan 2026)
(NULL,'2026-01-01','Aviation',118.40,'Medium'),
(NULL,'2026-01-01','Shipping',112.30,'Low'),
(NULL,'2026-01-01','FMCG',106.80,'Low'),
(NULL,'2026-01-01','Manufacturing',114.20,'Medium'),
(NULL,'2026-01-01','Agriculture',104.50,'Low'),
(NULL,'2026-01-01','Hospitality',108.60,'Low'),
-- War start — Mar 1-2, 2026
(NULL,'2026-03-02','Aviation',172.50,'Critical'),
(NULL,'2026-03-02','Shipping',168.40,'Critical'),
(NULL,'2026-03-02','FMCG',124.60,'High'),
(NULL,'2026-03-02','Manufacturing',138.90,'High'),
(NULL,'2026-03-02','Agriculture',118.30,'Medium'),
(NULL,'2026-03-02','Hospitality',142.80,'High'),
-- Peak crisis — Mar 9, 2026 (Brent at $120)
(NULL,'2026-03-09','Aviation',198.40,'Critical'),
(NULL,'2026-03-09','Shipping',210.00,'Critical'),
(NULL,'2026-03-09','FMCG',138.20,'High'),
(NULL,'2026-03-09','Manufacturing',156.40,'Critical'),
(NULL,'2026-03-09','Agriculture',128.60,'High'),
(NULL,'2026-03-09','Hospitality',164.30,'Critical'),
-- Slight easing — Mar 23, 2026 (de-escalation hints)
(NULL,'2026-03-23','Aviation',165.20,'Critical'),
(NULL,'2026-03-23','Shipping',172.80,'Critical'),
(NULL,'2026-03-23','FMCG',128.40,'High'),
(NULL,'2026-03-23','Manufacturing',144.60,'High'),
(NULL,'2026-03-23','Agriculture',122.10,'Medium'),
(NULL,'2026-03-23','Hospitality',148.50,'High');

insert into Trade_Data values
(NULL,'2025-01-01',385200,522400,137200),
(NULL,'2025-02-01',392600,530800,138200),
(NULL,'2025-03-01',398400,538200,139800),
(NULL,'2025-04-01',374800,548600,173800),
(NULL,'2025-05-01',381200,544200,163000),
(NULL,'2025-06-01',378400,540800,162400),
(NULL,'2025-07-01',388600,534800,146200),
(NULL,'2025-08-01',394200,530400,136200),
(NULL,'2025-09-01',401800,536200,134400),
(NULL,'2025-10-01',382400,544600,162200),
(NULL,'2025-11-01',388600,540800,152200),
(NULL,'2025-12-01',396200,536600,140400),
-- Jan-Feb 2026 (pre-war)
(NULL,'2026-01-01',392400,534200,141800),
(NULL,'2026-02-01',404800,546200,141400),
-- Mar 2026 — WAR: import bill explodes due to $120 crude
(NULL,'2026-03-01',362400,628400,266000),
(NULL,'2026-03-09',348600,712800,364200),
(NULL,'2026-03-16',356800,694200,337400),
(NULL,'2026-03-23',368400,668600,300200);

insert into Stock_Market values
(NULL,'2025-01-01',23860,78500,24600,'Bullish'),
(NULL,'2025-02-01',22600,74400,23200,'Bearish'),
(NULL,'2025-03-01',22420,73900,22800,'Bearish'),
(NULL,'2025-04-01',24100,79200,24800,'Bullish'),
(NULL,'2025-05-01',24600,81000,25200,'Bullish'),
(NULL,'2025-06-01',25200,82800,25800,'Bullish'),
(NULL,'2025-07-01',25100,82400,25600,'Bullish'),
(NULL,'2025-08-01',25400,83200,26000,'Bullish'),
(NULL,'2025-09-01',26100,85600,26600,'Bullish'),
(NULL,'2025-10-01',24400,80100,24800,'Neutral'),
(NULL,'2025-11-01',23800,78200,24200,'Bearish'),
(NULL,'2025-12-01',23500,77100,24000,'Bearish'),
-- Jan-Feb 2026 (US-India trade deal optimism)
(NULL,'2026-01-01',23200,76200,23600,'Bearish'),
(NULL,'2026-02-01',27856,88400,28400,'Bullish'),
-- Mar 2026 WAR — crash then partial recovery
(NULL,'2026-03-02',26100,84200,26400,'Bearish'),
(NULL,'2026-03-09',24800,79800,24400,'Bearish'),
(NULL,'2026-03-16',23319,75155,23100,'Bearish'),
(NULL,'2026-03-19',22912,74068,22600,'Bearish'),
(NULL,'2026-03-24',22562,72643,22100,'Bearish'),
(NULL,'2026-03-25',23306,75273,23000,'Neutral');

insert into Conflict_Events values
(NULL,'2026-02-28','US-Israel launch coordinated airstrikes on Iran','Critical'),
(NULL,'2026-03-01','Strait of Hormuz closed to commercial shipping','Critical'),
(NULL,'2026-03-01','Iran Supreme Leader Khamenei killed in strikes','Critical'),
(NULL,'2026-03-01','350 Indian flights cancelled — airspace closure','High'),
(NULL,'2026-03-02','Brent crude surges to $82 — 12% single day spike','High'),
(NULL,'2026-03-02','India LPG price raised by Rs 60 per cylinder','High'),
(NULL,'2026-03-05','Iranian missile strikes on UAE and Saudi Arabia','Critical'),
(NULL,'2026-03-09','Brent crude hits $120 — 50% spike in one week','Critical'),
(NULL,'2026-03-09','Rupee falls to record low INR 92.34 vs dollar','Critical'),
(NULL,'2026-03-09','India invokes Essential Commodities Act for LPG','High'),
(NULL,'2026-03-10','Indian Navy put on standby for tanker escorts','High'),
(NULL,'2026-03-15','India-Russia oil talks resume — supply rerouting','Medium'),
(NULL,'2026-03-19','Israel strikes Iran LNG refinery — gas prices surge','Critical'),
(NULL,'2026-03-23','Trump hints at 5-day strike pause — market relief','Medium'),
(NULL,'2026-03-24','Rupee hits record low INR 93.88 — Nifty 1-yr low','High'),
(NULL,'2026-03-25','Brent falls below $100 on ceasefire hopes','Medium'),
(NULL,'2026-03-26','15-point US peace plan sent to Iran — negotiations','Low');

insert into FII_Flows values
(NULL,'2025-12-01',42800,38400,4400,'Neutral'),
(NULL,'2026-01-01',38200,56400,-18200,'Bearish'),
(NULL,'2026-02-01',62400,44200,18200,'Bullish'),
(NULL,'2026-03-02',28400,68600,-40200,'Bearish'),
(NULL,'2026-03-09',18200,86400,-68200,'Bearish'),
(NULL,'2026-03-16',22400,78600,-56200,'Bearish'),
(NULL,'2026-03-23',34800,62400,-27600,'Bearish'),
(NULL,'2026-03-25',48200,42800,5400,'Neutral');

insert into Aviation_Impact values
(NULL,'2026-03-01',350,875.00,'Iran airspace closed — westbound rerouted','28.40'),
(NULL,'2026-03-02',280,700.00,'UAE-Saudi airspace partial closure','24.20'),
(NULL,'2026-03-09',420,1050.00,'Full Middle East airspace disruption','32.60'),
(NULL,'2026-03-16',310,775.00,'Alternative northern route via CIS','26.80'),
(NULL,'2026-03-23',180,450.00,'Partial routes restored — Oman corridor','18.40'),
(NULL,'2026-03-25',90,225.00,'Further easing — de-escalation hopes','12.20');

alter table Oil_Prices add Period_Label varchar(30);

update Oil_Prices set Period_Label =
  case
    when Price_Date < '2026-02-28' then 'Pre-War Baseline'
    when Price_Date between '2026-02-28' and '2026-03-08' then 'War Start'
    when Price_Date between '2026-03-09' and '2026-03-16' then 'Peak Crisis'
    when Price_Date > '2026-03-16' then 'De-escalation'
  end;

set SQL_SAFE_UPDATES = 0;

select Price_Date, Brent_Crude_USD, Period_Label
from Oil_Prices
where Period_Label is null
order by Price_Date;

