#!/bin/bash
set -x
LOG_DIR=/tmp/`hostname`.log
SYSBENCH_PREPARE_DIR=/`ls / |grep vol`
SYSBENCH_DIR=$SYSBENCH_PREPARE_DIR/`hostname`
date >>$LOG_DIR
cd $SYSBENCH_PREPARE_DIR; sysbench --test=fileio --file-total-size=500G --file-test-mode=seqwr --max-time=300 --max-requests=0 --file-block-size=1M --file-num=320 --num-threads=128 run >>$LOG_DIR 2>&1 &
#sysbench --num-threads=128  --test=fileio --file-total-size=40G --file-block-size=128K --file-test-mode=rndwr --init-rng=on --max-time=300 --max-requests=0 run >>$LOG_DIR 2>&1 &
