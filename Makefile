EXCLUDES = "Makefile|LICENSE|udev.rules|.git|.gitignore|^.$$"
SPC_DIRS = "udev.rules"

all: install

.PHONY: install
install:
	@# open
	@for file in $$(find . -maxdepth 1 | egrep -v ${EXCLUDES}); \
	do \
	    ln -sfv $$(readlink -f $$file) ${HOME}/; \
	done
	@# secrets
	@for file in $$(find ./secrets -maxdepth 1 | egrep -v ${EXCLUDES}); \
	do \
	    ln -sfv $$(readlink -f $$file) ${HOME}/; \
	done
