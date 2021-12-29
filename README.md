# Docker Postfix

[![Build Status](https://github.ci.maxkratz.com/api/badges/maxkratz/docker_postfix/status.svg)](https://github.ci.maxkratz.com/maxkratz/docker_postfix)

*Unofficial* Postfix Dockerfile for backup MX (relay host) purposes
Prebuild images can be found at this [Dockerhub repository](https://hub.docker.com/r/maxkratz/postfix).


## Quickstart
After installing [Docker](https://docs.docker.com/get-docker/), just run the following steps:

* Copy `docker-compose.yml.example` to `docker-compose.yml`.
* Create your config files: `./config/main.cf`, `./config/relay_recipients`, `./config/dh_2048.pem`, `./config/mailname`, and `$ touch ./data/postfix.log`
    * You can use the provided example files to get started.
* Update the file `docker-compose.yml` and set your values.
* Run the following command to start your Postfix instance:
```
$ docker-compose up -d
```

The compose file also starts a container for publishing metrics using [this Docker image](https://github.com/maxkratz/postfix_exporter).


## Dockerfile
The Dockerfile can be found at the [Github repository](https://github.com/maxkratz/docker_postfix).


## What gets installed in this image?
The following packages are installed in this Docker image:

* Some utility packages like build essentials etc.
* Postfix


## Issues & Contribution
If you find any problems, bugs or missing packages, feel free to open an [issue on Github](https://github.com/maxkratz/docker_postfix/issues).
