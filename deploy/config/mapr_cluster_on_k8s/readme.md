To install mapr cluster:

  1.  Run cd pre_setup_script; ./MapRNodeSetupOnK8S 
      example: ./MapRNodeSetupOnK8S 4 1 1 1 1 1 maprOnPods 3
  2.  Come back to parent directory; cd ..
  3.  kubectl create -f maprclusternamespace.yaml
  4.  kubectl create -f maprclusterconfigmap.yaml
  5.  kubectl create -f maprusersecrets.yaml
  6.  kubectl create -f zkservice.yaml
  7.  kubectl create -f cldbservice.yaml
  8.  kubectl create -f zk.yaml
  9.  Wait for zk pod to be running
  10. kubectl create -f cldb.yaml
  11. Sleep 300 #Wait for three to five minutes for cldb to come up 
  12. kubectl create -f mfs1.yaml 
  13. #If multiple mfs pod per nodes then run kubectl create -f mfs<no>.yaml multiple times
  14. kubectl create -f web.yaml

