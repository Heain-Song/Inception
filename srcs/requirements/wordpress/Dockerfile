FROM debian:bullseye

WORKDIR /var/www/html/

<<<<<<< HEAD
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y curl netcat php php7.4-fpm php-mysql mariadb-client wget mycli php-cli php-mbstring php-xml #sendmail 
=======
RUN apt-get update && apt-get upgrade && apt-get install -y php php7.4-fpm php-cli wget curl php-mysql php-mbstring php-xml #sendmail
>>>>>>> d317a67143fb514fe922c4eab02cf661f6772dff

EXPOSE 9000

COPY ./tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["php-fpm7.4", "-F"]
