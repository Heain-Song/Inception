FROM debian:bullseye

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
