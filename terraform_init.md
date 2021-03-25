## Terraform init full log

```Terraform
Initializing modules...
- compute_templated_gcp in modules/compute_templated_gcp
- config in modules/config
- db_gcp in modules/db_gcp
- dns_cloudflare in modules/dns_cloudflare
- firewall_gcp in modules/firewall_gcp
- lb_gcp in modules/lb_gcp
- network_gcp in modules/network_gcp
- objectstorage_gcp in modules/objectstorage_gcp
- redis_gcp in modules/redis_gcp
- sslcert_letsencrypt in modules/sslcert_letsencrypt

Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/local...
- Finding latest version of hashicorp/tls...
- Finding cloudflare/cloudflare versions matching "2.14.0, 2.14.0"...
- Finding vancluever/acme versions matching "1.6.3, 1.6.3"...
- Finding latest version of hashicorp/random...
- Finding latest version of hashicorp/google-beta...
- Finding latest version of hashicorp/google...
- Finding latest version of hashicorp/template...
- Installing hashicorp/local v2.1.0...
- Installed hashicorp/local v2.1.0 (signed by HashiCorp)
- Installing hashicorp/tls v3.1.0...
- Installed hashicorp/tls v3.1.0 (signed by HashiCorp)
- Installing cloudflare/cloudflare v2.14.0...
- Installed cloudflare/cloudflare v2.14.0 (signed by a HashiCorp partner, key ID DE413CEC881C3283)
- Installing vancluever/acme v1.6.3...
- Installed vancluever/acme v1.6.3 (self-signed, key ID AD79F2BFFFD5B46C)
- Installing hashicorp/random v3.1.0...
- Installed hashicorp/random v3.1.0 (signed by HashiCorp)
- Installing hashicorp/google-beta v3.61.0...
- Installed hashicorp/google-beta v3.61.0 (signed by HashiCorp)
- Installing hashicorp/google v3.61.0...
- Installed hashicorp/google v3.61.0 (signed by HashiCorp)
- Installing hashicorp/template v2.2.0...
- Installed hashicorp/template v2.2.0 (signed by HashiCorp)

Partner and community providers are signed by their developers.
If you'd like to know more about provider signing, you can read about it here:
https://www.terraform.io/docs/plugins/signing.html

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, we recommend adding version constraints in a required_providers block
in your configuration, with the constraint strings suggested below.

* hashicorp/google: version = "~> 3.61.0"
* hashicorp/google-beta: version = "~> 3.61.0"
* hashicorp/local: version = "~> 2.1.0"
* hashicorp/random: version = "~> 3.1.0"
* hashicorp/template: version = "~> 2.2.0"
* hashicorp/tls: version = "~> 3.1.0"


Warning: Interpolation-only expressions are deprecated

  on modules/compute_templated_gcp/main.tf line 100, in resource "google_compute_instance_template" "ptfe_main":
 100:     ssh-keys           = "ubuntu:${file("${var.public_key_path}")}" // ?

Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```