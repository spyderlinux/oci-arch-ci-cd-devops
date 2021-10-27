# oci-arch-ci-cd-devops

Rapid delivery of software is essential for efficiently running your applications in the cloud. Oracle Cloud Infrastructure (OCI) DevOps services provide a continuous integration and deployment (CI/CD) platform for developers to easily build, test, and deploy software and applications on Oracle Cloud.

This reference architecture builds and tests a sample Node.js web application and then deploys it to OKE by using the OCI DevOps. The application source code is hosted on a DevOps code repository. The end user commits the code into the code repository, which triggers the start of a build pipeline.

The build pipeline follows a user-defined flow to build and test software, then create a container image of the latest version of the application. The output of the build is stored in the container registry as an image. Then a deployment pipeline uses the built image from the container registry and a Kubernetes manifest to deploy the most recent version of the application to OKE.


For details of the architecture, see [Build a continuous integration and deployment pipeline using Oracle DevOps service](https://docs.oracle.com/en/solutions/ci-cd-pipe-oci-devops/index.html)

## Terraform Provider for Oracle Cloud Infrastructure
The OCI Terraform Provider is now available for automatic download through the Terraform Provider Registry. 
For more information on how to get started view the [documentation](https://www.terraform.io/docs/providers/oci/index.html) 
and [setup guide](https://www.terraform.io/docs/providers/oci/guides/version-3-upgrade.html).

* [Documentation](https://www.terraform.io/docs/providers/oci/index.html)
* [OCI forums](https://cloudcustomerconnect.oracle.com/resources/9c8fa8f96f/summary)
* [Github issues](https://github.com/terraform-providers/terraform-provider-oci/issues)
* [Troubleshooting](https://www.terraform.io/docs/providers/oci/guides/guides/troubleshooting.html)

## Deploy Using Oracle Resource Manager

1. Click [![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?region=home&zipUrl=https://github.com/oracle-quickstart/oci-arch-ci-cd-devops/blob/main/oci-arch-ci-cd-devops.zip)

    If you aren't already signed in, when prompted, enter the tenancy and user credentials.

2. Review and accept the terms and conditions.

3. Select the region where you want to deploy the stack.

4. Follow the on-screen prompts and instructions to create the stack.

5. After creating the stack, click **Terraform Actions**, and select **Plan**.

6. Wait for the job to be completed, and review the plan.

    To make any changes, return to the Stack Details page, click **Edit Stack**, and make the required changes. Then, run the **Plan** action again.

7. If no further changes are necessary, return to the Stack Details page, click **Terraform Actions**, and select **Apply**.

## Deploy Using the Terraform CLI

### Clone the Module

Now, you'll want a local copy of this repo. You can make that with the commands:

    git clone https://github.com/oracle-quickstart/oci-arch-ci-cd-devops
    cd oci-arch-ci-cd-devops
    ls

## Prerequisites
First off, you'll need to do some pre-deploy setup.  That's all detailed [here](https://github.com/cloud-partners/oci-prerequisites).

Secondly, create a `terraform.tfvars` file and populate with the following information:

```
# Authentication
tenancy_ocid         = "<tenancy_ocid>"
user_ocid            = "<user_ocid>"
fingerprint          = "<finger_print>"
private_key_path     = "<pem_private_key_path>"

# Region
region = "<oci_region>"

# Compartment
compartment_ocid = "<compartment_ocid>"

# OCI User Authtoken
oci_user_authtoken = "<oci_user_authtoken>" # for accessing artifact repository

````

Deploy:

    terraform init
    terraform plan
    terraform apply


## Access the application
You can go to created OKE cluster, click on `Access Cluster`, launch `Cloud Shell`, run `kubeconfig` create command in cloud shell. 

Next, run the below command.

    `kubectl -n example get services` 

- where `example` is the namespace for the cluster. 
 
You can copy the `EXTERNAL-IP` and paste it on the browser to access the Node.JS application.

## Destroy the Deployment
When you no longer need the deployment, you can run this command to destroy it:

    terraform destroy


