# https://wiki.debian.org/DebianBookworm#line-29 current penultimate stable release as of oct 11 2024
FROM debian:12.6


RUN apt update && apt upgrade -y && apt install -y nginx openssl

# RUN apt install openssh-server -y

# sets up configuration file


ARG CERT CERT_KEY CERT_REQUEST DOMAIN_NAME 

ADD tools/init.sh /bin/
ADD tools/subst.sh /bin/

COPY conf/default /etc/nginx/sites-available/default

RUN chmod 777 /bin/init.sh
RUN chmod 777 /bin/subst.sh

RUN /bin/init.sh


# doesn't detach nginx from terminal, binding the lifetime of the container to it
CMD ["nginx", "-g", "daemon off;"]
