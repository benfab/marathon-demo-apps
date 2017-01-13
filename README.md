# Demos apps for Marathon

# 1. Overview

**Owncloud** 
demos the commnunication between containers and data persistence

Based on two containers, a PostgreSQL container and the owncloud application container.

Credits @ https://github.com/getstek/awg-mesos/tree/master/scripts/extras/test-mesos_docker-deployments 

**dockercoins**
demos a microservice architecture and how to scale it.

The application is made of fives services.

Credits @ https://github.com/jpetazzo/dockercoins

![DockerCoins](/dockercoins.png)


**Flask**
demos the loading balancing feature of the MesosMamba reference architecture.

Credits @ https://github.com/getstek/flaskviewer


# 2. Walktrough

Clone the repo `git clone https://github.com/benfab/marathon-demo-apps.git`

Go to the marathon-demo-apps folder `cd marathon-demo-apps` 

Update the marathon app definitiosn `<app>.json` with your microservice domain.

`find . -type f -name "*.json" -print0 | xargs -0 sed -i "s/"msdomain.com"/"enter-your-msdomain.com"/g" `

## Deploy Owncloud

`deploy.sh app owncloud/owncloud.json`

`deploy.sh app owncloud/postgres.json`

## Deploy app-flask

1. Build the docker image

Go to the app folder `cd app-flask`


Build the docker image from the Dockerfile `docker build -t  nexus.<your-ms-domain>:1400/app-flask .`


Push the image to your repo `docker push nexus.<your-ms-domain>:1400/app-flask`

2. Deploy the marathon application

`deploy.sh app app-flask/app-flask.json`


## Deploy Dockercoins

Build the Docker images

`cd rng`

`docker build .`

`docker tag nexus.<your-ms-domain>:1400/app-flask`

`docker push nexus.<your-ms-domain>:1400/app-flask`

Run the same steps, for the webui, worker, hasher images

Pull the redis official docker image your docker engine `docker pull redis`

Tag the redis official image `docker tag <image-id>.nexus.<your-ms-domain>:1400/redis` 

Push the redis official docker image your repo `docker push nexus.<your-ms-domain>:1400/redis`

Deploy the marathon services

`deploy.sh app dockercoins/rng.json`

`deploy.sh app dockercoins/hasher.json`

`deploy.sh app dockercoins/redis.json`

`deploy.sh app dockercoins/worker.json`

`deploy.sh app dockercoins/webui.json`

3. Browse the UI

http://haproxy-vip:1000

4. Scale the services

Browse the marathon web interface http://ip-vm-control:8080

Select indiviual service and scale them
