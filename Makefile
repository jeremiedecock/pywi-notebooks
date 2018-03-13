# Makefile with some convenient quick ways to do common things

###############################################################################

all: help

.PHONY : all \
		 clean \
	     help \
	     list \
		 publish \
		 trailing-spaces

###############################################################################

PYTHON=python3

## HELP #######################################################################

# See http://stackoverflow.com/questions/4219255/how-do-you-get-the-list-of-targets-in-a-makefile

help: list

list:
	@echo "Available targets:"
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' | xargs

###############################################################################

trailing-spaces:
	find $(PYTHON_PACKAGE_NAME) examples docs -name "*.py" -exec perl -pi -e 's/[ \t]*$$//' {} \;

## PUBLISH ####################################################################

# See https://docs.anaconda.com/anaconda-cloud/user-guide/getting-started#sharing-notebooks

publish:
	anaconda upload pywi_demo.ipynb

## CLEAN ######################################################################

init: clean

clean:
	@echo "Remove generated files"
	# TODO
