prepare:
	ansible-galaxy install -r requirements.yml

deploy:
	ansible-playbook -i hosts.yml playbook.yml

vault-pass:
	ansible-playbook -i hosts.yml playbook.yml --ask-vault-pass

