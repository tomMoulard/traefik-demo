#!/bin/bash

function error () {
    make down
    exit 1
}

set -xe

sleep 11s

make ps | grep unhealthy && error

curl traefik.localhost || error
