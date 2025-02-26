prepare:
	ansible-galaxy install -r requirements.yml

deploy:
	ansible-playbook -i hosts.yml playbook.yml

