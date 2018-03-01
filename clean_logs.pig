--load data from log_raw Hive table
lines = LOAD 'log_raw' USING org.apache.hive.hcatalog.pig.HCatLoader();


--take only url's that contain "product"
filteredlines = FILTER lines BY url matches '^/product.*'; 

--group by date
visits = GROUP filteredlines by log_date;

--aggregate the visits and take first and last time of events on those dates
aggvisits = FOREACH visits GENERATE group as log_date, COUNT(filteredlines) as visits, MIN(filteredlines.log_time) as first, MAX(filteredlines.log_time) as last;

--load the cleaned data into product_log_stats hive table. Columns must match in order to work
STORE aggvisits INTO 'product_log_stats' USING org.apache.hive.hcatalog.pig.HCatStorer();