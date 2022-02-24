#!/bin/sh
set -e
URL=http://localhost:8020

curl -fXPOST $URL \
    -H "content-type: application/json" \
    -d @- <<!
{
    "jsonrpc": "2.0",
    "id": "1",
    "method": "subgraph_create",
    "params": $(yq eval '{ "name": .name }' -o=j $1)
}
!

curl -fXPOST $URL \
    -H "content-type: application/json" \
    -d @- <<!
{
    "jsonrpc": "2.0",
    "id": "1",
    "method": "subgraph_deploy",
    "params": $(yq eval -o=j $1)
}
!