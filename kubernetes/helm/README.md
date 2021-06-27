# Helm

## web-app

 - contain helm chart for deploying sample go app to the k8s cluster
 - chart will expose the app using ingress rule
 
 ### how to install?
   - after AKS is deployed, connect with
              
         $ az login
         $ az aks get-credentials --resource-group <resouce-group-name> --name <cluster-name>
       
       
   -  install chart with
   
          $ helm install <release-name> ./web-app
          
   - check pods and services with
   
           $ kubectl get pods
           $ kbectl get svc
         
         
  - custom values can be set in values.yml   
