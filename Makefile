NS ?= ansengup
VERSION ?= rpi
IMAGE_NAME ?= smartthings-mqtt-bridge
ARCH := $(shell arch)

ifneq ($(ARCH),i386)
  DOCKERFILE ?= Dockerfile-rpi
else 
  DOCKERFILE ?= Dockerfile.i386
endif 

include docker_defs.mk

