FROM debian:buster

RUN apt update

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y php7.3-fpm php-mysql curl sendmail

COPY /tools/wp_config.sh .
        
RUN chmod +x wp_config.sh

ENTRYPOINT ["./wp_config.sh"]
