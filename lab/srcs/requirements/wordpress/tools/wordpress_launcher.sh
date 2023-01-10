#!bin/sh

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    wordpress_launcher.sh                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cjulienn <cjulienn@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/03 12:15:35 by cjulienn          #+#    #+#              #
#    Updated: 2023/01/03 12:15:36 by cjulienn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# PART I : Downloading Wordpress

# download last version of wordpress
wget https://wordpress.org/latest.tar.gz
tar -xfvz latest.tar.gz
mv wordpress/* .
rm -rf latest.tar.gz
rm -rf wordpress

# PART II : Configure wp_config.php

wp core 


