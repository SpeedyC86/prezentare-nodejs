# Variables
WORKSHOP_DIR = $(shell readlink -f ./workshop)
.DEFAULT_GOAL := create-workshop-container

# Images
nodejs-workshop-image:
	docker build -t code932/nodejs-workshop-image $(WORKSHOP_DIR)
nodejs-workshop-server-image:
	docker build -t code932/nodejs-workshop-server-image $(WORKSHOP_SERVER_DIR)

# Containers
#
# Workshop
create-workshop-container: nodejs-workshop-image
	docker ps -a | grep nodejs-workshop-container || \
	docker create --name=nodejs-workshop-container \
				  --restart=always \
				  -p 2222:2222 \
				  code932/nodejs-workshop-image

run-workshop-foreground: create-workshop-container
	docker start -a -i nodejs-workshop-container

run-workshop-background: create-workshop-container
	docker start nodejs-workshop-container

docker-clean-workshop:
	docker rm -f nodejs-workshop-container || true
	docker rmi -f code932/nodejs-workshop-image || true

clean: docker-clean-workshop docker-clean-workshop-server
