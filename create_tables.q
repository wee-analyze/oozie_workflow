CREATE EXTERNAL TABLE log_raw (
log_date CHAR(10),
log_time CHAR(8),
c_ip varchar(16),
cs_uname varchar(64),
s_ip varchar(16),
s_port INT,
cs_method CHAR(4),
url varchar(255))
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' ' --need to use the delimiter in the data
LOCATION "/data"; --this will create table and load data simultaneously
;

CREATE TABLE product_log_stats
(log_date CHAR(10),
visits BIGINT,
first CHAR(8),
last CHAR(8))
ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe';  --saves as JSON format. If you want another format instead, for example csv format, then you can use ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
;