prepare_production_environment:
	ansible-playbook init.yml -i production.ini -vv -e curdir=$(CURDIR)

BRANCH := backend
deploy_production:
	ansible-playbook deploy.yml -i production.ini -vv -e curdir=$(CURDIR) --extra-vars "git_branch=$(BRANCH)"

prepare_stage_environment:
	ansible-playbook init.yml -i stage.ini -vv -e curdir=$(CURDIR)

BRANCH := backend
deploy_stage:
	ansible-playbook deploy.yml -i stage.ini -vv -e curdir=$(CURDIR) --extra-vars "git_branch=$(BRANCH)"
