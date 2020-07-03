#!/bin/bash

DST="/backup"

for DB in `mysqlshow -h$DBHOST -P$DBPORT -u$DBLOGIN -p$DBPASS`
do
 if [ "$DB" != "|"  -a "$DB" != "+--------------------+" -a "$DB" != "Databases" ]
     then
     echo "Generating mysql backup for database $DB"
     mysqldump -h "$DBHOST" -P $DBPORT -u$DBLOGIN -p$DBPASS "$DB" | gzip --rsyncable > "$DST/$DB.`date +%Y%m%d-%H%M`.sql.gz"
 fi
done

