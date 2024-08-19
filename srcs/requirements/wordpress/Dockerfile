FROM debian:bullseye

WORKDIR /var/www/html/

RUN apt-get update && apt-get upgrade && apt-get install -y php php7.4-fpm php-cli wget curl php-mysql php-mbstring php-xml #sendmail

EXPOSE 9000

COPY ./tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm7.4", "-F"]
