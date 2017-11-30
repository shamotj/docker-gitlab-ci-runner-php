FROM ubuntu:16.04

ADD https://github.com/Yelp/dumb-init/releases/download/v1.0.2/dumb-init_1.0.2_amd64 /usr/bin/dumb-init
RUN chmod +x /usr/bin/dumb-init

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y ca-certificates wget apt-transport-https vim nano \
    curl php7.0 php7.0-cli php7.0-json php7.0-sqlite git php7.0-intl php7.0-imap \
    php-xdebug php7.0-curl php7.0-mbstring php-xml php7.0-soap unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash

RUN cat > /etc/apt/preferences.d/pin-gitlab-runner.pref <<EOF \
Explanation: Prefer GitLab provided packages over the Debian native ones \
Package: gitlab-runner \
Pin: origin packages.gitlab.com \
Pin-Priority: 1001 \
EOF

RUN echo "apt-get update -y && \
    apt-get install -y gitlab-runner && \
    wget -q https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-Linux-x86_64 -O /usr/bin/docker-machine && \
    chmod +x /usr/bin/docker-machine && \
    apt-get clean && \
    mkdir -p /etc/gitlab-runner/certs && \
    chmod -R 700 /etc/gitlab-runner && \
    rm -rf /var/lib/apt/lists/*

ADD entrypoint /
RUN chmod +x /entrypoint

VOLUME ["/etc/gitlab-runner", "/home/gitlab-runner"]
ENTRYPOINT ["/usr/bin/dumb-init", "/entrypoint"]
CMD ["run", "--user=gitlab-runner", "--working-directory=/home/gitlab-runner"]

# Install composer 
RUN curl -sS https://getcomposer.org/installer | php && \
mv composer.phar /usr/local/bin/composer

# Install PHPUnit
RUN wget -O /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-5.7.phar && \
chmod 755 /usr/local/bin/phpunit
