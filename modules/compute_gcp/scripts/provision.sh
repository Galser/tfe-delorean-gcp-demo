#!/usr/bin/env bash
# Provision script for PTFE instance
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
