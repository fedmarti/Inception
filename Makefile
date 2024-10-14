all: $(NAME)


NAME=inception

NGINX=nginx

NGINX_SRC:=conf/default Dockerfile tools/init.sh
NGINX_SRC:= $(addprefix, requirements/nginx/, $(NGINX_SRC))

WORDPRESS=wordpress

WORDPRESS_SRC:=conf/www.conf Dockerfile
WORDPRESS_SRC:=$(addprefix, requirements/wordpress/, $(WORDPRESS_SRC))

MARIADB=mariadb

MARIADB_SRC:=



SRC=$(NGINX_SRC) $(WORDPRESS_SRC) $(MARIADB_SRC)

$(NAME): $(NGINX) $(WORDPRESS) $(MARIADB)


$(NGINX): $(NGINX_SRC)
	docker rmi $(NAME)-$@ -f
	cd src; docker-compose build $@

$(WORDPRESS): $(WORDPRESS_SRC) 
	docker rmi $(NAME)-$@ -f
	cd src; docker-compose build $@

$(MARIADB): $(MARIADB_SRC) 
	cd src; docker-compose build $@



run: all
	docker-compose start

IMAGE_LIST= $(addprefix $(NAME)-, $(NGINX) $(WORDPRESS) $(MARIADB))

clean:
	docker rmi $(IMAGE_LIST) -f

re: clean all

.PHONY: re clean run all $(NAME) $(NGINX) $(WORDPRESS) $(MARIADB)