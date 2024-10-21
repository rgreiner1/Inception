# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgreiner <rgreiner@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/08/23 15:06:56 by rgreiner          #+#    #+#              #
#    Updated: 2024/08/24 15:52:24 by rgreiner         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


COMPOSE_DIR = srcs/
VOL_WWW=/home/rgreiner/data/www
VOL_DB=/home/rgreiner/data/db

.PHONY: up
up:
	cd $(COMPOSE_DIR) && docker compose up -d

.PHONY: build
build:
	sudo mkdir $(VOL_WWW)
	sudo mkdir $(VOL_DB)
	cd $(COMPOSE_DIR) && docker compose up -d --build

.PHONY: down
down:
	cd $(COMPOSE_DIR) && docker compose down

.PHONY: stop
stop:
	cd $(COMPOSE_DIR) && docker compose stop

.PHONY: clean
clean:
	sudo rm -rf $(VOL_WWW)
	sudo rm -rf $(VOL_DB)
	cd $(COMPOSE_DIR) && docker compose down -v
	cd $(COMPOSE_DIR) && docker system prune -f -a
