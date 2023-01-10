# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cjulienn <cjulienn@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/05 16:42:46 by cjulienn          #+#    #+#              #
#    Updated: 2023/01/09 12:49:28 by cjulienn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# destroy containers, if any, then triggers docker-compose
all: prune load

# put down every container
down:
	@ docker-compose -f ./srcs/docker-compose.yml down

# remove all unused containers, including volumes
prune:	down
	@ docker system prune -af --volumes

# all will triggers docker compose up (create images and launch containers).
load:
	@ docker-compose -f ./srcs/docker-compose.yml up -d --build

PHONY: all load down prune re
