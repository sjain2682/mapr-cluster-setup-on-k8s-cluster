Assumption: 
---------------------------------
1.Kubernetes cluster is installed and running on bare metal

2.Nodes are setup with password less SSH between all K8S nodes




Setup docker registry: 
-----------------------
Add below entries in /etc/docker/daemon.json

{
  "insecure-registries" : ["docker.artifactory"]
}




Objective: 
----------
Run sysbnech tests for mapr cluster on K8S cluster



Below are the steps to follow:
-----------------------------
A. Setup a mapr cluster having multiples nodes as pods

B. Deploy the MapR volume plugin on K8S cluster

C. Setup a sysbench tests where each sysbench pods is using mapr vol plugin for persistent volumes 

D. Run sysbench fileio tests on pod persistent volume which is sitting on mapr




    A) Setup MapR cluster :

	To install mapr multi nodes/pods cluster:
	-----------------------------------------
  	1.  Run cd deploy/config/mapr_cluster_on_k8s/pre_setup_script; ./MapRNodeSetupOnK8S 

	    Script Parameters: MapRNodeSetupOnK8S   
	    TOTAL NODES: 			Total number of physical nodes where mapr pods will be deployed. Sum of no of CLDB nodes and data nodes equal to total nodes.
	    NO. OF ZOO NODES: 			Number of zookeeper. Zookeeper pod don't use raw disks so it can run on any node.
            NO.OF CLDB NODES: 			Number of CLDB nodes. 
	    NO.OF DATA NODES: 			Number of data nodes.
            NO.OF WEB NODES: 			Number of webserver node.
	    NO. OF MFS POD PER DATA NODE: 	Number of mfs pods per data nodes.
	    MAPR CLUSTER NAME: 			Provide a name to mapr cluster.
	    DISK_WIDTH: 			This is optional parameter, if not provied disk width will be choosen as default value 3.
      	    example: ./MapRNodeSetupOnK8S 4 3 2 2 1 1 maprOnPods 3
  	2.  Go to mapr_cluster_on_k8s directory; cd deploy/config/mapr_cluster_on_k8s/MultiNodeSetup
  	3.  kubectl create -f maprclusternamespace.yaml
  	4.  kubectl create -f maprclusterconfigmap.yaml
  	5.  kubectl create -f maprusersecrets.yaml
  	6.  kubectl create -f zkservice.yaml
  	7.  kubectl create -f cldbservice.yaml
  	8.  kubectl create -f zk.yaml
  	9.  Wait for zk pod to be running
  	10. kubectl create -f cldb.yaml
  	11. Wait for three to five minutes for cldb to come up 
  	12. kubectl create -f mfs1.yaml 
  	13. #If multiple mfs pod per nodes then run kubectl create -f mfs<no>.yaml multiple times
  	14. kubectl create -f web.yaml

	To install mapr single nodes/pods cluster in single node K8S cluster:
	--------------------------------------------------------------------
  	1.  Run cd deploy/config/mapr_cluster_on_k8s/pre_setup_script; ./MapRSingleNodeOnK8S
	    Script Parameters: MapRNodeSetupOnK8S   
	     MAPR CLUSTER NAME: Provide a name to mapr cluster.
	     DISK_WIDTH: This is optional parameter, if not provied disk width will be choosen as default value 3.
      	    example: ./MapRSingleNodeOnK8S maprOnPods 3
  	2.  Go to mapr_cluster_on_k8s directory/singleNodeSetup; cd deploy/config/mapr_cluster_on_k8s/singleNodeSetup;
  	3.  kubectl create -f maprclusternamespace.yaml
  	4.  kubectl create -f maprclusterconfigmap.yaml
  	5.  kubectl create -f maprusersecrets.yaml
  	6.  kubectl create -f zkservice.yaml
  	7.  kubectl create -f cldbservice.yaml
  	8.  kubectl create -f zk.yaml
  	9.  Wait for zk pod to be running
  	10. kubectl create -f cldb.yaml
  	11. Wait for three to five minutes for cldb to come up 


    B) Deploy MapR Vol Plugin :

	To install plugin and provisioner:
        ----------------------------------
  	1. Go to dir "cd deploy/config/volplugin/;" and run kubectl create -f kdf-namespace.yaml
  	2. kubectl create -f kdf-rbac.yaml
  	3. kubectl create -f kdf-plugin-centos-customize.yaml
  	4. kubectl create -f kdf-provisioner-customize.yaml

	Note: These setup will not work with single node K8S cluster


    C & D) Setup and Start sysbench tests:

	To install and start sysbench tests:
	-----------------------------------
	1.   Go to directory deploy/config/sysbench_client; cd deploy/config/sysbench_client
	2.   kubectl create -f sysbenchnamespace.yaml
  	3.   kubectl create -f maprprovisionerticket.yaml
  	4.   Modify file sysbench.yaml pods to your setting
  	5.   Modify the value in for loop to generate more/less number of files in create_sysbench_yaml.sh.   
  	6.   create_sysbench_yaml.sh script reads sysbench.yaml file and generate yaml files for new pods.
  	7.   cd sysbench_multipods; kubectl create -f .
  	8.   cd test_start_scripts
  	9.   Modify sysbench.sh with number of threads, block size, fileio mode
  	10.  Run test.sh to start tests in all pods
	11.  For running different sysbench fileio tests. Please modify sysbench.sh and re-run test.sh


