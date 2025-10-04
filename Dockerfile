FROM docker:28.5-dind

LABEL maintainer="Alexander Litvinenko <array.shift@yahoo.com>"

ENV APP_NAME=dind
ENV APP_INSTALL_PATH=/opt/${APP_NAME}
ENV APP_WORKSPACE_PATH=/workspace

WORKDIR ${APP_INSTALL_PATH}

COPY scripts .

RUN apk add --no-cache bash

WORKDIR ${APP_WORKSPACE_PATH}

ENTRYPOINT [ "/opt/dind/start.sh" ]
