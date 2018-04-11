#!/bin/bash
for i in {1..10}; do kubectl cp /tmp/sysbench.sh mapr-examples/test-simple-$i:/tmp/sysbench.sh; done &
for j in {11..20}; do kubectl cp /tmp/sysbench.sh mapr-examples/test-simple-$j:/tmp/sysbench.sh; done &
for k in {21..30}; do kubectl cp /tmp/sysbench.sh mapr-examples/test-simple-$k:/tmp/sysbench.sh; done &
for l in {31..40}; do kubectl cp /tmp/sysbench.sh mapr-examples/test-simple-$l:/tmp/sysbench.sh; done &
for m in {41..50}; do kubectl cp /tmp/sysbench.sh mapr-examples/test-simple-$m:/tmp/sysbench.sh; done &
for n in {51..60}; do kubectl cp /tmp/sysbench.sh mapr-examples/test-simple-$n:/tmp/sysbench.sh; done &
for o in {61..70}; do kubectl cp /tmp/sysbench.sh mapr-examples/test-simple-$o:/tmp/sysbench.sh; done &
for p in {71..79}; do kubectl cp /tmp/sysbench.sh mapr-examples/test-simple-$p:/tmp/sysbench.sh; done &
#for q in {81..90}; do kubectl cp /tmp/sysbench.sh mapr-examples/test-simple-$q:/tmp/sysbench.sh; done &
#for r in {91..100}; do kubectl cp /tmp/sysbench.sh mapr-examples/test-simple-$r:/tmp/sysbench.sh; done &
