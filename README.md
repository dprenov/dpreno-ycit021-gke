# gke-infrastructure

Contains terraform files used to build GKE infrastructure

Template for VPC and Kubernetes Cluster using local or remote modules

## Running Terraform outside of Google Cloud

There are two scenarios
### 1. Using local modules
### 2. Using module from Terrform Registry Cloud

## Prerequisites

- [ ] Google Cloud Platform (GCP).
- [ ] Google Cloud Account and login.
- [ ] Project created and valid billing account.
- [ ] In GCP, IAM, create service account and a token in JSON format. (save the file and keep in mind the name and location)
- [ ] Enable  Kubernetes Engine API from Main Menu, Kubernetes Engine → Configuration
- [ ] Enable Google Cloud Storage API
- [ ] **Google Cloud Storage (GCS)** bucket. bucket folder has terraform files to create the bucket do appropiate changes. 

For details creating the service account, see the service account creation step in the following article

- [How to Use Terraform with GKE: a Step-by-Step Guide to Deploying Your First Cluster](https://www.fairwinds.com/blog/how-to-use-terraform-with-gke-a-step-by-step-guide-to-deploying-your-first-cluster)

For details configuring storage and backend see the following article

- [How to Configure the GCP Backend for Terraform](https://gmusumeci.medium.com/how-to-configure-the-gcp-backend-for-terraform-7ea24f59760a)

#### Additionally, if using a module from Terraform Cloud Registry

- [ ] Terraform Cloud token file saved in your working directory.
- [ ] The name of the file must be: **.terraformrc**

**When running Terraform from the CLI, you must configure credentials in a .terraformrc or terraform.rc file**


## Build the terraform image using the Docker file

1. Generate an image using the Dockerfile located under the dockerFiles repository / terraform

 See instructions along with the dockerfile to create the image.

 _Optionally you can push the generated image to your preferred image registry_

 *The following instructions assume the image is in the local registry* change the command to use an image from the published registry

## Service account and authorisation file

Create a service account and generate a key in JSON format.

Save the file, and update the terraform.fvars to match the location and file name in the variables 'gcp_auth_file'

 _Hint_: Place the file in the working folder along with the other terraform files.


## Google Cloud Storage 

1. Clone repository
2. Navigate to the folder 'bucket'
3. Edit the file **terraform.tfvars** and change the values to the variables to match your environment like,
   
   - Project Id
   - The billing account associated to the project
   - Bucket name
   - Path to your authorisation file (gcp_auth_file)
   
4. Place the json file to the path specify in the variable file 

   _Hint_: Place the file in the working folder along with the other terraform files.
  
5. Run the terraform commands init, plan, apply 

**_You can also use the alias defined in the .terraformers_functions file under the "dotfiles" repository._**

- Init
```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 init
```

- Plan
```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 plan
```

- Apply
```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 apply "-auto-approve"
```

 _Remove the "auto-approve" flag if you want to manually confirm your choice._
 
Once the code applied, the bucket will be created according to the parameters defined.

## Build infrastructure using local modules

- This method uses modules with terraform code stored locally
- use the contents of the modules folder to run the infrastructure
- Terrform files using remote registry are located under the 'run-modules" folder. _See next section_

**Steps**
1. Clone repository (if not done yet)
2. Navigate to the folder 'run-modules-local'
3. Do a copy of the folder named 'modules' inside the folder 'run-modules-local'
4. Edit the file **terraform.tfvars** and change the values to the variables to match your environment like,
   
   - Project Id
   - The billing account associated to the project
   - Bucket name
   - Path to your authorisation file
   
   > If there is no file named terraform.tfvars you can create it using the template 'terraform.tfvars-sample" 
   
5. Place the json file having your google service account token in the working directory

    _Note_: location and name must match the value entered in the .tfvars file
	 
6. Run the terraform commands init, plan, apply. 

7. Run terraform command destroy if needed. (Run this command when doing testings to avoid unnecessary or accidental **fees** :heavy_dollar_sign: :heavy_dollar_sign:)

### From the 'local-module' folder run the following commands

- Init
```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 init
```

- Plan

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 plan
```

- Apply

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 apply "-auto-approve"
```

- Destroy

```
docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 apply "-destroy" "-auto-approve"
```

**_You can also use the alias defined in the .terraformers_functions file under the "dotfiles" repository._**

## Build infrastructure using Remote modules

- This method uses Remote modules loaded in Terraform Cloud Registry 
- Terrform files using local modules are located under the 'run-modules-local" folder. _See previous section_

**Note:** When using remote modules from Terraform Cloud (TFC), you will need to save your TFC token in the working folder where terraform files run.
- Use the terraform login command to generate the token  

**Steps**
1. Clone repository (if not done yet)
2. Navigate to the folder 'run-modules'
3. Go inside the folder for the insfrastructre you want to build. 
   - in this instructions we will use the 'create-gke' folder

   Edit the file **terraform.tfvars** and change the values to the variables to match your environment like,
   
   - Project Id
   - The billing account associated to the project
   - Bucket name
   - Path to your authorisation file
   
     > If there is no file named terraform.tfvars you can create it using the template 'terraform.tfvars-sample"    
	 
4. Make sure you have your json authorisation file in your working directory or location specified in the tfvars files

5. Place the Terraform Cloud token under the working directory  (see next section)
 **Name the file as: .terraformrc**
 
6. Run the terraform commands init, plan, apply. 
7. Run terraform command destroy if needed. (Run this command when doing testings to avoid unnecessary or accidental **fees** :heavy_dollar_sign: :heavy_dollar_sign:)

   Terraform commands

	- Init
		```
		docker rn --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 init
		```
	- Plan
		```
		docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 plan
		```
	- Apply
		```
		docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 apply "-auto-approve"
		```
	- Destroy
		```
		docker run --rm -it -v "$(pwd):/terraformfiles" terraformers:v1 apply "-destroy" "-auto-approve"
		```

### Terraform Token generation

You can generate the token locally when you start the the Terraform CLI to connect to Terraform Cloud.

1. Run the following command in your terminal and follow the prompts to fetch an API token for Terraform to use. 

```
docker run -it -v "$(pwd):/terraformfiles" terraformers:v1 login
```

>> Click 'yes' at the confirmation prompt

2. Open the following URL

	```
	https://app.terraform.io/app/settings/tokens?source=terraform-login
	```

3. Generate a token using your browser, and copy-paste it into the CLI prompt.

 **Hint:**. Before pasting the token string, make sure to click the Window running the CLI (set focus), then perform the paste option or do the mouse right click at the prompt.
   
    hit 'Enter' once the value is copied.
   
   _There is no ehco on the screen for the pasted token string, you need to trust the paste action worked._
   
   Terraform by default will store the token in plain text in the following file for use by subsequent commands:
    /root/.terraform.d/credentials.tfrc.json

   _Note, the container has the file system structure to save this file in your working directory mounted to the container volume '/terraformfiles'_

4. If the token is accepted, you will see the Welcome login characters in the CLI terminal and new files created in the working folder. 
7. Locate the file named 'credentials.tfrc.json' and rename it to '.terraformrc'
8. Place the renamed credential file inside the terraform working folder having the terraform files calling the remote modules, example: 'run-modules'.

## Example Terraform credential file

credentials "app.terraform.io" {
    token = "xxxxxx.atlasv1.zzzzzzzzzzzzz"
  }


## Structure of terraform infrastructure files :

<pre> 
|   +Infra
|   \---run-modules
|       +---create-bucket
|       |       main.tf
|       |       terraform.tfvars
|       |       variables.tf
|       |
|       +---create-gke
|       |       .gitignore
|       |       .terraformrc
|       |       backend.tf
|       |       main-gke.tf
|       |       terraform-init-for-backend.txt
|       |       terraform-svc.json
|       |       terraform.tfvars
|       |       variables.tf
|       |

</pre> 