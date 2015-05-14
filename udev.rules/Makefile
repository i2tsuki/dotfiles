EXCLUDE = "Makefile"

install:
	for i in $$(find . -maxdepth 1 -mindepth 1 | egrep -v ".git|.gitignore|Makefile|LICENSE"); \
	do \
	    install -v -m 0644 $${i} /lib64/udev/rules.d/$${i}; \
	done

