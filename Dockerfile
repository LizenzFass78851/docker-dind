FROM docker:28.0.4

LABEL maintainer="Alexander Litvinenko <array.shift@yahoo.com>"

ENV APP_NAME dind
ENV APP_INSTALL_PATH /opt/${APP_NAME}

WORKDIR ${APP_INSTALL_PATH}

COPY scripts .

RUN apk add --no-cache iptables bash

ENTRYPOINT [ "./start.sh" ]