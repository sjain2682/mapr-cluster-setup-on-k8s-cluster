#!/bin/bash
rm -f ./sysbench_multipods/sysbench_*.yaml
for i in {1..40} 
do
sed -e s/test-simple/test-simple-$i/g sysbench.yaml >./sysbench_multipods/sysbench_$i.yaml 2>&1
sed -i s/vol1/vol$i/g ./sysbench_multipods/sysbench_$i.yaml 
cat ./sysbench_multipods/sysbench_$i.yaml
done
