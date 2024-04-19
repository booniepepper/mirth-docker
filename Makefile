arch := $(shell uname -m)
tag = booniepepper/mirth:latest

.PHONY: build
build:
	docker buildx build . -t $(tag) >build.log

.PHONY: test
test: build
	echo 'WRITE A TEST, SILLY!'
	#docker run $(tag) "#01 #02 ADD"

.PHONY: release
release: build test
	docker push $(tag)
