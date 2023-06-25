NAME = ubuntu

all:
	docker compose -f ./docker-compose.yml up --build -d
	docker exec -it ubuntu zsh 	

re: clean all

exec:
	docker exec -it ubuntu zsh

build:
	docker compose -f ./docker-compose.yml build

down:
	docker compose -f ./docker-compose.yml down

run:
	docker compose -f ./docker-compose.yml up

rerun: rebuild run

rebuild: clean build

clean: down

prune: 	
	docker system prune -a -f

.PHONY: all re build down run rerun rebuild clean prune exec
