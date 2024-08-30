#specify the base image for the Docker container
FROM debian:bullseye

<<<<<<< HEAD
#update & upgrade all the packages to latest versions AND insall NGINX(webserver) and OpenSSL(a toolkit for SSL/TLS)
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl

#open 443 port
#EXPOSE 443

#create the directory where SSL certificates will be stored. -p to ensure no errors is raised if the directory already exists
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /etc/nginx/ssl/private
RUN mkdir -p /etc/nginx/ssl/certs

#copy the NGINX configuration file
#COPY conf/nginx.conf /etc/nginx/nginx.conf

#certificate generate/ req = require/ rsa way
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/inception.pem -out /etc/ssl/certs/inception.crt -subj /

#copy from nginx container to local (ssl certificate check purpose like custom server)
COPY ./conf /etc/nginx/sites-available/

#copy auto.sh in local to container volume
#COPY tools/auto.sh /auto.sh

#change mode of auto.sh to executable
#RUN chmod +x /auto.sh

#Change the ownership of the /var/www/wordpress directory to www-data, which is the default user and group for NGINX. The -R flag applies the ownership change recursively to all files and subdirectories.
RUN chown -R www-data:www-data /var/www/html

#Specify entrypoint to auto.sh
#ENTRYPOINT [ "./auto.sh" ]

#Specify the command to run when the container starts. Start NGINX & daemon off to run in the foreground to keep Docker container alive
CMD ["nginx", "-g", "daemon off;"]
=======
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl

EXPOSE 443
#open 443 port

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt -subj /
#certificate generate/ req = require/ rsa way /

COPY ./conf /etc/nginx/sites-available/
#copy from nginx container to local (ssl certificate check purpose like custom server)

CMD ["nginx", "-g", "daemon off;"]
# -g : set global configuration directives
# daemon off: determines whether nginx should become a daemon, mainly during development. We use it, so that the container won't exit abruptly after we power it on.
>>>>>>> d317a67143fb514fe922c4eab02cf661f6772dff
