#!/bin/bash

# Check, if dockerd is running
if ! pgrep -x "dockerd" > /dev/null; then
  echo "dockerd not running, starting dockerd..."
  dockerd &
  sleep 2
else
  echo "dockerd is running."
fi

cd ${APP_WORKSPACE_PATH}

# By some strange reason we need to do echo command to get to the next command
echo " "

exec bash