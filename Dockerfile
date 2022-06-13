FROM chialab/php-dev:7.4-apache

COPY config/docker/backend/000-default.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html
COPY ./api .
