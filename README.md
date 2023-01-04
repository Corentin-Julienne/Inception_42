# Inception_42

## Goal of the project

The project "Inception" of the 42 School is based on Docker. 

## What is a Container 

A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. The containers are not a Docker invention, but Docker is used to simplify the process and run several containers on a smooth way.

### difference between a Container and a Virtual Machine (VM)

Containers share the machine’s OS system kernel and therefore do not require an OS per application. However, VMs need to have their dedicated OS, so having having several VMs in a single computer might produce some performance issues. In other words, containers are a lightweight solution. 

The advantages of Containers over VMs are :
- lightweight (we speak about Mbs instead of GBs for VMs)
- fast to boot (no need to "charge" the OS features several times, because kernel is shared)

The advantages of Vms over Containers are :
- Containers, because of shared kernel, can't work for different OS environment (indeed you can, but only if you run Containers on top of a VM)

VMs and Containers also share some key features :
- isolation (you just kill the VM or Container in case of problem, for instance, without affecting the whole system)

## write a Dockerfile

A Dockerfile is a text file that has a series of instructions on how to build your image. It supports a simple set of commands that you need to use in your Dockerfile. A Dockerfile is like a Makefile for Docker Image.

### Dockerfiles main instructions

You can find avery good overview of the main Dockerfile at this GitHub repository : https://github.com/vbachele/Inception

ENTRYPOINT vs CMD

CMD allows to add more arguments when running `docker run` . However, in the case of ENTRYPOINT we cannot override the ENTRYPOINT instruction by adding command-line parameters to the `docker run` command.

## Tutorial for Inception

### Instructions for project completion

- First, the subject told us that we need to complete the project on a VM, not a the School Mac directly.
- Configuration files needs to be on the srcs folder placed at the root 
- A Makefile needs to be at the root of the project folder. The Makefile should be able to trigger a docker compose file
- [ TO IMPLEMENT ]  

### Install a Virtual Machine (VM) where to run the project

You have to complete the project using a VM based on a Linux OS. However, the choice of the distro is completely up to you. I used the last LTS form ubuntu (the version 22.04 LTS). To upgrade the performance of the VM, do not forget to install the guest additions. It will also helps to render a better and more accurate resolution. You can find the following tutorial : https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/how-to-install-virtualbox-guest-additions-on-ubuntu-22-04.html.

You will also have to install the Docker Engine on the VM. I personnaly chose to install it with the command line. The instructions are on page : https://docs.docker.com/engine/install/ubuntu/.

#### setting up share folders

It is more convenient to write the script in VSC and then use it in your Ubuntu host. You will need shared folder for this. First, enable the guest additions (link to the tutorial above). Then, go to the settings of your VM, go to shared folder, add one, make it permanent and do not specify the location. It will be present at the following path : /media/ (once you reboot your Ubuntu host). The name of the shared folder will be sf_name_of_your_folder. This concise tutorial might helps you : https://carleton.ca/scs/tech-support/troubleshooting-guides/creating-a-shared-folder-in-virtualbox/.

#### setting up an SSH connection

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

Problem 1 : Sometimes VirtualBox won't update itself which can cause the guest machine unability to launch. It will triggers an error message like : NS_ERROR_FAILURE (0x80004005). If this happens, you can follow this troubleshooting tutorial : https://www.mytecbits.com/apple/macos/virtualbox-error-ns_error_failure-0x80004005.

Problem 2 : It can happen that you cannot 

## Install NGINX

https://www.digicert.com/kb/ssl-support/openssl-quick-reference-guide.htm


### What is NGINX

NGINX is like a gateway that stands between the Internet and your back-end infrastructure. It solves the problem of having multiple requests fron clients to server. If you have too much traffic, there will be a lot of latency. So, you might think it is a good idea to have multiple instances of your website/software running on several ports of your server to increase performance. However, how will your client know in what port it is better to connect ? That where NGINX is useful. As stated before, it will act like a control tower. Client will connect on a single port to NGINX. NGINX will then request data on server with using the appropriate port. If some data are frequently requested, NGINX can store it in its cache to reduce latency and avoid the necessity to request data from the server itself.

### NGINX subtilities

NGINX is a load balancer, meaning that it will make the link between client and different servers/ports, blancing it so the client can fetch data from the optimal server, or at least an available one (in order to avoid bottlenecks and important loading times).

NGINX is falselly labelled as a web server, but in fact is a gateway between the Internet and your backend infrastructure.

NGINX can also be used as a reverse proxy. In a standard proxy, the server doesn'y know the client. In the reverse proxy, 
this is quite the opposite. The client does not know the server. Most of interaction is between the reverse proxy and the server(s). Load balancing is a feature, among many, of reverse proxy (and quite the most use feature of NGINX).

