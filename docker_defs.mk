IMAGE_NAME := $(NS)/$(IMAGE_NAME):$(VERSION)

ifneq ($(ARCH),i386)
  DOCKERFILE ?= Dockerfile
else 
  DOCKERFILE ?= Dockerfile.i386
endif 

.PHONY: build build-arm run push push-arm shell shell-arm run run-arm start start-arm stop stop-arm rm rm-arm release release-arm


build: $(DOCKERFILE)
	docker build -t $(IMAGE_NAME) -f $(DOCKERFILE) .

run:
	docker run  $(RUNPARAMS) --name $(CONTAINER_NAME)-$(CONTAINER_INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(IMAGE_NAME)


cleanImage:
	docker image rm $(IMAGE_NAME)

clean: cleanImage
