# Consistent set of make tasks.
.DEFAULT_GOAL:= help  # because it's is a safe task.

docker:  # Build the docker image (takes 6 minutes in a Codespace YMMV).
	docker build \
		--tag ghcr.io/earthroverprogram/aqua-marina:latest \
		--file .devcontainer/Dockerfile \
		.

.PHONY: help
help: # Show help for each of the makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done


.PHONY: r # because there is a directory called r.
r:  # Run Rstudio server
	sudo su - rstudio -c 'rserver'

test: lock  # Run the R tests.
	R -e "devtools::test()"
