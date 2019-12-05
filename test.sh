#!/bin/sh
set -ex
echo "Hello-world"
pwd
ls -ltr
which robot
robot test/simpletest.robot  test/requests.robot
