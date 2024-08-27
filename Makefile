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

.PHONY: up
up:
	cd $(COMPOSE_DIR) && docker-compose up -d

.PHONY: build
build:
	cd $(COMPOSE_DIR) && docker-compose up -d --build

.PHONY: down
down:
	cd $(COMPOSE_DIR) && docker-compose down

.PHONY: stop
stop:
	cd $(COMPOSE_DIR) && docker-compose stop

.PHONY: clean
clean:
	cd $(COMPOSE_DIR) && docker system prune -f
	cd $(COMPOSE_DIR) && docker-compose down -v