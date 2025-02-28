prepare:
	ansible-galaxy install -r requirements.yml

secret:
	ansible-vault encrypt group_vars/webservers/vault.yml

vault-pass:
	ansible-playbook -i hosts.yml playbook.yml --vault-password-file vault-pass.txt

