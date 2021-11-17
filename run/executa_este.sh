#!/bin/sh

for i in 1 2 3 4 5 6
do
	service mysql restart
	echo "PURGE BINARY LOGS BEFORE NOW();" | mysql -u super

	./runDatabaseDestroy.sh props.mysql
	./runDatabaseBuild.sh 	props.mysql
	./runBenchmark.sh 		props.mysql > "Log_teste_$i.txt"

	service mysql restart
	echo "PURGE BINARY LOGS BEFORE NOW();" | mysql -u super
	
done