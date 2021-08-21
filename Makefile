IMAGE_TAG = latest

PWD = $(shell pwd)
VAR_FILE ?= jokes-app.params
DOCKER_FILE = docker-compose.yaml
TAG ?= all

#Load params file with all variables
include $(VAR_FILE)

# Define run options for Docker-compose
RUN_OPTIONS = IMAGE_TAG=$(IMAGE_TAG)

build: build-base build-main

#build-main: build-backend build-frontend

build-base:
	@echo "======================================================================"
	@echo "Build docker images:                                                  "
	@echo "		Base image ...: $(BASE_IMAGE_NAME):$(IMAGE_TAG)					 "
	@echo "======================================================================"
	docker build -f $(BASE_BUILD_DIR)/Dockerfile -t $(BASE_IMAGE_NAME):$(IMAGE_TAG) $(BASE_BUILD_DIR)

build-main:
	@echo "======================================================================"
	@echo "Build docker images:                                                  "
	@echo "		Backend image ...: $(BACKEND_IMAGE_NAME):$(IMAGE_TAG)            "
	@echo "		Frontend image ..: $(FRONTEND_IMAGE_NAME):$(IMAGE_TAG)           "
	@echo "======================================================================"
	$(RUN_OPTIONS) docker-compose -f $(DOCKER_FILE) up --build

#build-backend:
#	@echo "======================================================================"
#	@echo "Build docker image - $(BACKEND_IMAGE_NAME):$(IMAGE_TAG)"
#	@echo "======================================================================"
#	docker build -f $(BACKEND_BUILD_DIR)/Dockerfile -t $(BACKEND_CONTAINER_NAME):$(IMAGE_TAG) $(BACKEND_BUILD_DIR)

#build-frontend:
#	@echo "======================================================================"
#	@echo "Build docker image - $(FRONTEND_IMAGE_NAME):$(IMAGE_TAG)"
#	@echo "======================================================================"
#	docker build -f $(FRONTEND_BUILD_DIR)/Dockerfile -t $(FRONTEND_CONTAINER_NAME):$(IMAGE_TAG) $(FRONTEND_BUILD_DIR)

start:
	@echo "Use docker compose file: $(DOCKER_FILE)"
	$(RUN_OPTIONS) docker-compose -f $(DOCKER_FILE) up -d

stop:
	@echo "Use docker compose file: $(DOCKER_FILE)"
	$(RUN_OPTIONS) docker-compose -f $(DOCKER_FILE) down

restart: restart-main

restart-main: restart-backend restart-frontend

restart-backend:
	$(RUN_OPTIONS) docker-compose -f $(DOCKER_FILE) restart ct-jokes-backend

restart-frontend:
	$(RUN_OPTIONS) docker-compose -f $(DOCKER_FILE) restart ct-jokes-frontend

clean:
	@echo "======================================================================"
	@echo "Cleaning up containers for:"
	@echo "		Backend container ...: $(BACKEND_CONTAINER_NAME)	             "
	@echo "		Frontend container ..: $(FRONTEND_CONTAINER_NAME)                "

	$(RUN_OPTIONS) docker-compose -f $(DOCKER_FILE) rm --force

	@echo ""
	@echo "======================================================================"
	@echo "Cleaning images for:"
	@echo "		Backend image ...: $(BACKEND_IMAGE_NAME):$(IMAGE_TAG)            "
	@echo "		Frontend image ..: $(FRONTEND_IMAGE_NAME):$(IMAGE_TAG)           "
	docker rmi $(APP_NAME)_$(BACKEND_IMAGE_NAME):$(IMAGE_TAG)
	docker rmi $(APP_NAME)_$(FRONTEND_IMAGE_NAME):$(IMAGE_TAG)
