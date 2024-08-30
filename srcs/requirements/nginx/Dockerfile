#specify the base image for the Docker container
FROM debian:bullseye

#update & upgrade all the packages to latest versions AND insall NGINX(webserver) and OpenSSL(a toolkit for SSL/TLS)
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl

#create the directory where SSL certificates will be stored. -p to ensure no errors is raised if the directory already exists
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /etc/nginx/ssl/private
RUN mkdir -p /etc/nginx/ssl/certs

#certificate generate/ req = require/ rsa way
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/inception.pem -out /etc/ssl/certs/inception.crt -subj /

#copy from nginx container to local (ssl certificate check purpose like custom server)
COPY ./conf /etc/nginx/sites-available/

#Change the ownership of the /var/www/wordpress directory to www-data, which is the default user and group for NGINX. The -R flag applies the ownership change recursively to all files and subdirectories.
RUN chown -R www-data:www-data /var/www/html

#Specify the command to run when the container starts. Start NGINX & daemon off to run in the foreground to keep Docker container alive
CMD ["nginx", "-g", "daemon off;"]
