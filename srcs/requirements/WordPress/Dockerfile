FROM Debian:buster

#upgrade, update, install php, utils and dependencies
RUN apt upgrade
RUN apt update && apt -y install \
  php \
  wget

# install and config WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# copy and move the bash script, give execution permission, then execute it


# enable utilisation of port 9000
EXPOSE 9000

# create a workdir for convenience

CMD [ "executable" ]
