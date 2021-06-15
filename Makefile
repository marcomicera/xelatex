.PHONY: build linters

TAG=dev

build:
	docker build \
		--tag marcomicera/xelatex:$(TAG) \
		. 

linters:
	docker run -e RUN_LOCAL=true -v $(shell pwd -P):/tmp/lint github/super-linter
