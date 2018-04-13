To install mapr cluster:

  1.  Run pre_setup_script/MapRNodeSetupOnK8S 
  2.  kubectl create -f maprclusternamespace.yaml
  3.  kubectl create -f maprclusterconfigmap.yaml
  4.  kubectl create -f maprusersecrets.yaml
  5.  kubectl create -f zkservice.yaml
  6.  kubectl create -f cldbservice.yaml
  7.  kubectl create -f zk.yaml
  8.  kubectl create -f cldb.yaml
  9.  sleep 300 #Wait for three to five minutes for cldb to come up 
  10. kubectl create -f mfs1.yaml
  11. kubectl create -f mfs2.yaml 
  12. kubectl create -f web.yaml

