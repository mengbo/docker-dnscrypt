#!/bin/bash

RESOLVER_NAME=${RESOLVER_NAME:-"opendns"}

/usr/local/sbin/dnscrypt-proxy --local-address=0.0.0.0:53 --resolver-name=${RESOLVER_NAME}
