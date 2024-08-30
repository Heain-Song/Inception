WP_DATA = /home/hesong/data/wordpress
DB_DATA = /home/hesong/data/mariadb

all: up

up: build
	@mkdir -p $(WP_DATA)
	@mkdir -p $(DB_DATA)
	docker-compose -f ./srcs/docker-compose.yaml up -d

down:
	docker-compose -f ./srcs/docker-compose.yaml down

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
