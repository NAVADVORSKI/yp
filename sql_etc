-- DROP TABLE stage.user_activity_log ;
-- DROP TABLE stage.user_order_log  ;
-- DROP TABLE stage.customer_research  ;

CREATE TABLE IF NOT EXISTS stage.customer_research (
    ID serial ,
    date_id TIMESTAMP ,
    category_id int ,
    geo_id int ,
    sales_qty int ,
    sales_amt NUMERIC (14,2) ,
    PRIMARY KEY (ID)
);
CREATE TABLE IF NOT EXISTS stage.user_activity_log (
    ID serial,
    date_time TIMESTAMP,
    action_id BIGINT,
    customer_id BIGINT,
    quantity BIGINT,
    PRIMARY KEY (ID)
);
CREATE TABLE IF NOT EXISTS stage.user_order_log (
    ID int,
    date_time TIMESTAMP,
    city_id int,
    city_name varchar(100),
    customer_id BIGINT,
    first_name varchar(100),
    last_name varchar(100),
    item_id int,
    item_name varchar(100),
    quantity BIGINT,
    payment_amount NUMERIC(14,2),
    PRIMARY KEY (ID)
    )

-- DROP TABLE stage.user_activity_log ;
-- DROP TABLE stage.user_order_log  ;
-- DROP TABLE stage.customer_research  ;

CREATE SCHEMA IF NOT EXISTS prod;

CREATE TABLE IF NOT EXISTS prod.customer_research (
    Date_id TIMESTAMP ,
    Geo_id int ,
    Sales_qty int ,
    Sales_amt NUMERIC (14,2)
);
CREATE TABLE IF NOT EXISTS prod.user_activity_log (
    Date_time TIMESTAMP,
    Customer_id BIGINT
);
CREATE TABLE IF NOT EXISTS prod.user_order_log (
    Date_time TIMESTAMP,
    Customer_id BIGINT,
    Quantity BIGINT,
    Payment_amount NUMERIC(14,2)
    )
;    
INSERT INTO prod.customer_research (
SELECT
	date_id,
	geo_id,
	sales_qty,
	sales_amt
FROM stage.customer_research)
;
INSERT INTO prod.user_activity_log (
SELECT
	date_time,
	customer_id
FROM stage.user_activity_log)
;
INSERT INTO prod.user_order_log (
SELECT
	date_time,
	customer_id,
	quantity,
	payment_amount
FROM stage.user_order_log)

-----------------------------------

CREATE TABLE stage.d_calendar (
	date_id int4 NOT NULL,
	fact_date date NULL,
	day_num int4 NULL,
	month_num int4 NULL,
	month_name varchar(8) NULL,
	year_num int4 NULL,
	CONSTRAINT d_calendar_pkey PRIMARY KEY (date_id)
);
CREATE INDEX d_calendar1 ON stage.d_calendar USING btree (date_id);

insert into stage.d_calendar (
SELECT 
		row_number() over () as date_id,
		date::date,
       EXTRACT(DAY FROM date) as day_num,
       EXTRACT(month FROM date) as month_num,
       case 
       	when EXTRACT(month FROM date) = 1 then 'Январь'
       	when EXTRACT(month FROM date) = 1 then 'Февраль'
       	when EXTRACT(month FROM date) = 1 then 'Март'
       	when EXTRACT(month FROM date) = 1 then 'Апрель'
       	when EXTRACT(month FROM date) = 1 then 'Май'
       	when EXTRACT(month FROM date) = 1 then 'Июнь'
       	when EXTRACT(month FROM date) = 1 then 'Июль'
       	when EXTRACT(month FROM date) = 1 then 'Август'
       	when EXTRACT(month FROM date) = 1 then 'Сентябрь'
       	when EXTRACT(month FROM date) = 1 then 'Октябрь'
       	when EXTRACT(month FROM date) = 1 then 'Ноябрь'
       	else 'Декабрь'
       end as month_name,
       EXTRACT(YEAR FROM date) as year_num
FROM generate_series(
    date '2021-01-01',
    date '2026-12-31',
    interval '1 day'
) as t(date)
)

-----------------------------------
	
CREATE TABLE stage.d_city (
	id serial4 NOT NULL,
	city_id int4 NULL,
	city_name varchar(50) NULL,
	CONSTRAINT d_city_pkey PRIMARY KEY (id)
);
CREATE INDEX d_city1 ON stage.d_city USING btree (city_id);
insert into stage.d_city (city_id, city_name)
(
select 
	distinct city_id,
	city_name
from stage.user_order_log
)

-----------------------------------

