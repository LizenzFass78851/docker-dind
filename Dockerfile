FROM docker:28.0.2

LABEL maintainer="Alexander Litvinenko <array.shift@yahoo.com>"

ENV APP_NAME=dind
ENV APP_INSTALL_PATH=/opt/${APP_NAME}
ENV APP_WORKSPACE_PATH=/workspace

WORKDIR ${APP_INSTALL_PATH}

COPY scripts .

RUN apk add --no-cache iptables bash

RUN DOCKER_VERSION=$(docker --version | awk '{print $3}' | sed 's/,//')
RUN wget https://github.com/moby/moby/raw/refs/tags/v${DOCKER_VERSION}/hack/dind \
    -O /usr/local/bin/dind && \
    chmod +x /usr/local/bin/dind

WORKDIR ${APP_WORKSPACE_PATH}

ENTRYPOINT [ "/opt/dind/start.sh" ]
