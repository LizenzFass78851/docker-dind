# 💎 DinD
Docker in Docker. The working solution

# Tags

| Image | Tag | Build | Latest |
|:------------------:|:--------------:|:-----------------:|:-----------------:|
| ghcr.io/lizenzfass78851/docker-dind | master | [![Build and Publish Docker Image](https://github.com/LizenzFass78851/docker-dind/actions/workflows/docker-image.yml/badge.svg?branch=master)](https://github.com/LizenzFass78851/docker-dind/actions/workflows/docker-image.yml) | 📌 |

### GitHub repo:
https://github.com/LizenzFass78851/docker-dind

## ∵ Preface
Nowadays, containerised solutions are extremely widespread and Docker has firmly occupied the leader place among them. Often, the necessity to keep all the generated files and intermediary containers in one single place and clean the cache every time the parent container was stopped. To acheive this goal, developers used to manually or by scripting clean all the garbage with `docker image purge -a` and `docker container purge`. When you need to perform these operations quite often and especially when you need to clean up not everything, but only some images and containers linked with some other one, you might think about coming up with some scritable solution. But these home-made solutions often come with a gotcha -- they are error prone and accidentally you can delete conteiner wihci wsn't supposed to be deleted with all its data. To keep all the intermediary containers together and delete them at once, you can employ Docker-in-Docker (dind) solution.

## 🚗 Quick Start (docker)
1. Run dockerized Docker container:
    ```bash
    docker run --privileged -it \
    -p <hostPort-1>:<containerPort-1> \
    ...
    -p <hostPort-2>:<containerPort-2> \
    ghcr.io/lizenzfass78851/docker-dind:latest
    ```
    ℹ️ **Note:** Make sure to bind all ports your child containers might need.

2. Run child container:
    ```bash
    docker run <docker-image>
    ```
    Your run container just like you do this on your host machine, some limitations may apply though (see note below)<br>
    ℹ️ **Note:** Bind mounting directories isn't suported at the moment.
  
 3. Repeat **step 2** as many times as you need.

## 🚀 Fast Start (docker compose)

- How to Run it
```bash
git clone https://github.com/LizenzFass78851/docker-dind dind --single-branch --depth 1
cd dind
nano docker-compose.yml # if you want to override any default value
docker compose up -d
```

- How to Attach it
```bash
docker compose exec -it dind bash
```
