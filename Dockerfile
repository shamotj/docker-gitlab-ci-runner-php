FROM gitlab/gitlab-runner:alpine

# Install curl and PHP
RUN  apk add --update curl php7 php7-phar php7-json php7-openssl php7-dom php7-xml \
php7-pdo php7-pdo_sqlite php7-sqlite3 php7-zip php7-soap php7-ctype git php7-iconv \
php7-intl php7-curl grep

# Install composer 
RUN curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer

# Install PHPUnit
RUN wget -O /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar && \
chmod 755 /usr/local/bin/phpunit
