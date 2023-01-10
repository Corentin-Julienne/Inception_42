# Using debian penultimate version to run the Container 
FROM debian:buster

# install NGINX and ssl (reload, install nginx with flag -y to bypass msg)
RUN apt update && apt install -y nginx openssl

# create a folder where to store key and certificate for SSL protocol
RUN mkdir /etc/nginx/ssl
# create a key and certificate in a single command
RUN openssl req -nodes -x509 -days 90 \
	-newkey rsa:4096 \
	-keyout /etc/nginx/ssl/cjulienn.key \
	-out /etc/nginx/ssl/cjulienn.crt \
	-subj "/C=FR/ST=IleDeFrance/L=Paris/O=19/OU=IT/CN=cjulienn.42.fr.com"

# copy config file mginx.conf 
COPY ./conf/nginx.conf /etc/nginx/conf.d

# nginx config
RUN mkdir -p /run/nginx

# open port 443 with expose cmd
EXPOSE 443

# trigger shell cmds to start nginx
CMD ["nginx", "-g", "daemon off;"]