### NGINX configuration

NGINX configuration is quite straightforward. It has to be configured using a nginx.conf test file.

#### what is needed by the subject

- One container NGINX with TLSv1.2 or TLSv1.3 only (we chose TLSv1.3)

#### What is TLSv1.3

Transport Layer Security (TLS) encrypts data sent over the Internet to ensure that eavesdroppers and hackers are unable to see what you transmit which is particularly useful for private and sensitive information such as passwords, credit card numbers, and personal correspondence.

##### TLS Principles and Functionning

TLS is a cryptographic protocol that provides end-to-end security of data sent between applications over the Internet. 
It should be noted that TLS does not secure data on end systems. It simply ensures the secure delivery of data over the Internet, avoiding possible eavesdropping and/or alteration of the content. TLS is normally implemented on top of TCP in order to encrypt Application Layer protocols such as HTTP, FTP, SMTP and IMAP.

Note : TLS is what's used by HTTPS and is represented in web browsers as a locker on the left upper side of the browser, next to the URL bar.

### nginx.conf

The file nginx.conf is used to configure nginx. To comply ith the instructions of the subjects, you only needs a server part (between brackets). Inside this server, you need to specify :
- the port you want to open (all the traffic between internet and NGINX will go troughout this port)
- add the location  of the ssl key and certificate
- add the server name
- add the ssl protocols you want to use (such as TLS)
- add the root (where is located the root of the relevant files to serve to client)
- add the index (what are the files you need to serve to the client, located at path specified by root)
- add location brackets (see : https://www.digitalocean.com/community/tutorials/nginx-location-directive)

#### Daemons, NGINX, PID1 and containerization

To write the NGINX related Dockerfile, we need to understand some important concepts. 

Daemons in UNIX OSes are processes running in the background. They usually perform tasks without user intervention to maintain the good functionning on the OS. They usually are named with named ending with "d" like systemd for instance. 

Every process, including of course daemons, got a PID (process identificator). The top-most process in a UNIX system has PID (Process ID) 1 and is usually the init process. The Init process is the first userspace application started on a system and is started by the kernel at boottime. The kernel is looking in a few predefined paths (and the init kernel parameter). 

The role of processes identificated as PID1 is to reap every other processes when necessary (AKA, when they die), freeing resources. However, a signal such SIGINT or SIGKILL may not be able to have any effect on PID1. The Linux kernel handles signals differently for the process that has PID 1 than it does for other processes. In that, no problem ! PID1 processes is made to reap dead processes. It is like a control tower to reap resources when necessary, so if it is well made like in UNIX OSes, you shouldn't have memory leaks

Now, daemons identificated by PID1 poses a unique probleme when interacting with containers. Containers is a concept that isolate processes in different namespaces. As a result, there are several sets of PIDS independant from one another. Docker and Kubernetes can only send signal to PIDs 1 inside every container. Yes, there is one PID1 for the OS itself, plus one PID1 per container ! 

As a result if those PID1 identificated processes do not reap (remove) every dead process and free memory in an appropriate manner, you can have zombie processes with allocated memory, which can lead to ressource deprivation over time (when using a lot of containers, for example, or making a lot of container operations like init and suppress a lot of times). 

You have several solutions to this problem explicated there : https://cloud.google.com/architecture/best-practices-for-building-containers#signal-handling. I chose the solution 1, the more convenient and easy, but you can also use tools such as tini to make such you won't have zombie processes.

## Install and configure Maria DB

## Install and configure Wordpress

### What is Wordpress

Wordpress is a Content Management System (CMS) powering about a third a websites in all the World Wide Web. Wordpress is written in PHP. 

### subject requirements

- A Docker container that contains WordPress + php-fpm (it must be installed and
configured) only without nginx.

### what is php-fpm (FastCGI Process Manager)


### how to configure WordPress

#### wp-config.php

Wp-config.php is a very important files for Wordpress to function properly. For instance, it gives the address of your database. 


#### add WP-CLI (Wordpress Command Line Interface)

WP-CLI is a command line tool for Wordpress. It is more convenient to use by experienced users. 

## Maria DB

Maria DB is a community branch of the MySQL project. It handle databases for stateful volumes. Even if stateful content is not well suited with Docker, you can add a volume containing the data to use with your containers.

### create a script triggered by your Dockerfile

First, we need to use the command :
```
mysql_install_db
```
Mysql_install_db initializes the MySQL data directory and creates the system tables that it contains, if they do not exist. (doc here : https://mariadb.com/kb/en/mysql_install_db/)

[TO IMPLEMENT]

Then, we need to give root and user all the privileges in order to be able to access the database. 






