NS ?= ansengup
VERSION ?= rpi
IMAGE_NAME ?= smartthings-mqtt-bridge
ARCH := $(shell arch)

IMAGE_NAME := $(NS)/$(IMAGE_NAME):$(VERSION)

ifneq ($(ARCH),i386)
  DOCKERFILE := Dockerfile-rpi
else 
  DOCKERFILE := Dockerfile.i386
endif 

.PHONY: build build-arm push push-arm shell shell-arm run run-arm start start-arm stop stop-arm rm rm-arm release release-arm


build: $(DOCKERFILE)
	docker build -t $(IMAGE_NAME) -f $(DOCKERFILE) .

cleanImage:
	docker image rm $(IMAGE_NAME)

clean: cleanImage
