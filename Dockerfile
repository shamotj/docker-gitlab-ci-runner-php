FROM gitlab/gitlab-runner:latest

# Install curl and PHP
RUN  apt-get install -y curl php php-cli php-json \
php-sqlite git php-intl php-xdebug php-curl

# Install composer 
RUN curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer

# Install PHPUnit
RUN wget -O /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-old.phar && \
chmod 755 /usr/local/bin/phpunit
