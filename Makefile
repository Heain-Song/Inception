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

down:
	docker-compose -f ./srcs/docker-compose.yaml down

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
