# Variables
HELLOWORLD_DIR = $(shell readlink -f ./helloworld)
.DEFAULT_GOAL := run-nodejs-helloworld

# Images
nodejs-helloworld-image:
	docker build -t code932/nodejs-helloworld $(HELLOWORLD_DIR)
wordpress-apache-image: ubuntu-apache-image
	docker build -t wordpress-apache images/wordpress
wordpress-mysql-image:
	docker build -t wordpress-mysql images/mysql

# Containers
#
# Helloworld
create-helloworld-container: nodejs-helloworld-image
	docker ps -a | grep nodejs-helloworld || \
	docker create --name=nodejs-helloworld \
				  --restart=always \
				  -p 2222:2222 \
				  code932/nodejs-helloworld

run-helloworld-foreground: create-helloworld-container
	docker start -a -i nodejs-helloworld

run-helloworld-background: create-helloworld-container
	docker start nodejs-helloworld

# Apache
create-apache-container: wordpress-apache-image create-mysql-container
	docker ps -a | grep wp-apache || \
	docker create --name=wp-apache \
				  --restart=always \
				  -p 28080:80 \
				  -v $(WORDPRESS_DIR):/srv/wordpress \
				  -v $(APACHE_CONFIG_DIR):/etc/apache2/sites-enabled \
				  --link wp-mysql:db-host \
				  wordpress-apache

run-apache-foreground: create-apache-container run-mysql-background
	docker start -a -i wp-apache
run-apache-background: create-apache-container run-mysql-background
	docker start wp-apache

install:
	./setup.sh

docker-clean:
	docker rm -f nodejs-helloworld || true
	docker rmi -f code932/nodejs-helloworld || true

clean: docker-clean
	rm -rf devel/wordpress-4.3
	rm -rf ~/tmp/docker-presentation/host-volume