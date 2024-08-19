FROM debian:bullseye

RUN apt update && apt upgrade && at install -y nginx

CMD["nginx", "-g", "daemon off;"]
# -g : set global configuration directives
# daemon off: determines whether nginx should become a daemon, mainly during development. We use it, so that the container won't exit abruptly after we power it on.

