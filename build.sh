#!/bin/sh

docker build -t kiwibackup/mysqlbackup .
docker push kiwibackup/mysqlbackup 
