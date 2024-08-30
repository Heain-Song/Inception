FROM debian:bullseye

<<<<<<< HEAD
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server mycli

COPY ./tools/entrypoint.sh /entrypoint.sh

RUN sed -i "s/bind-address/#bind-adress/g" /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
=======
RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

RUN sed -i "s/bind-address/#bind-address/g" /etc/mysql/mariadb.conf.d/50-server.cnf #mariadb default conf file

COPY ./tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
>>>>>>> d317a67143fb514fe922c4eab02cf661f6772dff

CMD ["mysqld"]
