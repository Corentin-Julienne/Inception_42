# **Inception**

## **Goal of the project**
---

The project "Inception" of the 42 School is based on Docker. 

## **Docker main concepts**
--- 

A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. The containers are not a Docker invention, but Docker is used to simplify the process and run several containers on a smooth way.

### *Difference between a Container and a Virtual Machine (VM)*
---

Containers share the machine’s OS system kernel and therefore do not require an OS per application. However, VMs need to have their dedicated OS, so having having several VMs in a single computer might produce some performance issues. In other words, containers are a lightweight solution. 

The advantages of Containers over VMs are :
- lightweight (we speak about Mbs instead of GBs for VMs)
- fast to boot (no need to "charge" the OS features several times, because kernel is shared)

The advantages of Vms over Containers are :
- Containers, because of shared kernel, can't work for different OS environment (indeed you can, but only if you run Containers on top of a VM)

VMs and Containers also share some key features :
- isolation (you just kill the VM or Container in case of problem, for instance, without affecting the whole system)

### *write a Dockerfile*
---

A Dockerfile is a text file that has a series of instructions on how to build your image. It supports a simple set of commands that you need to use in your Dockerfile. A Dockerfile is like a Makefile for Docker Image.

### *Dockerfiles main instructions*
---

You can find avery good overview of the main Dockerfile at this GitHub repository : https://github.com/vbachele/Inception

ENTRYPOINT vs CMD

CMD allows to add more arguments when running `docker run` . However, in the case of ENTRYPOINT we cannot override the ENTRYPOINT instruction by adding command-line parameters to the `docker run` command.

## **Tutorial for Inception**
---

### *Instructions for project completion*
---

- First, the subject told us that we need to complete the project on a VM, not a the School Mac directly.
- Configuration files needs to be on the srcs folder placed at the root 
- A Makefile needs to be at the root of the project folder. The Makefile should be able to trigger a docker compose file
- [ TO IMPLEMENT ]  

### *Install a Virtual Machine (VM) where to run the project*
---

You have to complete the project using a VM based on a Linux OS. However, the choice of the distro is completely up to you. I used the last LTS form ubuntu (the version 22.04 LTS). To upgrade the performance of the VM, do not forget to install the guest additions. It will also helps to render a better and more accurate resolution. You can find the following tutorial : https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/how-to-install-virtualbox-guest-additions-on-ubuntu-22-04.html.

You will also have to install the Docker Engine on the VM. I personnaly chose to install it with the command line. The instructions are on page : https://docs.docker.com/engine/install/ubuntu/.

#### setting up share folders
---

It is more convenient to write the script in VSC and then use it in your Ubuntu host. You will need shared folder for this. First, enable the guest additions (link to the tutorial above). Then, go to the settings of your VM, go to shared folder, add one, make it permanent and do not specify the location. It will be present at the following path : /media/ (once you reboot your Ubuntu host). The name of the shared folder will be sf_name_of_your_folder. This concise tutorial might helps you : https://carleton.ca/scs/tech-support/troubleshooting-guides/creating-a-shared-folder-in-virtualbox/.

#### setting up an SSH connection
---

