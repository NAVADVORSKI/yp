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

