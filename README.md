# sela-post-bootcamp



## Infrastructure

  - this repository contains terraform scripts that deploy AKS on 3 enviroments (development,production, shared-services).
  - also, nginx ingress controller will be installed on each cluster using helm.
  - kubernetes provider require  a service principal
     - can be created using this guide: https://github.com/marcel-dempers/docker-development-youtube-series/blob/master/kubernetes/cloud/azure/getting-started.md
  
  
  ### Prerequisite 
  
   - terraform installed
   - azure cli
  
  
  ### How to deploy?
   - clone the repository 
   - move to desired enviroment and run:
  
         terraform init
         
   - provide terraform.tfvars file with the following variables:
      - location #azure region
      - resourceGroupName #the name for resource group
      - subscription_id # 
      - service_principal_id # 
      - service_principal_key # 
      - tenant_id#
      - ssh_key# ssh public key for accessing cluster's nodes
    - run

          terraform plan
          terraform apply
    
      
      
      
      

