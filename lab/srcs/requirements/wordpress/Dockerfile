FROM Debian:buster

#upgrade, update, install php, utils and dependencies
RUN apt upgrade
RUN apt update && apt -y install php8.2 php-fpm curl wget

# install and config WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# move the ww.conf file in the appropirate location
COPY ./conf/www.conf /etc/php/8.2/fpm/pool.d/

# enable utilisation of port 9000
EXPOSE 9000

# enable running of php by creating relevant directory
RUN mkdir /run/php

# copy and move the bash script, give execution permission, then execute it
COPY "./tools/wordpress_launcher.sh" "/usr/local/bin"
RUN chmod +x /usr/local/bin/wordpress_launcher.sh 
ENTRYPOINT ["/usr/local/bin/wordpress_launcher.sh"]

# create a workdir for convenience
WORKDIR /var/www/html

# exec wordpress
CMD ["/usr/sbin/php-fpm7.3", "-F"]
