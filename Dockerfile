FROM ubuntu:16.04
LABEL maintainer="Aldrin Navarro <aldrinnavarro16@gmail.com>"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    zip unzip \
    php7.0 \
    apache2 \
    libapache2-mod-php7.0 \
    php7.0-mysql \
    php7.0-xml \
    imagemagick


# Enable mod_rewrite
RUN a2enmod rewrite && /etc/init.d/apache2 restart

# RUN rm /var/www/html/index.html
ADD omeka-2.6 /var/www/html
# Update the default apache site with the config we created.
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf
# Set permissions
RUN chown -R www-data:www-data /var/www/html/files

EXPOSE 80
VOLUME ["/var/www", "/var/log/apache2", "/etc/apache2"]
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]