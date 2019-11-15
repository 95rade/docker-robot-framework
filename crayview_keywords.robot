*** Settings ***
Library   SeleniumLibrary
# You can add multiple Libraries
#Library  SeleniumLibrary timeout=10   implicit_wait=2   run_on_failure_keyword=Capture Page Screenshot
# This will capture screeshot on Failure, but it doesn't work!

*** Variables ***
${FF_BROWSER}       firefox
${CHROME_BROWSER}   Chrome
${DOCKER_BROWSER}   headlesschrome
${SELSPEED}         0.3s
#${LOGIN URL}       https://lmo-view01.dev.cray.com/auth?redirect=/overview
#${LOGIN URL}       http://venom-sms1:31080/auth
${LOGIN URL}        https://caribou12.us.cray.com/overview
${LOGIN USERNAME}   admin
${LOGIN PASSWORD}   admin

*** Keywords ***
#captureEntirePageScreenshot

Open Firefox Browser To Login Page
    Open Browser    ${LOGIN URL}    ${FF_BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${SELSPEED}
    Login Page Should Be Open
# Not part of Katalon code export.

Open Chrome Browser To Login Page
    Open Browser    ${LOGIN URL}    ${CHROME_BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${SELSPEED}
    Login Page Should Be Open
# Not part of Katalon code export.

Open Docker Browser To Login Page
    Open Browser    ${LOGIN URL}    ${DOCKER_BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${SELSPEED}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    VIEW for ClusterStor™
# Not part of Katalon code export.

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

open
    [Arguments]    ${element}
    Go To          ${element}

clickAndWait
    [Arguments]    ${element}
    Click Element  ${element}

click
    [Arguments]    ${element}
    Click Element  ${element}

sendKeys
    [Arguments]    ${element}    ${value}
    Press Keys     ${element}    ${value}

submit
    [Arguments]    ${element}
    Submit Form    ${element}

type
    [Arguments]    ${element}    ${value}
    Input Text     ${element}    ${value}

selectAndWait
    [Arguments]        ${element}  ${value}
    Select From List   ${element}  ${value}

select
    [Arguments]        ${element}  ${value}
    Select From List   ${element}  ${value}

verifyValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

verifyElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

verifyTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

verifyTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertConfirmation
    [Arguments]                  ${value}
    Alert Should Be Present      ${value}

assertText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

assertElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

assertTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

assertTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForText
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForValue
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

waitForElementPresent
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForVisible
    [Arguments]                  ${element}
    Page Should Contain Element  ${element}

waitForTitle
    [Arguments]                  ${title}
    Title Should Be              ${title}

waitForTable
    [Arguments]                  ${element}  ${value}
    Element Should Contain       ${element}  ${value}

doubleClick
    [Arguments]           ${element}
    Double Click Element  ${element}

doubleClickAndWait
    [Arguments]           ${element}
    Double Click Element  ${element}

goBack
    Go Back

goBackAndWait
    Go Back

runScript
    [Arguments]         ${code}
    Execute Javascript  ${code}

runScriptAndWait
    [Arguments]         ${code}
    Execute Javascript  ${code}

setSpeed
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

setSpeedAndWait
    [Arguments]           ${value}
    Set Selenium Timeout  ${value}

verifyAlert
    [Arguments]              ${value}
    Alert Should Be Present  ${value}
