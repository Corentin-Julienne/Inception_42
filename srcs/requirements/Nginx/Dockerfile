# Using debian penultimate version to run the Container 
FROM debian:buster

# install NGINX and dependancies (reload, install nginx with flag -y to bypass msg)
RUN sudo apt update
RUN sudo apt install -y nginx 
RUN sudo apt install -y openssl

# create a folder where to store key and certificate for SSL protocol
RUN mkdir /etc/nginx/ssl
# create a key and certificate in a single command
RUN openssl req -new \
	-newkey rsa:4096 -nodes -keyout cjulienn.42.fr.key \
	-out cjulienn.42.fr.csr \
	-subj "/C=FR/ST=IleDeFrance/L=Paris/O=19/OU=IT/CN=cjulienn.42.fr.com"

#open port 443 with expose cmd
EXPOSE 443

# trigger shell cmds to start nginx
CMD ["nginx" "-g" "daemon off;"]
