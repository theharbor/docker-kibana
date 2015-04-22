#!/bin/bash

set -e
set -x

useradd --system --user-group --create-home --home /opt/kibana kibana

apt-get update
apt-get install --no-install-recommends -y ca-certificates curl
rm -rf /var/lib/apt/lists/*

curl --silent --show-error --location \
	$(curl --silent --show-error --location https://www.elastic.co/downloads/kibana | egrep --only-matching 'https://.*kibana-.+-linux-x64.tar.gz' | head -n 1) \
| tar --verbose --directory /tmp/ --extract --gunzip

mv /tmp/kibana-*-linux-x64/* /opt/kibana
rmdir /tmp/kibana-*-linux-x64/
