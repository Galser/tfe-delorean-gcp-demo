# README for redis_gcp/example

This code uses redis_gcp as module

## how to run terraform code
- terraform init
- terraform plan
- terraform apply

## how to check the state
- terraform state list

## how to destroy
- terraform destroy

## how to test
- install bundle
- install kitchen-test
```
# local path
bundle install --path vendor/bundle

# global path
bundle install
```

- test
```
bundle exec kitchen converge
bundle exec kitchen verify
bundle exec kitchen destroy
```

