# Robot Framework in Docker Alpine, with Firefox and Chrome

## What is it?

This project consists of a Docker image containing a Robot Framework installation.

This installation also contains Firefox, Chrome and the Selenium library for Robot Framework. The test cases and reports should be mounted as volumes.

## Versioning

The versioning of this image follows the one of Robot Framework:

* Major version matches the one of Robot Framework
* Minor and patch versions are specific to this project (allows to update the versions of the other dependencies)

The versions used are:

* [Robot Framework](https://github.com/robotframework/robotframework) 3.1.2
* [Robot Framework DatabaseLibrary](https://github.com/franz-see/Robotframework-Database-Library) 1.2 
* [Robot Framework Faker](https://github.com/guykisel/robotframework-faker) 4.2.0
* [Robot Framework FTPLibrary](https://github.com/kowalpy/Robot-Framework-FTP-Library) 1.6
* [Robot Framework IMAPLibrary](https://github.com/rickypc/robotframework-imaplibrary) 0.3.0
* [Robot Framework Pabot](https://github.com/mkorpela/pabot) 0.91
* [Robot Framework Requests](https://github.com/bulkan/robotframework-requests) 0.6.2
* [Robot Framework SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary) 4.1.0
* [Robot Framework SSHLibrary](https://github.com/robotframework/SSHLibrary) 3.4.0
* Firefox 70.0
* Chromium 78.0

As stated by [the official GitHub project](https://github.com/robotframework/Selenium2Library), starting from version 3.0, Selenium2Library is renamed to SeleniumLibrary and this project exists mainly to help with transitioning. The Selenium2Library 3.0.0 is also the last release and for new releases, please look at the [SeleniumLibrary](https://github.com/robotframework/SeleniumLibrary) project.

## Running the container

This container can be run using the following command:

    # Using Chrome
    docker run --rm -i \   # --rm remove container after run.
        -v `pwd`/reports:/opt/robotframework/reports:Z \
        -v `pwd`/test:/opt/robotframework/tests:Z \
        -e BROWSER=chrome \
        --security-opt seccomp:unconfined \
        --shm-size=512mb \
        rade/robot-framework:latest

### Switching browsers

Browsers can be easily switched. It is recommended to define `${BROWSER} %{BROWSER}` in your Robot variables and to use `${BROWSER}` in your test cases. This allows to set the browser in a single place if needed.

When running your tests, simply add `-e BROWSER=chrome` or `-e BROWSER=firefox` or `-e BROWSER=headlesschrome` to the run command.

### Changing the container screen's resolution

It is possible to define the settings of the virtual screen in which the browser is run by changing several environment variables:

* `SCREEN_COLOUR_DEPTH` (default: 24)
* `SCREEN_HEIGHT` (default: 1080)
* `SCREEN_WIDTH` (default: 1920)

### Parallelisation

It is possible to parallelise the execution of your test suites. Simply define the `ROBOT_THREADS` environment variable, for example:

    docker run \
        -e ROBOT_THREADS=4 \
        rade/robot-framework:latest

By default, there is no parallelisation.

### Passing additional options

RobotFramework supports many options such as `--exclude`, `--variable`, `--loglevel`, etc. These can be passed by using the `ROBOT_OPTIONS` environment variable, for example:

    docker run \
        -e ROBOT_OPTIONS="--loglevel DEBUG" \
        rade/robot-framework:latest

## Testing this project

Not convinced yet? Simple tests have been prepared in the `test/` folder, you can run them using the following commands:

    # Using Chromium
    docker run \
        -v `pwd`/reports:/opt/robotframework/reports:Z \
        -v `pwd`/test:/opt/robotframework/tests:Z \
        -e BROWSER=chrome \
        rade/robot-framework:latest

    # Using Firefox
    docker run \
        -v `pwd`/reports:/opt/robotframework/reports:Z \
        -v `pwd`/test:/opt/robotframework/tests:Z \
        -e BROWSER=firefox \
        rade/robot-framework:latest

For Windows users who use **PowerShell**, the commands are slightly different:

    # Using Chromium
    docker run \
        -v ${PWD}/reports:/opt/robotframework/reports:Z \
        -v ${PWD}/test:/opt/robotframework/tests:Z \
        -e BROWSER=chrome \
        rade/robot-framework:latest

    # Using Firefox
    docker run \
        -v ${PWD}/reports:/opt/robotframework/reports:Z \
        -v ${PWD}/test:/opt/robotframework/tests:Z \
        -e BROWSER=firefox \
        rade/robot-framework:latest

Screenshots of the results will be available in the `reports/` folder.

## Troubleshooting

### Chromium is crashing

Chrome drivers might crash due to the small size of `/dev/shm` in the docker container:
> UnknownError: session deleted because of page crash

This is [a known bug of Chromium](https://bugs.chromium.org/p/chromium/issues/detail?id=715363).

To avoid this error, please change the shm size when starting the container by adding the following parameter: `--shm-size=1g` (or any other size more suited to your tests)

### Accessing the logs

In case further investigation is required, the logs can be accessed by mounting their folder. Simply add the following parameter to your `run` command:

* Linux/Mac: ``-v `pwd`/logs:/var/log:Z``  or `-v $PWD/reports:/var/reports:Z`
* Windows: ``-v ${PWD}/logs:/var/log:Z``

### Error: Suite contains no tests

When running tests, an unexpected error sometimes occurs:

> [Error] Suite contains no tests.

There are two main causes to this:
* Either the test folder is not the right one,
* Or the permissions on the test folder /test files are too restrictive.

As there can sometimes be issues as to where the tests are run from, make sure the correct folder is used by trying the following actions:
* Use a full path to the folder instead of a relative path,
* Replace any `pwd` or ${PWD} or $PWD with the full path to the folder.

It is also important to check if Robot Framework is allowed to access the resources it needs, i.e.:
* The folder where the tests are located,
* The test files themselves.

## Please contribute!

Have you found an issue? Do you have an idea for an improvement? Feel free to contribute by submitting it [on the GitHub project](https://github.com/ppodgorsek/docker-robot-framework/issues).
