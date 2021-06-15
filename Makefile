.PHONY: build linters

TAG=dev

build:
	docker build \
		--tag marcomicera/xelatex:$(TAG) \
		. 

linters:
	docker run \
		--rm \
		--name resume-linters \
		--env RUN_LOCAL=true \
		--volume $(shell pwd -P):/tmp/lint \
		github/super-linter
