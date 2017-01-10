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

## Deploy Dockercoins

`deploy.sh app dockercoins/rng.json`

`deploy.sh app dockercoins/hasher.json`

`deploy.sh app dockercoins/redis.json`

`deploy.sh app dockercoins/worker.json`

`deploy.sh app dockercoins/webui.json`

## Deploy app-flask

`deploy.sh app app-flask/app-flask.json`
