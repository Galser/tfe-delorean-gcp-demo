# CloudFlare DSN module

A terraform module to create CloudFlare DNS A- and CNAME- records

# Dependency

- Require CloudFlare provider
- Require initialization ofprovider and corresponding ENV variable
setting

See [installation](#installation) section below  for more details 

## Inputs
- **record_ip**  *[String]* -  IP address for the record
- **domain**  *[String]* -  Domain for the record
- **host**  *[String]* -  Host part for the record

## Outputs
- **backend_fqdn** *[String]* -  Full FQDN name for teh backend host

# Installation

- Prepare CloudFlare authentication for your domain DNS management - register and export as env variables API keys and tokens. Follow instructions from CloudFlare here : https://support.cloudflare.com/hc/en-us/articles/200167836-Managing-API-Tokens-and-Keys
    - Export generated token and API keys :
    ```bash
    export CLOUDFLARE_API_KEY=YOUR_API_KEY_HERE
    export CLOUDFLARE_API_TOKEN=YOUR_TOKEN_HERE
    export CLOUDFLARE_ZONE_API_TOKEN=YOUR_TOKEN_HERE
    export CLOUDFLARE_DNS_API_TOKEN=YOUR_TOKEN_HERE
    ```
- CloudFlare provider init : 
```terraform
provider "cloudflare" {}
```