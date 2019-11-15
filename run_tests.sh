#!/bin/bash
set -e

# Using Chromium
docker run ---rm -i \
    -v `pwd`/reports:/opt/robotframework/reports:Z \
    -v `pwd`/test:/opt/robotframework/tests:Z \
    -e BROWSER=chrome \
    rade/robot-framework:latest
