# Variables
IMAGE_NAME=homeassistant
CONTAINER_NAME=home-assistant
PI_IP=$(shell hostname -I | cut -d' ' -f1)
PORT=8001

.PHONY: help build run start stop remove

.DEFAULT_GOAL := help

help: ## Display this help message
	@echo "-----------------------------------------------------------------"
	@echo "    __  __                        ___              _      __              __ "
	@echo "   / / / /___  ____ ___  ___     /   |  __________(_)____/ /_____ _____  / /_"
	@echo "  / /_/ / __ \/ __ \`__ \/ _ \   / /| | / ___/ ___/ / ___/ __/ __ \`/ __ \/ __/"
	@echo " / __  / /_/ / / / / / /  __/  / ___ |(__  |__  ) (__  ) /_/ /_/ / / / / /_  "
	@echo "/_/ /_/\____/_/ /_/ /_/\___/  /_/  |_/____/____/_/____/\__/\__,_/_/ /_/\__/  "
	@echo "-----------------------------------------------------------------"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Build the Docker image
	@docker build -t $(IMAGE_NAME) .

run: ## Run the Docker container
	@docker run -d --restart=always --name $(CONTAINER_NAME) -v "/home/pi/homeassistant/config:/config" -p $(PORT):8123 $(IMAGE_NAME) 
	@interface

start: ## Start the Docker container
	@docker start $(CONTAINER_NAME) 
	@interface

stop: ## Stop the Docker container
	@docker stop $(CONTAINER_NAME)

remove: ## Remove the Docker container
	@docker rm $(CONTAINER_NAME)

webinterface: ## Echo out the current webinterface
	@echo "Home Assistant is running at http://$(PI_IP):$(PORT)"

