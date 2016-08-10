FROM gitlab/gitlab-runner:alpine

# Install curl and PHP
RUN  apk add --update curl php5 php5-phar php5-json php5-openssl php5-dom php5-xml \
php5-pdo php5-pdo_sqlite php5-sqlite3 php5-zip php5-soap php5-ctype git php5-iconv \
php5-intl php5-curl grep

# Change memory limit
RUN sed -i 's/^memory_limit .*/memory_limit = -1/' /etc/php5/php.ini

# Install composer 
RUN curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer

# Install PHPUnit
RUN wget -O /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar && \
chmod 755 /usr/local/bin/phpunit
