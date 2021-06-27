# sela-post-bootcamp



## Infrastructure

  - This repository contains terraform scripts that deploy AKS on 3 enviroments (development,production, shared-services).
  - Also, nginx ingress controller will be installed on each cluster using helm.
  - Kubernetes and helm providers require  a service principal with contributer role of the subscription.
     - Service principal can be created using this guide: https://github.com/marcel-dempers/docker-development-youtube-series/blob/master/kubernetes/cloud/azure/getting-started.md
  - For each of the enviroment, terraform state will be stored remotely in azure blob storage account
  
  
  ### Prerequisite 
  
   - azure account
   - azure storage account for stroing tfstate files
   - terraform installed
   - azure cli
  
  
  ### How to deploy?
   - clone the repository 
   - move to desired enviroment and run:
  
         $ terraform init
         
   - provide terraform.tfvars file with the following variables:
      - location #azure region
      - resourceGroupName #the name for resource group
      - subscription_id # 
      - service_principal_id # 
      - service_principal_key # 
      - tenant_id#
      - ssh_key# ssh public key for accessing cluster's node
   
   - run

          $ terraform plan
          $ terraform apply
    
 
      
      
      
      

