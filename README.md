# tfe-delorean-gcp-demo
TFE Active-Active aka DeLorean GCP test installation in production mode with external services behind load-balancer with a valid certificate from Let's Encrypt

# Purpose
This repo contains all the code and instructions on how to install a TFE (Prod) version 4 Active-Active (codename: DeLorean) with a Valid Certificate in a Google Cloud Computing Environment. 

> Note: at present moment only 2-node setups are supported, it's not a limitation of the module - you can define whatever number you want, but our code is not up to really multi-multi modes setup yet. 

# Requirements
This repository assumes general knowledge about Terraform and Terraform CLI v0.13+, if not, please get yourself accustomed first by going through [getting started guide for Terraform](https://learn.hashicorp.com/terraform?track=getting-started#getting-started). We also going to use GCP as our infrastructure provider, DNS service of CloudFlare, and SSL Certificates from LetsEncrypt.

Please have TF at least version 0.13.X installed in advance.

To learn more about the mentioned above tools and technologies - please check section [Technologies near the end of the README](#technologies)


## Dependencies 

The module depends on [Google Provider](https://registry.terraform.io/providers/hashicorp/google/latest). It is also using the "Let's Encrypt" project for SSL certificates generation on the fly and CloudFlare DNS for all domain operations. 

# How-to

## Prepare authentication credentials
- Beforehand, you will need to have an SSH RSA key available at the default location :
 - `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`
 > This key is going to be used later to connect to the instance where TFE will be running.

- Prepare GCP auth credentials. A GCP service account key: Terraform will access your GCP account by using a service account key. You can [create one](https://console.cloud.google.com/apis/credentials/serviceaccountkey) in the console. When creating the key, use the following settings:

* Select the project you created in the previous step.
* Under "Service account", select "New service account".
* Give it any name you like.
* For the Role, choose "Project -> Editor".
* Leave the "Key Type" as JSON.
* Click "Create" to create the key and save the key file to your system.

You can read more about service account keys in [Google's documentation](https://cloud.google.com/iam/docs/creating-managing-service-account-keys).

> NOTE : WARNING: The service account key file provides access to your GCP project. It should be treated like any other secret credentials. Specifically, it should never be checked into source control.

- DNS -> if you are going to USE it :
  - Prepare CloudFlare authentication for your domain DNS management - register and export as env variables API keys and tokens. Follow instructions from CloudFlare here: https://support.cloudflare.com/hc/en-us/articles/200167836-Managing-API-Tokens-and-Keys
  - Export generated token and API keys :
  ```bash
  export CLOUDFLARE_API_KEY=YOUR_API_KEY_HERE
  export CLOUDFLARE_API_TOKEN=YOUR_TOKEN_HERE
  export CLOUDFLARE_ZONE_API_TOKEN=YOUR_TOKEN_HERE
  export CLOUDFLARE_DNS_API_TOKEN=YOUR_TOKEN_HERE
  ```

## Define your installation details

The repository is coming with the example `terraform-tfvars.example` . Upon cloning the repo, please copy it to the file named for example: `terraform.tfvars` and adjust according to your needs. At least you will need to add the project name and GCO project credentials JSON, and probably - domain name for your DNS on CloudFlare. Alternatively - if you are using another DNS provider -  you can clone the  module "modules/dns_cloudflare", rewrite just a bit of code for your own provider, and change the `dns_provider` parameter for the "sslcert_letsencrypt" in the module call-in "main.tf" , around lines 117-124 : 

```Terraform
116 # Certificate : SSL from Let'sEncrypt
117 module "sslcert_letsencrypt" {
118
119   source = "./modules/sslcert_letsencrypt"
120
121   host         = var.tfe_name
122   domain       = var.site_domain
123   dns_provider = "cloudflare"
124 }
```

For SSL management ACME Certificate and Account Provider module is used, so to get the full list of the supported DNS provides or some specific of its usage check this page: https://registry.terraform.io/providers/vancluever/acme/latest/docs 

> Note: `terraform.tfvars` can be used to define the required variables for the case of plans/runs initiated with TF CLI. If you intending to use this code in TFC/TFE you need to either rename the `terraform-tfvars.example`  into `terraform.auto.tfvars` or manually define appropriate values in the **Variables** section of the workspace.

## Perform initial deploy of infra and 1 computing node

Default settings in example `terraform-tfvars.example` from previous should give you a deployment with 1 node. And that's how Active-Active had been created - you will need to deploy a group with 1 node first, and later - increase the group size to add second and further nodes. Also, the reality is that right now 2 nodes are supported, and for more - it's a grey area. 

- Double-check that you have a variable for the count of nodes defined for now as  : 

```Terraform
machines_count = 1
```

- Now we need to initialize Terraform by running: `terraform init`
- And after that finished - fire deployment of the infra ( DB, Object Storage ) and 1 node by executing: `terraform apply --auto-approve` . Bear in mind that the creation of Redis instance and CloudSQL (PostgresSQL DB) is a time-consuming process and can take 9-10 minutes easy. 

At the end of the deployment , if it had been successfull , you should see outptus secttion like this : 

```
Outputs:

data_for_tfe = {
  "admin_user_data" = {
    "email" = "admin_email_here"
    "name" = "admin"
    "password" = "XXXXXXXXX"
  }
  "application_endpoint" = "https://tfe-aa.guselietov.com"
  "loadbalancer_ip" = "34.120.206.189"
}
```

Here you can grab the password for your freshly created instance and see an application end-point. Give an instance some minutes to complete binaries installation. Normally 5-8 minutes is enough, but it can take up to half-an-hour for your fresh TFE to be available.

Log in, create an organization, move around, confirm for yourself that TFE is working.

## Scale-Up your deployment up - to 2 nodes

You can now safely change the number of instances in your Auto Scaling Group ( or equivalent) to two.

- To do this - just change the value of `machines_count` to 2, in case of using `terraform-tfvars.example` that's going to be line number 17, (*and comment starts at line 11*) : 

```Terraform
# ------------------------------------------------------------------
# Sizing - HOW many instances should we start first
# Please note that right now TFE Delorean (Active-Active)
# Should start always with ONE node, and after DB and Redis
# had been initialized - you can change this parameter to "2",
# e.g. scale-up.
machines_count = 2
```

- Do the actualy deploy bur executing : `terraform apply --auto-approve`. When it ends succesfully - you should have at the end of the apply log : 

```
module.compute_templated_gcp.google_compute_region_instance_group_manager.main: Modifications complete after 17s [id=projects/ag-tfe-aa/regions/europe-west4/instanceGroupManagers/tfe-aa-tfe-aa-group-manager]

...

Apply complete! Resources: 0 added, 1 changed, 0 destroyed.
```

e.g. 1 resource had been changed - and that is `managed  compute group`. In the example case in Europe West 4 data-center

- You still need to wait up to 15 minutes for the application to respond as healthy on both nodes. 


## Testing the health of an application

Because we are using managed instance group, you will need to use Google Cloud Dashboard, open the Compute Engine —> Instance Groups, 

- Find your instances one-by-one
- Copy the public IP address  
- Log in using SSH using user `ubuntu` to the instance 
- Become root and run check TFE health status by executing: `tfe-admin health-check`

```Bash
root@tfe-aa-tfe-aa-vm-p907:~# tfe-admin health-check
Error parsing config file: json: cannot unmarshal string into Go struct field Params.ReleaseSequence of type int
checking: Archivist Health Check...
|  checks that Archivist is up and healthy
|- ✓ PASS

checking: Terraform Enterprise Health Check...
|  checks that Terraform Enterprise is up and can communicate with Redis and Postgres
|- ✓ PASS

checking: Terraform Enterprise Vault Health Check...
|  checks that Terraform Enterprise can connect to Vault and is able to encrypt and decrypt tokens
|- ✓ PASS

checking: RabbitMQ Health Check...
|  checks that RabbitMQ can be connected to and that we can send and consume messages
|- ✓ PASS

checking: Vault Server Health Check...
|  checks that the configured Vault Server is healthy
|- ✓ PASS

  All checks passed.
```

> The first unmarshal error in output is actually okay and just indicating tooling `rawness` of tfe-admin tool for now.

What you should have above - is that all 5 checks have a green PASS in capitals - and final line  with `All checks passed`

And here is an example when there is something wrong - RedIs connection broken or network fluctuates : 

```
root@tfe-aa-tfe-aa-vm-p907:~# tfe-admin health-check
Error parsing config file: json: cannot unmarshal string into Go struct field Params.ReleaseSequence of type int
checking: Archivist Health Check...
|  checks that Archivist is up and healthy
|- ✓ PASS

checking: Terraform Enterprise Health Check...
|  checks that Terraform Enterprise is up and can communicate with Redis and Postgres
|- ✗ ERROR: http://atlas.ptfe:9292/_health_check?full did not return a healthy status, 500

checking: Terraform Enterprise Vault Health Check...
|  checks that Terraform Enterprise can connect to Vault and is able to encrypt and decrypt tokens
|- ✗ ERROR: http://atlas.ptfe:9292/_health_check/_vault_token did not return a healthy status, 500

checking: RabbitMQ Health Check...
|  checks that RabbitMQ can be connected to and that we can send and consume messages
|- ✓ PASS

checking: Vault Server Health Check...
|  checks that the configured Vault Server is healthy
|- ✓ PASS

2 checks failed.
```
AS you can see - `2 checks failed` and TFE can't communicate with RedIs and Postgres - thus rendering transient Vault engine - unusable. 


## Destroy infrastructure

To destroy both (in case you've made that) instances and all the infra of TFE Active-Active just run : `terraform destroy --auto-approve`

When everything is fine you should see no errors and the last line of destroy logs should say : 

```
Destroy complete! Resources: 50 destroyed.
```

In some rare cases, with unstable network or intermittent problems in DC you can have errors while destroying, just wait a little bit and re-run destroy. See next session for a list of well-known errors.

## Destruction specific in GCP

Sometimes destruction in GCP can fail, 3 scenarios so far : 

- Google API reporting the VM (instance) already deleted but CloudSQL still thinks that it is using DB : 

```
Error: Error when reading or editing Database: googleapi: Error 400: Invalid request: failed to delete database "tfeaa-superb-deer". Detail: pq: database "tfeaa-superb-deer" is being accessed by other users. (Please use psql client to delete database that is not owned by "cloudsqlsuperuser")
., invalid
```

- Reaching DB limits : 

```
pq: remaining connection slots are reserved for non-replication superuser connection
```

- User deletion in VM : 

```
Error: Error, failed to delete user hashicorp in instance tfeaa-superb-deer:
```

Eventually it destroys infra, but..it make take 2 executions, perhaprs I need to add some timeouts. 


# TOD

- [ ] add GCP part about enabling services ( https://cloud.google.com/service-usage/docs/enable-disable )
- [ ] fix spelling errors, update README

# DONE
- [x] define objectives
- [x] import code for computing infrastructure
- [x] add DB deploy
- [x] add object storage deploy
- [x] add LB deploy
- [x] add Memory storage deploy (Memorystore aka Redis)
- [x] install TFE in Prod mode
- [x] test TFE behind LB
- [x] test VCS integration
- [x] update README
- [x] add initial admin deployment
- [x] add second node
- [x] update README
- [x] destroy all and re-run using instructions, fix README if required


# Run logs

- terraform init : [terraform_init.md](terraform_init.md)
- terraform apply : [terraform_apply.md](terraform_apply.md)
- terraform apply for scale-up (2 nodes): [terraform_apply_2_nodes.md](terraform_apply_2_nodes.md)
- terraform destroy  : [terraform_destroy.md](terraform_destroy.md)


# Technologies

1. **To download the content of this repository** you will need **git command-line tools**(recommended) or **Git UI Client**. To install official command-line Git tools please [find here instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) for various operating systems.

2. **For managing infrastructure** we using Terraform - open-source infrastructure as a code software tool created by HashiCorp. It enables users to define and provision a data center infrastructure using a high-level configuration language known as Hashicorp Configuration Language, or optionally JSON. More you encouraged to [learn here](https://www.terraform.io).
 - Specifically, we going to use Terraform for creating infrastructure and install Terraform Enterprise. TFE Overview: can be found here: https://www.terraform.io/docs/enterprise/index.html
 - Pre-Install checklist: https://www.terraform.io/docs/enterprise/before-installing/index.html

3. **This project for virtualization** uses **GCP** - Google Cloud Platform - a suite of cloud computing services that runs on the same infrastructure that Google uses internally for its end-user products, such as Google Search and YouTube. You can read about how to try it here : [GCP Try It OUt](https://cloud.google.com/docs/overview/conclusion)

4. **Cloudflare**, - is an American web infrastructure and website security company, providing content delivery network services, DDoS mitigation, Internet security, and distributed domain name server services. More information can be found here: https://www.cloudflare.com/

5. **Let'sEncrypt** - Let's Encrypt is a non-profit certificate authority run by Internet Security Research Group that provides X.509 certificates for Transport Layer Security encryption at no charge. The certificate is valid for 90 days, during which renewal can take place at any time. You can find out more on their [official page](https://letsencrypt.org/)

7. **Redis** is an open-source (BSD licensed), in-memory data structure store, used as a database, cache, and message broker. Redis provides data structures such as strings, hashes, lists, sets, sorted sets with range queries, bitmaps, hyper logs, geospatial indexes, and streams. Redis has built-in replication, Lua scripting, LRU eviction, transactions, and different levels of on-disk persistence, and provides high availability via Redis Sentinel and automatic partitioning with Redis Cluster.  In the case of Google Cloud, we are using through this project their implementation called [Memmorystore](https://cloud.google.com/memorystore)


