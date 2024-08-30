FROM debian:bullseye

WORKDIR /var/www/html/

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y curl netcat php php7.4-fpm php-mysql mariadb-client wget mycli php-cli php-mbstring php-xml sendmail 

EXPOSE 9000

COPY ./tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm7.4", "-F"]
