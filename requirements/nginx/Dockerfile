# https://wiki.debian.org/DebianBookworm#line-29 current penultimate stable release as of oct 11 2024
FROM debian:12.6

RUN apt update && apt upgrade -y && apt install -y nginx

# sets up configuration file
COPY default /etc/nginx/sites-available/.

# doesn't detach nginx from terminal, binding the lifetime of the container to it
CMD ["nginx", "-g", "daemon off;"]
