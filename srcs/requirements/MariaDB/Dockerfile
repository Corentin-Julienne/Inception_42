FROM Debian:buster

# install maria db client and server
RUN apt update
RUN apt install -y \
	mariadb-server \
	mariadb-client

# preventing the "can’t connect to local MySQL server through socket ‘/var/run/mysqld/mysqld.sock’" error
RUN mkdir /var/run/mysqld
RUN chown mysql:mysql /var/run/mysqld
RUN mysqld_safe

# exposing port 3036
EXPOSE	3036

# copy configuration file and put them into the usr/local/bin folder, then give exec access
COPY	./tools/setup_maria_db.sh /usr/local/bin/
RUN		chmod +x /usr/local/bin/setup_maria_db.sh
COPY	./conf/wordpress.sql /usr/local/bin/
RUN		chmod +x /usr/local/bin/wordpress.sql

# trigger the script
ENTRYPOINT [ "executable" ]

# trigger the database
CMD [ "executable" ]
