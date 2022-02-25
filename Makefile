.DEFAULT_GOAL := help

# AutoDoc
# -------------------------------------------------------------------------
.PHONY: help
help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
.DEFAULT_GOAL := help

# Docker
# -------------------------------------------------------------------------
.PHONY: terraform-test
terraform-test:
	docker run -v $(PWD):/lint -w /lint ghcr.io/antonbabenko/pre-commit-terraform:latest run -a