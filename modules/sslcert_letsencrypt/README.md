# Let's Encrypt cert module

A terraform module to create SSL Cert fro the given DNS record in
some DNS managed domain (ClodFlare in our case) 

# Dependency

- Require some compatible with ACME DNS provider
- Require ACME provider initialization

See [installation](#installation) section below  for more details 

## WARNING

Please, do not initialize request first for testing in STAGING then transfer it into PRODUCTION with the same name. This is not going to work. Specific of the implementation of ACME right now is such, that once you've registered technical account in first step in staging, consequent request to create certificate in **prod** will reply you wth URL **containing staging**! And that is terribly wrong. 


## Inputs
- **domain**  *[String]* -  Domain for the record
- **host**  *[String]* -  Host part for the record
- **dns_provider**  *[String]* -  Name of DNS provider ( for example "cloudflare", "godaddy" and etc)

## Outputs
- **cert_pem** - *strng* - PEM-encoded Certificate
- **cert_private_key_pem** - *strng* - PEM-encoded private key
- **cert_url** - *strng* - Full certificate URL on  ACEM Let'sEncryt site 
- **cert_issuer_pem** - *strng* - PEM-encoded Issuer Cert
- **cert_bundle** - *strng* - PEM-Encoded bundle

# Installation

- ACME provider init example : 
```terraform
provider "acme" {
  # PRODUCTION
  version    = "~> 1.0"
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
  # STAGING
  # "https://acme-staging-v02.api.letsencrypt.org/directory"
}
```

