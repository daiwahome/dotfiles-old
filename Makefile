DOTPATH := `pwd`

.DEFAULT_GOAL := help
.PHONY: deploy initialize update clean help

list: ## List dotfiles
	@DOTPATH=$(DOTPATH) bash etc/scripts/list.sh

deploy: ## Make symbolic links
	@DOTPATH=$(DOTPATH) bash etc/scripts/deploy.sh

initialize: ## Install and setup tools
	@DOTPATH=$(DOTPATH) bash etc/scripts/initialize.sh

update: ## Update this repository
	git pull origin master

clean: ## Remove symbolic links
	@DOTPATH=$(DOTPATH) bash etc/scripts/clean.sh

clean-log: ## Remove log files
	@rm -fv $(DOTPATH)/log/*.log

help: ## Show help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' ${MAKEFILE_LIST} \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n\033[0;39m", $$1, $$2}'
