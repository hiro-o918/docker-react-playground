PWD := $(shell pwd)
IMAGE_NAME := k8s-frontend
VTAG := latest

.PHONY: dev/build
dev/build:
	docker build \
		-t hiro918/dev-$(IMAGE_NAME):$(VTAG) \
		-f Dockerfile.dev \
		$(PWD)

.PHONY: dev/run
dev/run:
	docker run \
		-it \
		-p 3000:3000 \
		-v /app/node_modules \
		-v /app:$(PWD)
		hiro918/dev-$(IMAGE_NAME):$(VTAG)

.PHONY: build
build:
	docker build \
		-t hiro918/$(IMAGE_NAME):$(VTAG) \
		-f Dockerfile\
		$(PWD)

.PHONY: run
run:
	docker run \
		-it \
		-p 8000:80\
		hiro918/$(IMAGE_NAME):$(VTAG)
