FROM gitlab/gitlab-runner:latest

# Install curl and PHP
RUN  apt-get install -y curl php5 php5-cli php5-json \
php5-sqlite git php5-intl

# Install composer 
RUN curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer

# Install PHPUnit
RUN wget -O /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar && \
chmod 755 /usr/local/bin/phpunit
