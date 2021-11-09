
# Introduction

Overview of running the terraform team code using workspaces in terraform.

The following examples will run terraform container to build the GKE using the terraform files in the terraform-modules-gke-infra repository.

We will define a terraform run cycle, the following sequence:
1. Prepare personal bucket (needed for the backend)
2. Configure backend.tf file
3. Run Init  → plan  → apply ( → and destroy)

Two workspaces will be created and the instructions will be run on each workspace.

- Workspace: dev
- Workspace: prod

_Note_: Use the right terraform.tfvars file for each 'run' depending on the workspace-environment combination.


## Bucket - GCSS

Configure a GCS bucket. (if you haven't)

You can use the terraform files under /common/bucket

Edit the terraform.tfvars if needed.

## Terraform files for infrastructure

1. Clone this repo (if not done yet)
2. Go to the run-modules folder then /create-gke

## Backend - the GCS bucket

3. Edit the file backend.tf to add/modify the name of the GCS bucket

## Run terraform commands
 
Go to the terraform working folder, example
 
  → /run-modules/create-gke

0. Move the terraform.tfvars from the environment folder dev to the working directory and edit the values if needed.  

Launch the following commands

1. Init

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 init
```

_(or if necessary, with -reconfigure option)_

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 init -reconfigure
```

2. List available workspaces

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 workspace list
```

3. Create workspace named 'dev' 

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 workspace new dev
```

4. List Workspaces and confirm the new workspace appears and it is selected with a '*'

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 workspace list
```

5. Run plan  

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 plan
```

6. Run apply 

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 apply "-auto-approve"
```

6. A) Verify in GCP infrastructure has been created.

#### Now on workspace prod

7.  Create workspace named prod

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 workspace new prod
```

8. List workspaces and confirm prod is the active one

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 workspace list
```

10. Copy tfvars file from prod folder to working folder

11. Run init command

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 init
```

12. Run command plan, 

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 plan
```

13. Run apply, infrastructure will be created, terraform will track on the specific workspace prod. 

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 apply "-auto-approve"
```

 _Note_: Objects created will have a suffix in the name with the value of the environment variable in .tfvars file

14. Review GCS bucket

You will see files with the name of the workspaces created
 
15. Review in GCP the infrastructure created.

#### Destroy steps

To avoid fees, if you don't need the infrastructure created, you can proceed with the destroy commands

16. Select dev workspace

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 workspace select dev
```

17. Destroy command on dev workspace

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 apply "-destroy" "-auto-approve"
```

18. Select workspace prod

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 workspace select prod
```

19. Destroy command on prod workspace 

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 apply "-destroy" "-auto-approve"
```

20. Review in GCP 

Check elements have been removed/deleted in your GCP project. 

