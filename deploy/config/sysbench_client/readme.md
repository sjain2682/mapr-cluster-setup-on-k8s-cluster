Setup and start sysbench pods:
  1.  kubectl create -f sysbenchnamespace.yaml
  2.  kubectl create -f maprprovisionerticket.yaml
  3.  Modify file sysbench.yaml pods to your setting
  4.  Modify the value in for loop to generate more number of files in create_sysbench_yaml.sh.   
  5.  create_sysbench_yaml.sh script reads sysbench.yaml file and generate yaml files for new pods.
  6.  cd sysbench_multipods; kubectl create -f .
  7.  cd test_start_scripts
  8.  Modify sysbench.sh with number of threads, block size, fileio mode
  9.  Run test.sh to start tests in all pods.
