#!/bin/bash

FILE="ws_list.txt"
WORKSPACES=$(cat $FILE)
TFE_HOSTNAME="tfescaletest.guselietov.com"


for WS in $WORKSPACES; do

	curl -s \
    --header "Authorization: Bearer $TFE_TOKEN" \
    --header "Content-Type: application/vnd.api+json" \
    --request POST \
    --data "{ \"data\": { \"attributes\": { \"message\": \"API triggerd run\" }, \"type\":\"runs\", \"relationships\": { \"workspace\": { \"data\": { \"type\": \"workspaces\", \"id\": \"$WS\" } } } } }" \
    "https://$TFE_HOSTNAME/api/v2/runs"

#  PARSED_RESPONSE=$(echo $RESPONSE | jq -r '.data.attributes."vcs-repo".identifier')
#
#  # Report back whether expectation == reality
#
#  if [[ $PARSED_RESPONSE == $REPO ]]; then
#    printf "Success!\n\n"
#  else
#    printf "Something went wrong: $RESPONSE\n\n"
#  fi

done

