

NAME=inception

NGINX=nginx

NGINX_SRC:=conf/default Dockerfile tools/init.sh tools/subst.sh
NGINX_SRC:= $(addprefix src/requirements/nginx/, $(NGINX_SRC))

WORDPRESS=wordpress-php

WORDPRESS_SRC:=conf/www.conf Dockerfile tools/conf.sh tools/init.sh
WORDPRESS_SRC:=$(addprefix src/requirements/wordpress/, $(WORDPRESS_SRC))

MARIADB=mariadb
MARIADB_SRC:=conf/50-server.cnf tools/init_sql.sh tools/init.sh Dockerfile
MARIADB_SRC:=$(addprefix src/requirements/mariadb/, $(MARIADB_SRC))



SRC:=$(NGINX_SRC) $(WORDPRESS_SRC) $(MARIADB_SRC)

all: $(NAME)

$(NAME): $(NGINX) $(WORDPRESS) $(MARIADB)
	cd src; docker-compose up
	echo "build proof, useful for makefile" > $@

$(NGINX): $(NGINX_SRC)
	docker rmi $(NAME)-$@ -f
	cd src; docker-compose build --no-cache $@
	echo "build proof, useful for makefile" > $@

$(WORDPRESS): $(WORDPRESS_SRC) 
	docker rmi $(NAME)-$@ -f
	cd src; docker-compose build --no-cache $@
	echo "build proof, useful for makefile" > $@

$(MARIADB): $(MARIADB_SRC) 
	docker rmi $(NAME)-$@ -f
	cd src; docker-compose build --no-cache $@
	echo "build proof, useful for makefile" > $@

run: all
	docker-compose start

IMAGE_LIST:= $(NGINX) $(WORDPRESS) $(MARIADB)
IMAGE_LIST:= $(addprefix $(NAME)-, $(IMAGE_LIST))

VOLUMES=wordpress inception_db

NETWORKS=docker-network

clean:
	docker container prune -f
	docker stop $(IMAGE_LIST) 2>/dev/null; \
	docker rm $(IMAGE_LIST) 2>/dev/null; \
	docker rmi -f $(IMAGE_LIST) 2>/dev/null; \
	docker volume rm $(VOLUMES) 2>/dev/null; \
	docker network rm $(NETWORKS) 2>/dev/null; docker volume prune -f
	rm -f $(NGINX) $(WORDPRESS) $(MARIADB) 

vclean:
	sudo rm -rf src/data/DB/*
	sudo rm -rf src/data/wordpress/*

fclean: vclean clean


re: fclean all

.PHONY: up re clean vclean fclean run all