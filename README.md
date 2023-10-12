# README

## Fill env vars

- Using `.env.sample` as base, create a new file `.env` and setup the env vars values

## Build and run project

```
docker-compose build
docker-compose up
```

## Seed the database

- Get the running container id `docker-compose ps`
- Connect to the container `docker exec -it <container-name> /bin/bash`
- Inside the container run `bundle exec rake db:seed`

