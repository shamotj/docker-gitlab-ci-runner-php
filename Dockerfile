FROM gitlab/gitlab-runner:alpine

# Install curl and PHP
RUN  apk add --update curl php

# Install composer 
RUN curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer

# Install PHPUnit
RUN wget -O /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar
