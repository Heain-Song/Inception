FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server mycli

COPY ./tools/entrypoint.sh /entrypoint.sh

RUN sed -i "s/bind-address/#bind-adress/g" /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]

CMD ["mysqld"]
