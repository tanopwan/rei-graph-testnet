help:
	# REI Graph (Testnet)
	#
	# - make deploy subgraph=subgraph/file.yaml
	# - make all

# make deploy subgraph=subgraph/file.yaml
.PHONY: deploy
deploy:
	./deploy.sh ${subgraph}

all:
	make deploy subgraph=$(wildcard subgraph/*.yaml)
