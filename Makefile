arch := $(shell uname -m)
tag = booniepepper/mirth:latest

.PHONY: build
build:
	docker buildx build . -t $(tag) >build.log

.PHONY: test
test: build
	docker run $(tag) '"Greetings, Mirthling!" put line'

.PHONY: release
release: build test
	docker push $(tag)
