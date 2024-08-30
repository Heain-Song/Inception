<<<<<<< HEAD
WP_DATA = /home/hesong/data/wordpress
DB_DATA = /home/hesong/data/mariadb

all: up

up: build
	@mkdir -p $(WP_DATA)
	@mkdir -p $(DB_DATA)
	docker-compose -f ./srcs/docker-compose.yaml up -d
=======
COMPOSE_YAML = srcs/docker-compose.yaml
VOLUME = /home/hesong/data

all:
	sudo mkdir -p $(VOLUME)
	sudo mkdir -p $(VOLUME)/mariadb
	sudo mkdir -p $(VOLUME)/wordpress
	sudo grep hesong.42.fr /etc/hosts || sudo echo "127.0.0.1 hesong.42.fr" >> /etc/hosts
	sudo docker-compose --file=$(COMPOSE_YAML) up -d --build

up:
	sudo docker-compose --files=$(COMPOSE_YAML) up -d --build
>>>>>>> d317a67143fb514fe922c4eab02cf661f6772dff

down:
	docker-compose -f ./srcs/docker-compose.yaml down

<<<<<<< HEAD
stop:
	docker-compose -f ./srcs/docker-compose.yaml stop

start:
	docker-compose -f ./srcs/docker-compose.yaml start

build:
	clear
	docker-compose -f ./srcs/docker-compose.yaml build

ng:
	@docker exec -it nginx zsh

mdb:
	@docker exec -it mariadb zsh

wp:
	@docker exec -it wordpress zsh

clean:
	@docker stop $$(docker ps -qa) || true
	@docker rm $$(docker ps -qa) || true
	@docker rmi -f $$(docker images -qa) || true
	@docker volume rm $$(docker volume ls -q) || true
	@docker network rm $$(docker network ls -q) || true

re: clean up

prune: clean
	@docker system prune -a --volumes -f
	@rm -rf $(WP_DATA) || true
	@rm -rf $(DB_DATA) || true

.PHONY: all up down stop start build ng mdb wp clean re prune

=======
clean:
	@docker stop $$(docker ps -qa) || true
	@docker rm -f $$(docker ps -qa) || true
	@docker rmi -f $$(docker images -qa) || true
	@docker volume rm -f $$(docker volume ls -q) || true
	@docker network rm -f $$(docker network ls -q) || true
	@rm -rf $(VOLUME) || true

fclean:
	sudo docker-compose --file=$(COMPOSE_YAML) down --rmi all

re:
	make fclean
	make all

.PHONY: all up re clean fclean
>>>>>>> d317a67143fb514fe922c4eab02cf661f6772dff
