NAME = joonathan/redirector
VERSION = 1.0

.PHONY: all build tag_latest

current_dir = $(shell pwd)

all: build

build:
	docker run --rm -v "$(current_dir):/src" -v /var/run/docker.sock:/var/run/docker.sock centurylink/golang-builder $(NAME):$(VERSION)

tag_latest:
	docker tag -f $(NAME):$(VERSION) $(NAME):latest
