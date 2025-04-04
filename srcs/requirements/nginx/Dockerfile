FROM    debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /nginx-selfsigned.key -out /nginx-selfsigned.crt -subj\
    "/C=MA/ST=Béni Mellal-Khénifra/L=khouribga/O=42/OU=42/CN=ssaadaou.42.fr/UID=ssaadaou"


RUN      rm -rf /etc/nginx/sites-available/default 
COPY    ./conf/nginx.conf /etc/nginx/sites-available/default

ENTRYPOINT   ["nginx", "-g", "daemon off;"]

