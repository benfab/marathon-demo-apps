# Demos apps for Marathon

# 1. Overview

**Owncloud** 
Demo the commnunication between containers and data persistence

Based on two containers, a PostgreSQL container and the owncloud application container.

Credits @ https://github.com/getstek/awg-mesos/tree/master/scripts/extras/test-mesos_docker-deployments 

**dockercoins**
Demo a microservice architecture and how to scale it.

The application is made of fives services.

Credits @ https://github.com/jpetazzo/dockercoins

**Flask**
Demo the loading balancing feature using the MesosMamba reference architecture.

Credits @ https://github.com/getstek/flaskviewer


# 2. Walktrough

Clone the repo `git clone https://github.com/benfab/marathon-demo-apps.git`

Go to the marathon-demo-apps folder `cd marathon-demo-apps` 

Update the marathon app definition `<app>.json` with your microservice domain.

`find . -type f -name "*.json" -print0 | xargs -0 sed -i "s/"msdomain.com"/"yourmsdomain.com"/g" `

## Deploy Owncloud

`deploy.sh app owncloud/owncloud.json`

`deploy.sh app owncloudpostgres.json`

## Deploy app-flask

1. Build the docker image

Go to the app folder `cd app-flask`


Build the docker image from the Dockerfile `docker build -t  nexus.<your-ms-domain>:1400/app-flask .`


Push the image to your repo `docker push nexus.<your-ms-domain>:1400/app-flask`

2. Deploy the marathon application

Edit the app-flask.json definition to specify the url of the image.

`deploy.sh app app-flask/app-flask.json`


## Deploy Dockercoins

Build the Docker images

`cd rng`

`docker build .`

`docker tag nexus.<your-ms-domain>:1400/app-flask`

`docker pull nexus.<your-ms-domain>:1400/app-flask`


Deploy the services

`deploy.sh app dockercoins/rng.json`

`deploy.sh app dockercoins/hasher.json`

`deploy.sh app dockercoins/redis.json`

`deploy.sh app dockercoins/worker.json`

`deploy.sh app dockercoins/webui.json`

3. Browse the UI

4. Scale the services
