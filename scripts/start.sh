#!/bin/bash

# Check, if dockerd is running
if ! pgrep -x "dockerd" > /dev/null; then
  echo "dockerd not running, starting dockerd..."
  dockerd &
  sleep 2
else
  echo "dockerd is running."
fi

# Install additional packages if specified
if [ -n "$ADDITIONAL_PACKAGES" ]; then
  echo "Installing additional packages: $ADDITIONAL_PACKAGES"
  apk add --no-cache $(echo $ADDITIONAL_PACKAGES | tr ',' ' ')
fi

# By some strange reason we need to do echo command to get to the next command
echo " "

exec bash