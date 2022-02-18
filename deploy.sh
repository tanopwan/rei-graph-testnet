#!/bin/sh
set -e
URL=https://rei-testnet-graph.moonrhythm.io/deploy
AUTH="basic $(cat .secret | tr -d '\n' | base64)"

curl -fXPOST $URL \
	-H "content-type: application/json" \
	-H "authorization: $AUTH" \
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
	-H "authorization: $AUTH" \
	-d @- <<!
{
	"jsonrpc": "2.0",
	"id": "1",
	"method": "subgraph_deploy",
	"params": $(yq eval -o=j $1)
}
!
