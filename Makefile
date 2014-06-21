NAME=dnscrypt
REGISTRYHOST=
USERNAME=mengbo

RUNNING:=$(shell docker ps | grep $(NAME) | cut -f 1 -d ' ')
ALL:=$(shell docker ps -a | grep $(NAME) | cut -f 1 -d ' ')

all: build

build:
	docker build -t $(REGISTRYHOST)$(USERNAME)/$(NAME) .

run: clean
	docker run --name $(NAME) -d -p 53:53 -p 53:53/udp $(USERNAME)/$(NAME)

bash: clean
	docker run --name $(NAME) -t -i -p 53:53 -p 53:53/udp $(USERNAME)/$(NAME) \
		/bin/bash

# Removes existing containers.
clean:
ifneq ($(strip $(RUNNING)),)
	docker stop $(RUNNING)
endif
ifneq ($(strip $(ALL)),)
	docker rm $(ALL)
endif
