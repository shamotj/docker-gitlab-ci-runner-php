FROM gitlab/gitlab-runner:alpine

# Install curl and PHP
RUN  apk add --update curl php php-phar php-json php-openssl php-dom php-xml \
php-pdo php-pdo_sqlite php-sqlite3 php-zip php-soap php-ctype git

# Install composer 
RUN curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer

# Install PHPUnit
RUN wget -O /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar && \
chmod 755 /usr/local/bin/phpunit
