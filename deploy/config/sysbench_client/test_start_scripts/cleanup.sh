#!/bin/bash
set -x;
LOG_DIR=/tmp/`hostname`.log
SYSBENCH_DIR=/`ls /|grep -i vol`/`hostname`
echo $SYSBENCH_DIR
rm -f $LOG_DIR
rm -rf $SYSBENCH_DIR
mkdir -p $SYSBENCH_DIR
