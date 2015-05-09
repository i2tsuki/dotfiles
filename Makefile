EXCLUDES = "Makefile|LICENSE|secrets|.git|.gitignore|^.$$"

install:
	for file in $$(find . -maxdepth 1  | egrep -v ${EXCLUDES}); \
	do \
	    echo $${file}; \
	    ln -sf $$(readlink -f $$file) ${HOME}/; \
	done

test:
	echo ${EXCLUDES}
