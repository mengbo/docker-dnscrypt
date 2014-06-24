# Change this to suit your needs.
NAME=docker-dnscrypt
USERNAME=mengbo
RESOLVER_NAME=opendns

DOCKER_RUN_ENV=-e RESOLVER_NAME="$(RESOLVER_NAME)"

RUNNING:=$(shell docker ps | grep $(NAME) | cut -f 1 -d ' ')
ALL:=$(shell docker ps -a | grep $(NAME) | cut -f 1 -d ' ')

all: build

build:
	docker build -t $(USERNAME)/$(NAME) .

run: clean
	# Don't forget to disable dnsmasq.
	# Please edit /etc/NetworkManager/NetworkManager.conf,
	# and restart network-manager.
	docker run --name $(NAME) -d -p 53:53 -p 53:53/udp \
		$(DOCKER_RUN_ENV) $(USERNAME)/$(NAME)

bash: clean
	docker run --name $(NAME) -t -i -p 53:53 -p 53:53/udp \
		$(DOCKER_RUN_ENV) $(USERNAME)/$(NAME) \
		/bin/bash

# Removes existing containers.
clean:
ifneq ($(strip $(RUNNING)),)
	docker stop $(RUNNING)
endif
ifneq ($(strip $(ALL)),)
	docker rm $(ALL)
endif
