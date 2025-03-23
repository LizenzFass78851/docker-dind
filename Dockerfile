FROM docker:29.1-dind

LABEL maintainer="Alexander Litvinenko <array.shift@yahoo.com>"

COPY --from=docker:20.10.0 /usr/local/bin/containerd* /usr/local/bin/
COPY --from=docker:20.10.0 /usr/local/bin/ctr /usr/local/bin/
COPY --from=docker:20.10.0 /usr/local/bin/runc /usr/local/bin/
COPY --from=docker:20.10.0 /usr/local/bin/docker /usr/local/bin/
ENV DOCKER_BUILDKIT=0

ENV APP_NAME=dind
ENV APP_INSTALL_PATH=/opt/${APP_NAME}
ENV APP_WORKSPACE_PATH=/workspace

WORKDIR ${APP_INSTALL_PATH}

COPY scripts .

RUN apk add --no-cache bash

WORKDIR ${APP_WORKSPACE_PATH}

ENTRYPOINT [ "/opt/dind/start.sh" ]
