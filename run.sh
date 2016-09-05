#!/bin/sh

BIND=$(cat etc/cjdroute.conf | jq .interfaces.UDPInterface[0].bind | cut -f 2 -d ":" | cut -f 1 -d '"')

docker run -it --rm --cap-add=NET_ADMIN --device=/dev/net/tun \
	--volume="$(pwd)/etc:/etc/cjdns" \
	-p $(echo $BIND):$(echo $BIND)/udp \
	cjdns /entrypoint.sh

