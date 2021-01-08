.PHONY: build

TAG=dev

build:
	docker build \
	-t marcomicera/xelatex:$(TAG) \
	. 
