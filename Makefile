# Consistent set of make tasks.
.DEFAULT_GOAL:=help  # because it's is a safe task.

clean: # Remove the virtual environment.
	conda remove --name aqua-marina --all --yes

venv: # Create a virtual environment.
	-conda env create --file environment.yml
	. activate aqua-marina; pip install -e .

.PHONY: help
help: # Show help for each of the makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

report:  # Environment report
	. activate aqua-marina; conda info
	. activate aqua-marina; pip list -v

test: # Run the tests in the conda environment.
	. activate aqua-marina; pytest ./tests
