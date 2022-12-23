# Inception_42

## Goal of the project

The project "Inception" of the 42 School is based on Docker. 

## What is a Container 

A container is A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another. The containers are not a Docker invention,
but Docker is used to simplify the process and run several containers on a smooth way.

### difference between a Container and a Virtual Machine (VM)

Containers share the machine’s OS system kernel and therefore do not require an OS per application. However, VMs need to have their dedicated OS, so having having several VMs in a single computer might produce some performance issues. In other words, containers are a lightweight solution. 

The advantages of Containers over VMs are :
- lightweight (we speak about Mbs instead of GBs for VMs)
- fast to boot (no need to "charge" the OS features several times, because kernel is shared)

The advantages of Vms over Containers are :
- Containers, because of shared kernel, can't work for different OS environment (indeed you can, but only 
if you run Containers on top of a VM)

VMs and Containers also share some key features :
- isolation (you just kill the VM or Container in case of problem, without affecting the whole system)

## write a Dockerfile

A Dockerfile is a text file that has a series of instructions on how to build your image. It supports a simple set of commands that you need to use in your Dockerfile. A Dockerfile is like a Makefile for Docker Image.

### Dockerfiles instructions



## Tutorial for Inception

### Instructions for project completion

- First, the subject told us that we need to complete the project on a VM, not a the School Mac directly.
- Configuration files needs to be on the srcs folder placed at the root 
- A Makefile needs to be at the root of the project folder. The Makefile should be able to trigger a docker compose file
- [ TO IMPLEMENT ]  

### Install a Virtual Machine (VM) where to run the project

While you can basically use every Linux OS to complete this project, I used Debian Stable (version 11, "Bullseye"), with no GUI. Do not forget to install the Guest Additions (https://linuxize.com/post/how-to-install-virtualbox-guest-additions-on-debian-10/) to be able to use features such as copy/paste between host and guest and shared folders. 

#### setting up share folders

It is more convenient to write the script in VSC and then use it in your Debian host. You will need shared folder for this. First, enable the guest additions (link to the tutorial above). The, go to the settings of your VM, go to shared folder, add one, make it permanent and do not specify the location. It will be present at the following path : /media/ (once you reboot your Debian host). The name of the shared folder will be sf_name_of_your_folder.

#### setting up an SSH connection

In order to be able to send and receive info between guest and host, we need to provide a working SSH connection. 
You can check the relevant part of this tutorial : (https://baigal.medium.com/born2beroot-e6e26dfb50ac). PD : the ip adress if not necessarily 127.0.0.1 but can be anything else. Use this command to find out :
````
sudo service sshh status
````

## Install NGINX

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



## Install and configure Maria DB

## Install and configure Wordpress

### What is Wordpress

Wordpress is a Content Management System (CMS) powereing about a third a websites in all the World Wide Web. Wordpress is written in PHP. 

### subject requirements

- A Docker container that contains WordPress + php-fpm (it must be installed and
configured) only without nginx.

### what is php-fpm (FastCGI Process Manager)




### how to configure WordPress





