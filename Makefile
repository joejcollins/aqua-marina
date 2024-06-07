# Consistent set of make tasks.
.DEFAULT_GOAL:=help  # because it's is a safe task.

clean: # Remove the virtual environment.
	conda remove --name aqua-marina --all --yes

venv: # Create a virtual environment or if is it there already, add the local package.
	conda init
	-conda env create --file environment.yml --prefix ./.conda
	conda activate ./.conda; pip install --editable .

.PHONY: help
help: # Show help for each of the makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

report:  # Environment report
	conda activate ./.conda; conda info
	conda activate ./.conda; pip list -v

test: # Run the tests in the conda environment.
	conda activate ./.conda; pytest ./tests
