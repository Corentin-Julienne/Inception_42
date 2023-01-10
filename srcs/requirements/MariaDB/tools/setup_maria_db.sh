#!bin/sh

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup_maria_db.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cjulienn <cjulienn@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/03 17:10:00 by cjulienn          #+#    #+#              #
#    Updated: 2023/01/03 17:10:01 by cjulienn         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# we first create a database using mysql_install_db
mysql_install_db

# starting the service
service mysql start

# check if the database exist by checking if file exists
if [ -f "/var/lib/mysql/$MYSQL_DATABASE"]; then
	echo "preexisting database"
else
	# create database if necessary
	echo "CREATE DATABASE '$MYSQL_DATABASE';"
	# create non root user
	echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	# Grant permissions to access and use the MySQL server
	echo "GRANT USAGE ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED '$MYSQL_PASSWORD'"
	# Grant all privileges to a user on a specific database
	echo "GRANT ALL privileges ON '$MYSQL_DATABASE'.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	# make it permanent
	echo "FLUSH PRIVILEGES;"
fi

# stopping the service
service mysql stop
