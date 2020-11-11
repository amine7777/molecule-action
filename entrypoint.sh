#!/bin/sh -l

apk add build-base libffi-dev musl-dev openssl-dev
apk add python3-dev py-pip
pip3 install docker ansible
pip3 install molecule[docker] yamllint ansible-lint