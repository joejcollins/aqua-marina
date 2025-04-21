# Consistent set of make tasks.
.DEFAULT_GOAL:= help  # because it's is a safe task.

docs:  # Build the documentation.
	R -e "devtools::document()"

docker:  # Build the docker image (takes 6 minutes in a Codespace YMMV).
	docker build \
		--tag ghcr.io/earthroverprogram/aqua-marina:latest \
		--file .devcontainer/Dockerfile \
		.

.PHONY: help
help: # Show help for each of the makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

lock:  # Install the packages in the DESCRIPTION and snapshot for the renv.lock
	R -e "renv::install(); renv::snapshot();"

.PHONY: r # because there is a directory called r.
r:  # Run Rstudio server
	@echo "https://127.0.0.1:8787/"
	sudo su - rstudio -c 'rserver'

test: renv # Run the R tests.
	R -e "devtools::test()"

.PHONY: renv # because there is a directory called renv.
renv:  # Setup the renv.
	R -e "install.packages('renv'); renv::restore();"
