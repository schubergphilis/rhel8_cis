
.PHONY: help clean lint converge

help:
	@echo "Read the Makefile if you want to know which commands you can execute."
	@echo "Commands available: clean/build/test/converge"

clean:
	@rm *-stamp
	pipenv run molecule destroy

prepare: pipenv-stamp

pipenv-stamp:
	pipenv install
	@touch $@

lint: prepare
	time pipenv run molecule lint

converge: prepare
	time pipenv run molecule converge

all: prepare lint converge
