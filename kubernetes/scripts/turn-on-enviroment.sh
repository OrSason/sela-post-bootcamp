#!/bin/bash

# Variables
env_name={ENVIROMENT_NAME}
serviceprinciple_id={SERVICE_PRINCIPAL_ID}
serviceprinciple_key={SERVICE_PRINCIPAL_KEY}
tenant_id={TENANT_ID}

#  login to azure
az login --service-principal --username $serviceprinciple_id --password $serviceprinciple_key --tenant $tenant_id

az aks start --name $env_name-aks --resource-group aks-$env_name