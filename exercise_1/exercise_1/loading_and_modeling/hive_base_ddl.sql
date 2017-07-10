-- Complications - Hospital

DROP TABLE complications;
CREATE EXTERNAL TABLE complications (pid INT, hospital STRING, addr STRING, city STRING, state STRING, zip INT, county STRING, phone_no INT, measure_name STRING, measure_id STRING, compare_to_nat STRING, denom STRING, score DECIMAL, lower_est STRING, higher_est STRING, footnote STRING, start_date DATE, end_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"', "escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/root/ex_1/complications';



-- Healthcare Associated Infections - Hospital

DROP TABLE infections;
CREATE EXTERNAL TABLE infections (pid INT, hospital STRING, addr STRING, city STRING, state STRING, zip INT, county STRING, phone_no STRING, measure_name STRING, measure_id STRING,  compare_to_nat STRING, score DECIMAL, footnote STRING, start_date DATE, end_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"', "escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/root/ex_1/infections';



-- HCAHPS - Hospital

DROP TABLE survey;
CREATE EXTERNAL TABLE survey (pid INT, hospital STRING, addr STRING, city STRING, state STRING, zip INT, county STRING, phone_no INT, measure_id STRING, question STRING, answer_desc STRING, rating STRING, rating_footnote STRING, answer_perc STRING, answer_perc_footnote STRING, num_completed_serveys STRING, num_completed_serveys_footnote STRING, response_rate_perc STRING, response_rate_perc_footnote STRING, start_date DATE, end_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"', "escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/root/ex_1/survey';



-- Timely and Effective Care - Hospital

DROP TABLE timely_and_effective_care;
CREATE EXTERNAL TABLE timely_and_effective_care (pid INT, hospital STRING, addr STRING, city STRING, state STRING, zip INT, county STRING, phone_no INT, condition STRING, measure_id STRING, measure_name STRING, score DECIMAL, sample STRING, footnote STRING, start_date DATE, end_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"', "escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/root/ex_1/timely_and_effective_care';

-- Payments - Hospital

DROP TABLE payments;
CREATE EXTERNAL TABLE payments (pid INT, hospital STRING, addr STRING, city STRING, state STRING, zip INT, county STRING, phone_no INT, measure_name STRING, measure_id STRING, category STRING, denom STRING, payment INT, lower_est STRING, higher_est STRING, footnote STRING, start_date DATE, end_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"', "escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/root/ex_1/payments';




-- READMISSION_REDUCTION.csv

DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions (pid INT, hospital STRING, addr STRING, city STRING, state STRING, zip INT, county STRING, phone_no INT, measure_name STRING, measure_id STRING, compare_to_nat STRING, denom STRING, score DECIMAL, lower_est STRING, higher_est STRING, footnote STRING, start_date DATE, end_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"', "escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/root/ex_1/readmissions';

-- Outpatient_Imaging_Efficiency_-_Hospital.csv 

DROP TABLE outpatient_imaging;
CREATE EXTERNAL TABLE outpatient_imaging (pid INT, hospital STRING, addr STRING, city STRING, state STRING, zip INT, county STRING, phone_no INT, measure_id STRING, measure_name STRING, score DECIMAL, footnote STRING, start_date DATE, end_date DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde' WITH SERDEPROPERTIES (
"separatorChar" = ",", "quoteChar" = '"', "escapeChar" = '\\' )
STORED AS TEXTFILE
LOCATION '/user/root/ex_1/outpatient_imaging';
