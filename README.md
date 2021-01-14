# tfe-delorean-gcp-demo
TFE Active-Active aka DeLorean GCP test installation in production mode with external servics behind load-balancer with a valid certificate from Let's Encrypt

# Purpose
This repo contains all the code and instructions on how to install a TFE (Prod) version 4 Active-Active (codename : DeLorean) with a Valid Certificate in an Googlce Cloud Computing Environment

# Requirements
This repository assumes general knowledge about Terraform and Terrafrom CLI v0.13+ , if not, please get yourself accustomed first by going through [getting started guide for Terraform](https://learn.hashicorp.com/terraform?track=getting-started#getting-started). We also going to use GCP as our infrastructure provider, DNS service of CloudFlare and SSL Certificates from LetsEncrypt.

Please have TF at least version 0.13.X installed in advance.

To learn more about the mentioned above tools and technologies - please check section [Technologies near the end of the README](#technologies)


## Dependencies 

Module depends on [Google Provider](https://registry.terraform.io/providers/hashicorp/google/latest)

# How-to

## Prepare authentication credentials
- Beforehand, you will need to have SSH RSA key available at the default location :
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


## Perform deploy

# TODO
- [x] import code for compute infrastructure
- [ ] add DB deploy
- [ ] add object storage deploy
- [ ] add LB deploy
- [ ] add Memory storage deploy (Memorystore aka Redis)
- [ ] install TFE in Prod mode
- [ ] test TFE behind LB
- [ ] test VCS integration
- [ ] update README
- [ ] destroy all and re-run using instructions, fix README if required


# DONE
- [x] define objectives


# Run logs

- terraform init : [terraform_init.md](terraform_init.md)
- terraform apply : [terraform_apply.md](terraform_apply.md)
- terraform destroy  : [terraform_destroy.md](terraform_destroy.md)


# Technologies

1. **To download the content of this repository** you will need **git command-line tools**(recommended) or **Git UI Client**. To install official command-line Git tools please [find here instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) for various operating systems.

2. **For managing infrastructure** we using Terraform - open-source infrastructure as a code software tool created by HashiCorp. It enables users to define and provision a data center infrastructure using a high-level configuration language known as Hashicorp Configuration Language, or optionally JSON. More you encouraged to [learn here](https://www.terraform.io).
 - Specifically, we going to use Terraform for creating infrastructure, and install Terraform Enterprise. TFE Overview: can be found here: https://www.terraform.io/docs/enterprise/index.html
 - Pre-Install checklist: https://www.terraform.io/docs/enterprise/before-installing/index.html

3. **This project for virtualization** uses **GCP** - Google Cloud Platform - a suite of cloud computing services that runs on the same infrastructure that Google uses internally for its end-user products, such as Google Search and YouTube. You can read about how to try it here : [GCP Try It OUt](https://cloud.google.com/docs/overview/conclusion)

4. **Cloudflare**, - is an American web infrastructure and website security company, providing content delivery network services, DDoS mitigation, Internet security, and distributed domain name server services. More information can be found here: https://www.cloudflare.com/

5. **Let'sEncrypt** - Let's Encrypt is a non-profit certificate authority run by Internet Security Research Group that provides X.509 certificates for Transport Layer Security encryption at no charge. The certificate is valid for 90 days, during which renewal can take place at any time. You can find out more on their [official page](https://letsencrypt.org/)

7. **Redis** is an open source (BSD licensed), in-memory data structure store, used as a database, cache, and message broker. Redis provides data structures such as strings, hashes, lists, sets, sorted sets with range queries, bitmaps, hyperloglogs, geospatial indexes, and streams. Redis has built-in replication, Lua scripting, LRU eviction, transactions, and different levels of on-disk persistence, and provides high availability via Redis Sentinel and automatic partitioning with Redis Cluster.  In case of Google Cloud we are using through this project their own implementation called [Memmorystore](https://cloud.google.com/memorystore)


