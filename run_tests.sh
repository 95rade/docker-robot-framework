#!/bin/bash
set -e
# Using Chrome
docker run --rm -i \
    -v `pwd`/reports:/opt/robotframework/reports:Z \
    -v `pwd`/test:/opt/robotframework/tests:Z \
    -e BROWSER=chrome \
    --security-opt seccomp:unconfined \
    --shm-size=512mb \
    robot-image:latest
