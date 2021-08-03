#!/bin/bash

#variables
env_name     = "shared"
subscription_id       = "2fd209e4-5958-4637-8883-3debc61d1654"
serviceprinciple_id   = "0729b71d-d79f-49da-ac7c-2009cc7a1ddf"
serviceprinciple_key  = "4YYD~-X4DM7O3-XeZqfVfdXyHRgyP9OeMo"
tenant_id             = "fb5e9bf6-7281-47eb-9cf3-49722e54ed2b"



#  login to azure
az login --service-principal --username $serviceprinciple_id --password $serviceprinciple_key --tenant $tenant_id

az aks stop --name $env_name-aks --resource-group aks-$env_name
