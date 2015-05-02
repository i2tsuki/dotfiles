install:
	for file in $(find . -maxdepth 1  | egrep -v "Makefile|.git|.gitignore|^.$$"); \
	do \
	    echo $$file; \
	    ln -sf $(readlink -f $$file) ${HOME}/; \
	done
