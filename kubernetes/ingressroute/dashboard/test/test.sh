#!/bin/bash

function error () {
    make down
    exit 1
}

set -xe

sleep 25s

[ "$(make stat | grep Running | wc -l)" -ne 2 ] && error

curl traefik.localhost/dashboard/ || error

curl not.whoami.localhost | grep 404 ||  error
