#!/usr/bin/env bash

WEBROOT="/var/www/html"

# Get the common settings (CACTI_VERSION etc)
. /vagrant/settings.sh

if [ "X$WEATHERMAP_VERSION" = "Xrsync" ]; then
  echo "rsyncing weathermap from local dir"
  sudo rsync -av --exclude=composer.lock --exclude=vendor/ --exclude=websrc/ /network-weathermap/ $WEBROOT/cacti/plugins/weathermap/
  sudo chown -R cacti ${WEBROOT}/cacti/plugins/weathermap
fi