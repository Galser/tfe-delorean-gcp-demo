#!/usr/bin/env bash
#
# settings
AGENT_VER=1.1.1
# Environment vars
# TFE adress
export TFC_ADDRESS="https://tfe-tfagents-tes3.guselietov.com"
# Our organzization pool's token
export TFC_AGENT_TOKEN="HCIRjSSdZ7t3VA.atlasv1.6t6kf5zHl6ziTWqG0aOOH3Jzj4eZaRG9vusfgVI8dUujYcLjywGmMF7yquOooQqj3Ho"

which unzip 2>/dev/null || {
    sudo apt-get update
    sudo apt-get install -y wget screen unzip
    mkdir -p /opt/tfc-agent/
    wget https://releases.hashicorp.com/tfc-agent/${AGENT_VER}/tfc-agent_${AGENT_VER}_linux_amd64.zip -O /opt/tfc-agent_${AGENT_VER}_linux_amd64.zip
    cd /opt/tfc-agent/ && unzip /opt/tfc-agent_${AGENT_VER}_linux_amd64.zip
    cd /opt/tfc-agent/ && screen -d -m -S tfc-agent /opt/tfc-agent/tfc-agent
}

# NetData

echo "APT::Get::Assume-Yes=yes" > /tmp/_tmp_apt.conf
export APT_CONFIG=/tmp/_tmp_apt.conf
export DEBIAN_FRONTEND=noninteractive
wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh && sh /tmp/netdata-kickstart.sh --non-interactive --claim-token L1VG-amTs3qSBtrlHoYB1xvup-ug0DJnR2knd2mBjWNQkshw19hKD0Ym2XCrwidShQHCgZpJPYgEj7MMSnm4jGE9LY0jRd-rzgsKd7IuF1ftElJ4qfx3KL7tJ4t_1UNOh9ButNE --claim-rooms 939f6729-88df-49d8-89fe-20c0704bed70 --claim-url https://app.netdata.cloud
