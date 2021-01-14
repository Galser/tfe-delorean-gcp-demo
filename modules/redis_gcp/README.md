# gcp-redis
GCP Memorystore (aka Redis) module for Terraform

# Purpose
This repository contains the minimal code for the Terraform v.0.13+ module that launches an **Redis** store in Google Cloud , where it is known under name Memorystore. 

To learn more about the mentioned above tools and technologies -  please check section [Technologies near the end of the README](#technologies)

# Requirements
This repo assumes general knowledge about Terraform, if not, please get yourself accustomed first by going through [getting started guide](https://learn.hashicorp.com/terraform?track=getting-started#getting-started) . Please also have your GCP credentials prepared in some way. 


## Dependencies 

Module depends on [Goolge Provider](https://registry.terraform.io/providers/hashicorp/google/latest)

## Inputs 

No mandatory inputs 



### Optional Inputs

| Input | Type    | Description |
|-------|---------|-------------|
| size  | integer | Size of the Memorystore instance |



## Outputs
- **public_dns** *list* - array of all DNS names associated with launched instances 
- **public_ips** *list* - array of all instances public IPs

## Resources

- Module creates 1 **aws_key_pair** with name **tf200-nginxweb-key**
- Module CAN create **max_web_servers** instances of **aws_instance** with name **nginxweb**. 
> Note - in case this parameter is set to 0 (zero) no instances going to be launched at all, still, the SSH key_pair going to be created. 


# Example usage

For the example of usage see the [README.md](examples/README.md) in the examples folder.

# Technologies

1. **To download the content of this repository** you will need **git command-line tools**(recommended) or **Git UI Client**. To install official command-line Git tools please [find here instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) for various operating systems. 
2. **For managing infrastructure** we using Terraform - open-source infrastructure as a code software tool created by HashiCorp. It enables users to define and provision a data center infrastructure using a high-level configuration language known as Hashicorp Configuration Language, or optionally JSON. More you encouraged to [learn here](https://www.terraform.io). 
3. **This project for virtualization** relies on **AWS EC2** - Amazon Elastic Compute Cloud (Amazon EC2 for short) - a web service that provides secure, resizable compute capacity in the cloud. It is designed to make web-scale cloud computing easier for developers. You can read in details and create a free try-out account if you don't have one here :  [Amazon EC2 main page](https://aws.amazon.com/ec2/)



# Todo


# Done
- [x] initial readme
- [x] write module code
- [x] create description for inputs/outputs
- [x] create detailed example 
- [x] test example code
- [x] update readme
