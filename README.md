# Gitlab CI runner docker image with PHP, Composer and PHPUnit
This image is based on official gitlab/gitlab-runner:latest, which is based on Ubuntu 14.04.

## 1. Pull runner image
`docker pull shamot/docker-gitlab-ci-runner-php:ubuntu`

## 2. Run image
`docker run -d --name gitlab-runner --restart always  
-v /var/run/docker.sock:/var/run/docker.sock  
-v /srv/gitlab-runner/config:/etc/gitlab-runner  shamot/docker-gitlab-ci-runner-php`

## 3. Register runner
`docker exec -it gitlab-runner gitlab-runner register`
