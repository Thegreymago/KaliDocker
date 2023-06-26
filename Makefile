NAME = kali

NAME_EPHEMERAL = kali_ephemeral

DIRECTORY = ./kali

IMAGE_NAME = kali:vJO

PATH_LOCAL = /Users/Jo/Documents

all:
	docker build -t $(IMAGE_NAME) $(DIRECTORY)
	docker run -it --name $(NAME) -v $(PATH_LOCAL):/data -w /data $(IMAGE_NAME)

re: clean all

ephemeral:
	docker run -it --rm --name $(NAME) -v $(PATH_LOCAL):/data -w /data $(IMAGE_NAME)

in: start
	docker attach $(NAME)

stop:
	docker stop $(NAME)

start:
	docker start $(NAME)

run:
	docker run -it --name $(NAME) -v $(PATH_LOCAL):/data -w /data $(IMAGE_NAME)

clean:
	docker rm $(NAME)

fclean: clean
	docker rmi $(docker image ls -q)

prune:
	docker system prune -a -f

.PHONY: all re build down run clean fclean prune in
