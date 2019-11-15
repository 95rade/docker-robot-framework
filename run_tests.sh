#!/bin/bash
set -e

# Using Chromium
docker run \
    -v `pwd`/reports:/opt/robotframework/reports:Z \
    -v `pwd`/test:/opt/robotframework/tests:Z \
    -e BROWSER=chrome \
    ppodgorsek/robot-framework:latest
