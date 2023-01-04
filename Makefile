# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cjulienn <cjulienn@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/24 13:43:22 by cjulienn          #+#    #+#              #
#    Updated: 2023/01/02 13:18:11 by cjulienn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# destroy containers, if any, then triggers docker-compose  
all: prune reload

# put down every container
down:
	@docker compose ./srcs/docker-compose.yml down

# remove all unused containers, including volumes
prune:	down
	@docker system prune -a -f --volumes

# all will triggers docker compose up (create images and launch containers).
load:
	@docker compose ./srcs/docker-compose.yml up -d --build

PHONY: all down prune re 
