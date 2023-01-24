all: install

.PHONY: install

install: 
	rsync -a --progress --exclude .git/ --exclude Makefile --exclude .gitignore ${HOME}/.config/emacs/

