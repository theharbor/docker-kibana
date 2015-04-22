#!/bin/bash

usage() {
	echo "Usage:" 2>&1
	echo "" 2>&1
	echo "shell              -- Start an interactive shell" 2>&1
	echo "kibana             -- Start kibana" 2>&1
}

set -x
ES_ADDR=$(echo $ES_PORT | sed -e 's\tcp://\http://\' -)

case $1 in
	"shell")
		exec /bin/bash
		;;
	"kibana")
		sed --in-place --expression "s;^elasticsearch_url:.*;elasticsearch_url: \"${ES_ADDR}\";g" /opt/kibana/config/kibana.yml || exit 1
		exec runas kibana /opt/kibana/bin/kibana
		;;
	*)
		usage
		exit 1
		;;
esac
