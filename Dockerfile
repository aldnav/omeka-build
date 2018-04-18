FROM ubuntu:16.04
MAINTAINER Aldrin Navarro <aldrinnavarro16@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    zip unzip \
    php7.0 \
    apache2 libapache2-mod-php7.0

COPY my.cnf /etc/mysql/conf.d/my.cnf
ENV DEBIAN_FRONTEND noninteractive
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
RUN apt-get install -y \
    mysql-server-5.7 

RUN chown -R www-data:www-data /var/www/html

VOLUME /var/www/html
VOLUME /var/log/httpd
VOLUME /var/lib/mysql
VOLUME /etc/mysql
VOLUME /var/log/mysql

EXPOSE 80
EXPOSE 3306
