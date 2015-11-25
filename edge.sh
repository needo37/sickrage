#!/bin/bash

# Does the user want the latest version
if [ -z "$EDGE" ]; then
  echo "Bleeding edge not requested"
else
  apt-get update
  apt-get install -qy git
  rm -rf /opt/sickrage
  git clone https://github.com/SickRage/SickRage.git /opt/sickrage
  chown -R nobody:users /opt/sickrage
fi
