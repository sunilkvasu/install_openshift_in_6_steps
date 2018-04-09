#!/bin/bash

for i in `seq 1 100`;
do
	DIRNAME="vol$i"
	mkdir -p /mnt/data/$DIRNAME
        chcon -Rt svirt_sandbox_file_t /mnt/data/$DIRNAME
	sleep 5
	sed -i "s/name: vol`expr $i - 1`/name: vol$i/g" vol.yaml
	sed -i "s/path: \/mnt\/data\/vol`expr $i - 1`/path: \/mnt\/data\/vol$i/g" vol.yaml
	oc create -f vol.yaml
	echo "created volume $i"
done
