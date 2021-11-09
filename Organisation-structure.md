
# Organisation

Each environment will have a folder with the files proper to the environment, this includes the *.tfvars with the specific values for the environment.


1. Structure syntax

>Root
>>code-modules : Source code of developed modules - one folder per module
>>>common : Terraform files be used in common or as pre-requirement before running main infrastructure code 
>>>
>>>environments : a folder for each identified environment
>>>>dev
>>>>
>>>>uat
>>>>
>>>>qa
>>>>
>>>>stg
>>>>
>>>>prd
>>>>
>>>run-modules : folder per each Instracture as a Code run
>>>>create-gke
>>>>
>>>>create-vpc

# Infrastructure organisation

| Environment | Purpose | Contact point |
|------|-----------------|:--------:|
| dev | Group of developer | Antonio M / Diego |
| stg | Validate and integrate modules | Christian B |
| prd | Host delivered and installed services | Devon P |
| uat | Unit testings dynamic modules | Camilo M |
| qa  | Global Testing strategy | Mohammad B |


# Networking parameters

| Environment | Subnet name | Pod range name | Service range name | node_preemptible |
|------|-------------|------|---------|:--------:|
| dev | subnet-dev | pod-d | serv-dev | true |
| stg | subnet-stg | pod-s | serv-stg | true |
| prd | subnet-prd | pod-p | serv-prd | false |
| uat | subnet-uat | pod-u | serv-uat | true |
| qa  | subnet-qa | pod-q | serv-qa | false |

# Network IPv4 schema

| Environment | Subnet | Pod range | Service range | Kubectl API range |
|------|-------------|------|---------|:--------:|
| dev | 10.128.1.0/26 | 172.20.0.0/18 | 172.100.0.0/21 | 172.16.0.0/28 |
| stg | 10.128.2.0/26 | 172.21.0.0/18 | 172.101.0.0/21 | 172.16.0.16/28 |
| prd | 10.128.3.0/26 | 172.22.0.0/18 | 172.102.0.0/21 | 172.16.0.32/28 |
| uat | 10.128.4.0/26 | 172.23.0.0/18 | 172.103.0.0/21 | 172.16.0.64/28 |
| qa  | 10.128.5.0/26 | 172.24.0.0/18 | 172.104.0.0/21 | 172.16.0.128/28 |

# Structure example

 <pre>
 
+---Infra
|   |   Organisation-structure.md
|   |   README.md
|   |
|   +---common
|   |   \---bucket
|   |           .gitignore
|   |           bucket.tf
|   |           outputs.tf
|   |           README.md
|   |           terraform-svc.json
|   |           terraform.tfvars
|   |           variables.tf
|   |
|   +---environments
|   |   +---dev
|   |   |       terraform.tfvars
|   |   |
|   |   +---prod
|   |   |       terraform.tfvars
|   |   |
|   |   \---stg
|   |           terraform.tfvars
|   |
|   +---modules
|   |   +---envtype
|   |   |       main.tf
|   |   |       outputs.tf
|   |   |       README.md
|   |   |       variables.tf
|   |   |
|   |   +---gke
|   |   |       main.tf
|   |   |       outputs.tf
|   |   |       README.md
|   |   |       variables.tf
|   |   |
|   |   \---vpc
|   |           main.tf
|   |           outputs.tf
|   |           README.md
|   |           variables.tf
|   |
|   +---run-modules
|   |   +---create-bucket
|   |   |       main.tf
|   |   |       README.md
|   |   |       terraform.tfvars
|   |   |       terraform.tfvars-sample
|   |   |       variables.tf
|   |   |
|   |   +---create-gke
|   |   |       .gitignore
|   |   |       .terraformrc
|   |   |       backend.tf
|   |   |       main-gke.tf
|   |   |       README.md
|   |   |       terraform-init-for-backend.txt
|   |   |       terraform-svc.json
|   |   |       terraform.tfvars
|   |   |       terraform.tfvars-sample
|   |   |       variables.tf
|   |   |
|   |   \---create-vpc
|   \---run-modules-local
|       |   .gitignore
|       |   backend.tf
|       |   main-gke.tf
|       |   README.md
|       |   terraform-svc.json
|       |   terraform.tfvars
|       |   terraform.tfvars-sample
|       |   variables.tf
|       |
|       \---modules
|           +--- (Copied from main modules folder) 
|                   
|

</pre> 
    
