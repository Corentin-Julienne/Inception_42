# Using debian penultimate version to run the Container 
FROM debian:buster

# install NGINX and dependancies (reload, install nginx with flag -y to bypass msg)
RUN apt update
RUN apt install -y nginx 
RUN apt install -y openssl 


RUN mkdir /etc/nginx/ssl
# create a key and certificate in a single command
RUN openssl req -new \
	-newkey rsa:4096 -nodes -keyout cjulienn.42.fr.key \
	-out cjulienn.42.fr.csr \
	-subj "/C=FR/ST=IleDeFrance/L=Paris/O=19/OU=IT/CN=cjulienn.42.fr.com"

#open prot 443 with expose cmd
EXPOSE 443

# trigger shell cmds to start nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
