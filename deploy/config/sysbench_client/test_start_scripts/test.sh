#!/bin/bash
set -x

# This script is for starting sysbench on pods

# copying and invoking cleanup script before starting test
for i in `kubectl get pods -n sysbench-tests |grep -i running|awk '{print $1}'`; do  kubectl cp ./cleanup.sh sysbench-tests/$i:./cleanup.sh; done 
for i in `kubectl get pods -n sysbench-tests |grep -i running|awk '{print $1}'`; do   kubectl exec -it -n sysbench-tests $i -- nohup /bin/bash -c ./cleanup.sh ; done

# copying sysbench prepare script and start it before sysbench fileio test start
for i in `kubectl get pods -n sysbench-tests |grep -i running|awk '{print $1}'`; do  kubectl cp ./prepare sysbench-tests/$i:./prepare; done 
for i in `kubectl get pods -n sysbench-tests |grep -i running|awk '{print $1}'`; do   kubectl exec -it -n sysbench-tests $i -- nohup /bin/bash -c ./prepare ; done

# copying and starting actual sysbench test
for i in `kubectl get pods -n sysbench-tests |grep -i running|awk '{print $1}'`; do  kubectl cp ./sysbench.sh sysbench-tests/$i:./sysbench.sh; done 
for i in `kubectl get pods -n sysbench-tests |grep -i running|awk '{print $1}'`; do   kubectl exec -it -n sysbench-tests $i -- nohup /bin/bash -c ./sysbench.sh ; done

#sleep 330
#for i in `kubectl get pods -n sysbench-tests |grep -i running|awk '{print $1}'`; do   kubectl exec -it -n sysbench-tests $i -- cat ./$i.log|head -1; done
#echo Throughput"
#for i in `kubectl get pods -n sysbench-tests |grep -i running|awk '{print $1}'`; do   kubectl exec -it -n sysbench-tests $i -- cat ./$i.log|grep "Total transferred"|awk '{print $8}'|tr -d "\("|tr -d "\)"|cut -d "." -f1; done |awk '{sum+=$1} END {print sum}'
#echo "IOPS"
#for i in `kubectl get pods -n sysbench-tests |grep -i running|awk '{print $1}'`; do   kubectl exec -it -n sysbench-tests $i -- cat ./$i.log|grep "Requests/sec executed"|awk '{print $1}'; done |awk '{sum+=$1} END {print sum}'