In order to be able to send and receive info between guest and host, we need to provide a working SSH connection. 
You can check the relevant part of this tutorial : (https://baigal.medium.com/born2beroot-e6e26dfb50ac). PD : the ip adress if not necessarily 127.0.0.1 but can be anything else. Use this command to find out :
````
sudo service sshh status
````

You will need to provide the login of guest machine in order to open an SSH connection, plus the guest password. Generally when situated in the host machine, just write something like :
````
ssh guest_login@127.0.0.1 -p 22
```` 

#### several problems encountered with VM and VirtualBox configuration
---

Problem 1 : Sometimes VirtualBox won't update itself which can cause the guest machine unability to launch. It will triggers an error message like : NS_ERROR_FAILURE (0x80004005). If this happens, you can follow this troubleshooting tutorial : https://www.mytecbits.com/apple/macos/virtualbox-error-ns_error_failure-0x80004005.

Problem 2 : It can happen that you cannot 

## **NGINX**
---

https://www.digicert.com/kb/ssl-support/openssl-quick-reference-guide.htm


### *What is NGINX*
---

NGINX is like a gateway that stands between the Internet and your back-end infrastructure. It solves the problem of having multiple requests fron clients to server. If you have too much traffic, there will be a lot of latency. So, you might think it is a good idea to have multiple instances of your website/software running on several ports of your server to increase performance. However, how will your client know in what port it is better to connect ? That where NGINX is useful. As stated before, it will act like a control tower. Client will connect on a single port to NGINX. NGINX will then request data on server with using the appropriate port. If some data are frequently requested, NGINX can store it in its cache to reduce latency and avoid the necessity to request data from the server itself.

### *NGINX subtilities*
---

NGINX is a load balancer, meaning that it will make the link between client and different servers/ports, balancing it so the client can fetch data from the optimal server, or at least an available one (in order to avoid bottlenecks and important loading times).

NGINX is falselly labelled as a web server, but in fact is a gateway between the Internet and your backend infrastructure.

NGINX can also be used as a reverse proxy. In a standard proxy, the server doesn't know the client. In the reverse proxy, this is quite the opposite. The client does not know the server. Most of interaction is between the reverse proxy and the server(s). Load balancing is a feature, among many, of reverse proxy (and quite the most used feature of NGINX).

### *NGINX configuration*
---

NGINX configuration is quite straightforward. It has to be configured using a nginx.conf test file.

#### what is needed by the subject
---

- One container NGINX with TLSv1.2 or TLSv1.3 only (we chose TLSv1.3)

#### What is TLSv1.3
---

Transport Layer Security (TLS) encrypts data sent over the Internet to ensure that eavesdroppers and hackers are unable to see what you transmit which is particularly useful for private and sensitive information such as passwords, credit card numbers, and personal correspondence.

##### TLS Principles and Functionning
---

TLS is a cryptographic protocol that provides end-to-end security of data sent between applications over the Internet. 
It should be noted that TLS does not secure data on end systems. It simply ensures the secure delivery of data over the Internet, avoiding possible eavesdropping and/or alteration of the content. TLS is normally implemented on top of TCP in order to encrypt Application Layer protocols such as HTTP, FTP, SMTP and IMAP.

Note : TLS is what's used by HTTPS and is represented in web browsers as a locker on the left upper side of the browser, next to the URL bar.

#### What is FastCGI
---

According to its Wikipedia's page, FastCGI is a binary protocol for interfacing interactive programs with a web server. It is a variation on the earlier Common Gateway Interface (CGI). FastCGI's main aim is to reduce the overhead related to interfacing between web server and CGI programs, allowing a server to handle more web page requests per unit of time.

### nginx.conf

The file nginx.conf is used to configure nginx. To comply ith the instructions of the subjects, you only needs a server part (between brackets). Inside this server, you need to specify :
- the port you want to open (all the traffic between internet and NGINX will go throughout this port)
- add the location  of the ssl key and certificate
- add the server name
- add the ssl protocols you want to use (such as TLS)
- add the root (where is located the root of the relevant files to serve to client)
- add the index (what are the files you need to serve to the client, located at path specified by root)
- add location brackets (see : https://www.digitalocean.com/community/tutorials/nginx-location-directive)

The port directive is quite easy. You have to indicate the port 443 

You also have to configure fastcgi directives. Fastcgi_pass allows NGINX to know where to forward request from the client. You have to write the ip/service and associated port. You will also have to pass some parameters to ensure fastcgi will handle the request in an appropriate manner. You will have to use fastcgi_param. NGINX will update some variable regarding the request you are making. For instance, ````$request_method```` will allways contains the http method requested by the client. The ````SCRIPT_FILENAME```` parameter will be a combination of ````$document_root$fastcgi_script_name```` and ````fastcgi_index```` directive.

You also need to use ````fastcgi_index```` which will be put to ````ìndex.php```` in that case.

This will result in :

````
location ~.\php$ 
{
	fastcgi_param REQUEST_METHOD $request_method;
	fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
	fastcgi_index index.php;
}
````

Be careful, no inheritance applies here ! If you have different snippets of code with common config parts, you have to declare it once per scope. No global scope inheritance applies ! However, you could use two types of files, fastcgi_params and fastcgi.conf, which are NGINX files put there by the developpers to be included to the context with standard params for convenience. With the directive include fastcgi_params, you will need to include fastcgi_params, you will still need to include ````fastcgi_params SCRIPT_FILENAME```` afterwards.

So your context should ressemble to something like that :

`````
location ~\.php$ 
{
	fastcgi_pass 	wordpress:9000;
	fastcgi_index	index.php;
	include			fastcgi_params;
	fastcgi_param	SCRIPT_FILENAME $document_root$fastcgi_script_name
}
`````

#### NGINX location
---

- You can use try_files_directive in your location directive : https://linuxhint.com/use-nginx-try_files-directive/.


#### Daemons, NGINX, PID1 and containerization
---

To write the NGINX related Dockerfile, we need to understand some important concepts. 

Daemons in UNIX OSes are processes running in the background. They usually perform tasks without user intervention to maintain the good functionning on the OS. They usually are named with named ending with "d" like systemd for instance. 

Every process, including of course daemons, got a PID (process identificator). The top-most process in a UNIX system has PID (Process ID) 1 and is usually the init process. The Init process is the first userspace application started on a system and is started by the kernel at boottime. The kernel is looking in a few predefined paths (and the init kernel parameter). 

The role of processes identificated as PID1 is to reap every other processes when necessary (AKA, when they die), freeing resources. However, a signal such SIGINT or SIGKILL may not be able to have any effect on PID1. The Linux kernel handles signals differently for the process that has PID 1 than it does for other processes. In that, no problem ! PID1 processes is made to reap dead processes. It is like a control tower to reap resources when necessary, so if it is well made like in UNIX OSes, you shouldn't have memory leaks

Now, daemons identificated by PID1 poses a unique probleme when interacting with containers. Containers is a concept that isolate processes in different namespaces. As a result, there are several sets of PIDS independant from one another. Docker and Kubernetes can only send signal to PIDs 1 inside every container. Yes, there is one PID1 for the OS itself, plus one PID1 per container ! 

As a result if those PID1 identificated processes do not reap (remove) every dead process and free memory in an appropriate manner, you can have zombie processes with allocated memory, which can lead to ressource deprivation over time (when using a lot of containers, for example, or making a lot of container operations like init and suppress a lot of times). 

You have several solutions to this problem explicated there : https://cloud.google.com/architecture/best-practices-for-building-containers#signal-handling. I chose the solution 1, the more convenient and easy, but you can also use tools such as tini to make such you won't have zombie processes.

### Write NGINX service Dockerfile

The Dockerfile for NGINX will allows the contruction of the NGINX custom docker image. 

## **Wordpress**
---

### What is Wordpress
---

Wordpress is a Content Management System (CMS) powering about a third a websites in all the World Wide Web. Wordpress is written in PHP. 

### subject requirements
---

- A Docker container that contains WordPress + php-fpm (it must be installed and configured) only without nginx.

### what is Fastcgi and PHP-fpm (FastCGI Process Manager)
---

PHP-fpm (Fastcgi Process Manager) is a popular Fastcgi implementation which works very well with NGINX. FastCgi is a binary protocol for interfacing interactive programs with a web server. Its main goal is to allow the web server to handle more requests per unit of times. 

### how to configure WordPress
---

#### configure PHP-FPM
---




#### add WP-CLI (Wordpress Command Line Interface)
---

WP-CLI is a command line tool for Wordpress. It is more convenient to use by experienced users. Those lines in the dockerfile are used to download it :

````
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
````

It will be usd by the bash script to modify wp-config file (see below).

#### wp-config.php
---

Wp-config.php is a very important files for Wordpress to function properly. For instance, it gives the address of your database.



## **Maria DB**
---

Maria DB is a community branch of the MySQL project. It handle databases for stateful volumes. Even if stateful content is not well suited with Docker, you can add a volume containing the data to use with your containers.

### write the Dockerfile for MariaDB
---

- Download mariadb-server && mariadb-client
- Copy your .sh and the .sql on the /var/local/bin/
- Give the right to execute your mysqld (which is the daemon for mysql)
- Launch your script to install mariaDB
- Then do a CMD to enable the database to listen to all the IPV4 adresses.

You also to to fix the following problems :
- if you can’t connect to local MySQL server through socket ‘/var/run/mysqld/mysqld.sock, it could trigger an error message. You have to fix that by following this tiny tutorial : http://cactogeek.free.fr/autres/DocumentationLinux-Windows/LinuxUbuntu/ProblemeMYSQL-mysqld.sockInexistant.pdf
- 

### create a script triggered by your Dockerfile
---

First, we need to use the command :
```
mysql_install_db
```
Mysql_install_db initializes the MySQL data directory and creates the system tables that it contains, if they do not exist. (doc here : https://mariadb.com/kb/en/mysql_install_db/)

After that, it is mandatory to start the service. This tutorial will be useful : https://www.mysqltutorial.org/mysql-adminsitration/start-mysql/. You can choose between several methods to do that,
but I personally chose to use service :
````
service mysql start
````

Then, we need to give root and user all the privileges in order to be able to access the database. 
