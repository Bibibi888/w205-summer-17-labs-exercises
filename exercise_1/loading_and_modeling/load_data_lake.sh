#!/bin/bash
#bin bash stuff

#make folders
mkdir data
cd data

#get data + unzip
wget -O Hospital_Revised_Flatfiles.zip "https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip" 
echo "Done downloading"
unzip Hospital_Revised_Flatfiles.zip


#from https://superuser.com/questions/295994/how-do-i-rename-files-with-spaces-using-the-linux-shell/295997
#clean data
for f in *\ *; do mv "$f" "${f// /_}"; done

#Clean our data and move to a new folder...
mkdir prepped
for f in *.csv; do tail -n +2 $f > prepped/$f ; done
cd prepped

#create folders + upload data
#Definition modeled off of https://en.wikipedia.org/wiki/Health_care_quality#Definition
hdfs dfs -mkdir /user/w205/ex_1
hdfs dfs -mkdir /user/w205/ex_1/complications
hdfs dfs -mkdir /user/w205/ex_1/infections
hdfs dfs -mkdir /user/w205/ex_1/survey
#hdfs dfs -mkdir /user/w205/ex_1/timely_and_effective_care
hdfs dfs -mkdir /user/w205/ex_1/payments
hdfs dfs -mkdir /user/w205/ex_1/readmissions
hdfs dfs -mkdir /user/w205/ex_1/outpatient_imaging
hdfs dfs -put Complications_-_Hospital.csv /user/w205/ex_1/complications/
hdfs dfs -put Healthcare_Associated_Infections_-_Hospital.csv /user/w205/ex_1/infections/
hdfs dfs -put HCAHPS_-_Hospital.csv /user/w205/ex_1/survey/
#hdfs dfs -put Timely_and_Effective_Care_-_Hospital.csv /user/w205/ex_1/timely_and_effective_care/
hdfs dfs -put Payment_-_Hospital.csv /user/w205/ex_1/payments/
hdfs dfs -put Readmissions_and_Deaths_-_Hospital.csv /user/w205/ex_1/readmissions/
hdfs dfs -put Outpatient_Imaging_Efficiency_-_Hospital.csv /user/w205/ex_1/outpatient_imaging/

