FROM    debian:buster

RUN     apt-get update && apt-get upgrade -y  && apt-get install -y mariadb-server


COPY ./tools/mariadb.sh  .

RUN chmod +x mariadb.sh


CMD ["bash", "mariadb.sh"]

