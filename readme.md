Ran sysbnech tests for mapr cluster running as K8S pods.

Here are the steps which were followed:
1) Setup a mapr cluster having 38 nodes as pods
2) Deployed the MapR volume plugin on K8S cluster
3) Setup a sysbench tests where each sysbench pods were using mapr vol plugin for persistent volumes 
4) Running sysbench fileio tests on pod persistent volume which is sitting on mapr

To install mapr multi nodes/pods cluster:
-----------------------------------------
  1.  Run cd deploy/config/mapr_cluster_on_k8s/pre_setup_script; ./MapRNodeSetupOnK8S 
      example: ./MapRNodeSetupOnK8S 4 1 1 1 1 1 maprOnPods 3
  2.  Go to mapr_cluster_on_k8s directory; cd deploy/config/mapr_cluster_on_k8s
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

To install mapr single nodes/pods cluster:
------------------------------------------
  1.  Run cd deploy/config/mapr_cluster_on_k8s/pre_setup_script; ./MapRSingleNodeOnK8S
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



