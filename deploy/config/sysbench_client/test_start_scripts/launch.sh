#!/bin/bash

for i in {1..10}; do kubectl exec -it -n mapr-examples test-simple-$i -- nohup /bin/bash -c /tmp/sysbench.sh ; done &
for j in {11..20}; do kubectl exec -it -n mapr-examples test-simple-$j -- nohup /bin/bash -c /tmp/sysbench.sh ; done &
#for k in {21..30}; do kubectl exec -it -n mapr-examples test-simple-$k -- nohup /bin/bash -c /tmp/sysbench.sh ; done &
#for l in {31..40}; do kubectl exec -it -n mapr-examples test-simple-$l -- nohup /bin/bash -c /tmp/sysbench.sh ; done &
#for m in {41..50}; do kubectl exec -it -n mapr-examples test-simple-$m -- nohup /bin/bash -c /tmp/sysbench.sh ; done &
#for n in {51..60}; do kubectl exec -it -n mapr-examples test-simple-$n -- nohup /bin/bash -c /tmp/sysbench.sh ; done &
#for o in {61..70}; do kubectl exec -it -n mapr-examples test-simple-$o -- nohup /bin/bash -c /tmp/sysbench.sh ; done &
#for p in {71..80}; do kubectl exec -it -n mapr-examples test-simple-$p -- nohup /bin/bash -c /tmp/sysbench.sh ; done &
#kubectl exec -it -n mapr-examples test-simple-100 -- nohup /bin/bash -c /tmp/sysbench.sh &
#for q in {81..90}; do kubectl exec -it -n mapr-examples test-simple-$q -- nohup /bin/bash -c /tmp/sysbench.sh ; done &
#for r in {91..100}; do kubectl exec -it -n mapr-examples test-simple-$r -- nohup /bin/bash -c /tmp/sysbench.sh ; done &
