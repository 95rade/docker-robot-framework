#!/usr/bin/env bash
set -e

pwd
ls -ltr
which robot

# Run an individual test suite if the TEST_SUITE environmental variable is set.
if [ -z "$TEST_SUITE" ]; then
    TEST_SUITE=""
fi

CMD="robot --console verbose --outputdir -d /reports -s /suites/$TEST_SUITE"

echo ${CMD}

``${CMD}``
