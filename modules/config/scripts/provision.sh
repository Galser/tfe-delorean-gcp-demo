#!/usr/bin/env bash
# TFE install wrapper
# Can be executed from user data
# Provision script for PTFE instance
set -e -u -o pipefail

# Set intial start time - used to calculate total time
SECONDS=0

# this APT part stricly mayne not required for cloud-init,
# but..can be used in a separate run
echo "Updating APT."
sudo apt update -q -y
if [ $? -ne 0 ]; then 
  echo "First APT update failed, retrying"
  for i in 1 2 3
  do
    sudo apt update -q -y
    if [ $? -eq 0 ]; then 
      break;
    fi # APT success
  done # APT repeats
  exit 1
fi
which curl || (
  sudo apt install -qq -y curl wget postgresql-client
)


tfe_install_url="https://install.terraform.io/ptfe/stable"
echo "Downloading install.sh from ${tfe_install_url}"
sudo mkdir -p /etc/tfe
sudo curl -o /etc/tfe/install.sh $tfe_install_url
sudo chmod +x /etc/tfe/install.sh

if private_ip=$(curl -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/ip); then
  echo "Using Google Metadata"
else
  private_ip=$(curl -H Metadata:true "http://169.254.169.254/metadata/instance/network?api-version=2017-08-01" | jq -r .interface[0].ipv4.ipAddress[0].privateIpAddress)
fi
# network-interfaces/0/access-configs/0/external-ip
# public_ip=$(curl -H Metadata:true "http://169.254.169.254/metadata/instance/network/?api-version=2017-08-01" | jq -r .interface[0].ipv4.ipAddress[0].publicIpAddress)


# echo "Running 'tfe install $verb"  "${tfe_install_args[@]}" "''"
# tfe install $verb "${tfe_install_args[@]}"



sudo /etc/tfe/install.sh \
    no-proxy \
    bypass-firewalld-warning \
    ignore-preflights \
    private-address=$private_ip

# sleep at beginning of TFE install
NOW=$(date +"%FT%T")
echo "[$NOW]  Sleeping for 5 minutes while TFE installs..."
sleep 300

# poll install status against TFE health check endpoint
while ! curl -ksfS --connect-timeout 5 https://$private_ip/_health_check; do
    sleep 5
done

# end script
NOW=$(date +"%FT%T")
duration=$SECONDS
echo "[$NOW]  Finished TFE user_data script. (provision)"
echo "  $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."