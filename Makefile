
VAULT_SECRET_PATH ?= rubin/rubin-jenkins-workers/jswarm

get-secrets-from-vault:
	mkdir etc/.secrets/ -p
	for i in JSWARM_USERNAME JSWARM_PASSWORD; do vault kv get -field=$$i secret/$(VAULT_SECRET_PATH) > etc/.secrets/$$i; done 

clear-secrets:
	rm -rf etc/.secrets/

run-apply:
	kubectl apply -k .

apply: get-secrets-from-vault run-apply clear-secrets

