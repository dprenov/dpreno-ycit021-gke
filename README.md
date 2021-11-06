# gke-infrastructure

New Terraform modules for GKE infrastructure

Terraform files used to build GKE infrastructure

Template for VPC and Kubernetes Cluster using local or remote modules

## Running Terraform outside of Google Cloud

There are two scenarios
### 1. Using local modules
### 2. Using module from Terrform Registry Cloud

## Prerequisites

- Google Cloud Platform (GCP).
- Google Cloud Account and login.
- Project created and valid billing account.
- In GCP, IAM, create service account and generate a token in JSON format. 
- Name the JSON file 'terraform-svc.json'.
- Google Cloud Storage API enabled
- **Google Cloud Storage (GCS)** bucket. bucket folder has terraform files to create the bucket do appropiate changes. 

For details creating the service account, see the service account creation step in the following article

- [How to Use Terraform with GKE: a Step-by-Step Guide to Deploying Your First Cluster](https://www.fairwinds.com/blog/how-to-use-terraform-with-gke-a-step-by-step-guide-to-deploying-your-first-cluster)

For details configuring storage and backend see the following article

- [How to Configure the GCP Backend for Terraform](https://gmusumeci.medium.com/how-to-configure-the-gcp-backend-for-terraform-7ea24f59760a)

Additionally, if using a module from Terraform Cloud Registry
-
- Terraform Cloud token file saved in you working directory.
- The name of the file must be: .terraformrc

**When running Terraform from the CLI, you must configure credentials in a .terraformrc or terraform.rc file**


## Build the terraform image using the Docker file

1. Generate an image using the Dockerfile located under the dockerFiles repository / terraform

Launch the following command from the folder containing the Dockerfile.

```
docker build -t terraformers:v1 .
```

 _Optionally you can push the image to your preferred image registry_

 *The next instructions assume the image is in the local registry*

## Service account and authorisation file

Create a service account and generate a key in JSON format.

Save the file, name it "terraform-svc.json" and place it in the working folder.

 _You could use a differente name for the authorisation file, but then you will need to modify the credential value in the terraform files_

## Google Cloud Storage 

1. Clone repository
2. Navigate to the folder 'bucket'
3. Edit the file **terraform.tfvars** and change the values to the variables to match your environment like,
   
   - Project Id
   - The billing account associated to the project
   - Bucket name
   - Path to your authorisation file
   
4. Place the json file having your google service account token in the working directory
 **Name the file as: terraform-svc.json**
   or Edit the terraform.tfvars file and do the proper change
   
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

 _Remove the "auto-approve" flag if you want to confirm manually your choice._

## Build infrastructure using local modules

- This method uses modules which source is local, 
- Terrform files using remote registry are located under the 'tfc-module" folder. _See next section_

**Steps**
1. Clone repository (if not done yet)
2. Navigate to the folder 'local-module'
3. Edit the file **terraform.tfvars** and change the values to the variables to match your environment like,
   
   - Project Id
   - The billing account associated to the project
   - Bucket name
   - Path to your authorisation file
   
4. Place the json file having your google service account token in the working directory
 **Name the file as: terraform-svc.json**
 
5. Run the terraform commands init, plan, apply. 
6. Run terraform command destroy if needed. (Run this command when doing testings to avoid unnecessary or accidental **fees**)

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

## Build infrastructure using Remote modules

- This method uses Remote modules loaded in Terraform Cloud Registry 
- Terrform files using local modules are located under the 'local-module" folder. _See previous section_

**Note:** When using remote modules from Terraform Cloud (TFC), you will need to save your TFC token in the working folder where terraform files run.
- Use the terraform client  

**Steps**
1. Clone repository (if not done yet)
2. Navigate to the folder 'tfc-module'
3. Edit the file **terraform.tfvars** and change the values to the variables to match your environment like,
   
   - Project Id
   - The billing account associated to the project
   - Bucket name
   - Path to your authorisation file
   
4. Place the json file having your google service account token in the working directory
 **Name the file as: terraform-svc.json**

5. Place the Terraform Cloud token to the working directory
 **Name the file as: .terraformrc**
 
6. Run the terraform commands init, plan, apply. 
7. Run terraform command destroy if needed. (Run this command when doing testings to avoid unnecessary or accidental **fees**)

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

4. If the token is accepted, you will see the Welcome login characters in the CLI terminal and new files in the working folder. 
7. Locate the file named 'credentials.tfrc.json' and rename it to '.terraformrc'
8. Place the renamed credential file under the terraform folder using the remote modules, example: 'tfc-module'.

### Run Terraform files from the 'tfc-module' folder 

Run the following commands

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

## Example Terraform credential file

credentials "app.terraform.io" {
    token = "xxxxxx.atlasv1.zzzzzzzzzzzzz"
  }


## Structure of terraform infrastructure files :

![Structure](https://github.com/Vidinci/infra/blob/main/tf-files_folder_tree-start.png)

![Structure](https://github.com/Vidinci/infra/blob/main/tf-files_folder_tree-end.png)
