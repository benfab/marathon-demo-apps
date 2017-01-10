# Demos apps for Marathon

**Owncloud** 
Demo the commnunication between containers and data persistence
Based on two containers, a PostgreSQL database and the application.

Credits @ https://github.com/getstek/awg-mesos/tree/master/scripts/extras/test-mesos_docker-deployments 

**dockercoins**
Demo a microservice architecture and how to scale it.
The application is made of fives services.

Credits @ https://github.com/jpetazzo/dockercoins

**Flask**
Demo the loading balancing feature 

Credits @ https://github.com/getstek/flaskviewer

## Deploy Owncloud

`deploy.sh app owncloud/owncloud.json`

`deploy.sh app owncloudpostgres.json`

## Deploy app-flask

1. Build the docker image

`cd app-flask`

`docker build .`

`docker images`

`docker tag <image-id> nexus.<your-ms-domain>:1400/app-flask`

`docker push nexus.<your-ms-domain>:1400/app-flask`

2. Deploy the marathon application

Edit the app-flask.json definition to specify the url of the image.

`deploy.sh app app-flask/app-flask.json`


## Deploy Dockercoins

1. Build the Docker images

`cd rng`

`docker build .`

`docker tag nexus.<your-ms-domain>:1400/app-flask`

`docker pull nexus.<your-ms-domain>:1400/app-flask`


2. Deploy the services

`deploy.sh app dockercoins/rng.json`

`deploy.sh app dockercoins/hasher.json`

`deploy.sh app dockercoins/redis.json`

`deploy.sh app dockercoins/worker.json`

`deploy.sh app dockercoins/webui.json`

3. Browse the UI

4. Scale the services
