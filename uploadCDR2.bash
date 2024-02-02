#!/bin/bash
#mysqlCommand=$(command -v mysql)
for FILE in  *.csv;	
do 
	echo "Processing file $FILE"	
	mysql -u root -e "LOAD DATA INFILE '$FILE' IGNORE INTO TABLE database.table FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\\n' IGNORE 1 ROWS; " 
    	mysql -u root -e "delete from database.table  where `name column` not REGEXP '^[0-9]+$'; "	 
	mysql -u root -e "update database.table set Report_Date =STR_TO_DATE(SUBSTRING_INDEX(`Start Time GMT`,' ',1), '%m/%d/%Y')  where  report_date is null ; "	

done
echo "Done"
