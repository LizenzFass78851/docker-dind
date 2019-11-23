<p align=center><img src="https://alekslitvinenk.github.io/dind/DinD-NewLogo.png"></p><br>

<p align="center">
<a href="https://github.com/alekslitvinenk/dind/blob/master/README.md">[English]</a>
<a href="https://github.com/alekslitvinenk/dind/blob/master/docs/README_RU.md">[Русский]</a>
<br>

![Build Status](http://cicd.dockovpn.io/build/dind)
![Build Time](http://cicd.dockovpn.io/built/dind)
[![Docker Pulls](https://img.shields.io/docker/pulls/alekslitvinenk/dind.svg)](https://hub.docker.com/r/alekslitvinenk/dind/)
![GitHub](https://img.shields.io/github/license/alekslitvinenk/dind)

# 💎 DinD
Докер в Докере. Рабочее решение

### GitHub репозиторий:
https://github.com/alekslitvinenk/dind
### DockerHub репозиторий:
https://hub.docker.com/r/alekslitvinenk/dind

## ∵ Предпосылки
В настоящее время контейнеризированые решения стали стандартом де-факто для запуска многих серверных приложений и Докер является одним лидирующих провайдеров. Во время разработки приложений часто возникает необходимость хранить все артефакты и промежуточные контейнеры в одном месте и легко удалять все эти артефакты, когда контейнер с главным приложением был остановлен. Чтобы достичь этой цели, разработчики привыкли использовать команды `docker image prune -a` and `docker container prune`. Однако, данный подход таит в себе множество недостатков: в первую очередь, чтобы точно настраивать список удаляемых контейнеров, придется прибегать в написанию сложных шелл-скриптов и риск удалить контейнер с нужными данными очень велик. Чтобы более эффективно управлять промежуточными контейнерами, возникла идея запускать их внутри другого контейнера. Так родился проект DinD.

## 📺 Видео Руководство
<p align=center><a href="https://youtu.be/Fn7Fb8bCHSc"><img src="https://alekslitvinenk.github.io/docker-openvpn/assets/img/video-cover-play.png"></a></p><br>

## 🚀 Быстрый Старт
1. Запустите образ DinD:
    ```bash
    docker run --privileged -it \
    -p <hostPort-1>:<containerPort-1> \
    ...
    -p <hostPort-n>:<containerPort-n> \
    alekslitvinenk/dind
    ```
    ℹ️ **Note:** Make sure to bind all ports your child containers might need.

2. Запустите дочерний контейнер внутри DinD:
    ```bash
    docker run <docker-image>
    ```
    Запускайте дочерние контейнеры точно так же как вы делаете это обычно, правда есть несколько ограничений (смотрите ниже)<br>
    ℹ️ **Note:** Монтирование директорий для дочерних контейнеров пока не поддерживается.
  
 3. Повторите **шаг 2** столько раз сколько вам нужно.
