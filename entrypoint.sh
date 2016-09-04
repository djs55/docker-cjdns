#!/usr/bin/env bash

set -e

CONF_DIR="/etc/cjdns"

cjdroute --nobg < "$CONF_DIR/cjdroute.conf"
exit $?
