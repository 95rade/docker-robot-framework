*** Settings ***
Library  SeleniumLibrary
Documentation:
... 
...                 Basic tests for CSView Login / Logout / Page Navigation
...
#Suite Setup         Open Browser To Login Page
#Suite Teardown      Close Browser
#Test Setup          Go To Login Page
#Test Template       Login With Invalid Credentials Should Fail
Resource            ./resources/crayview_keywords.robot

*** Variables ***
${SELSPEED}     0.5s
${username}     admin
${password}     admin
#${home_URL}     http://venom-sms1:31080/auth    # we use home_URL from keywords Resource
#${wait}=        Set Browser Implicit Wait
${Xpath}        xpath=(.//*[normalize-space(text()) and normalize-space(.)='/'])[3]/following::div[1]   #Jobs button
${Xpath2}       xpath=(.//*[normalize-space(text()) and normalize-space(.)='/'])[4]/following::div[1]  #OSTs button
#${Xpath3}       xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]   #username   
#${Xpath4}       xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]  #password

*** Test Cases ***

Test 2 - All Elements Locators Exist - Overview Page
    [Tags]  test_case_id=C152625    CrayView rocks      # Test Run=R2097  Test Suite=T2832331
    [Setup]  Run Keywords   Open Docker Browser To Login Page
    ...              AND   Set Selenium Speed  ${SELSPEED}
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]
    type     xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]    ${username}
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]
    type     xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]    ${password}
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::div[2]
    Sleep     2
    Run Keywords     Login Page Should Be Open
    Capture Page Screenshot
    ${Result}       Page Should Contain Element     ${Xpath}
    Run Keyword If  '${Result}'=='PASS'   Log Console       Jobs Element found!
    ${Result2}      Page Should Contain Element     ${Xpath2}
    Run Keyword If  '${Result2}'=='PASS'   Log Console       OSTs Element found!
    #${Result3}      Page Should Contain Element     ${Xpath3}
    #${Result4}      Page Should Conatin Element     ${Xpath4}
    #Run Keyword Unless      '${Result}'=='PASS'  Keyword   *args
    [Teardown]   Close Browser


Test 5 - Navigate to Jobs Page
    [Tags]  test_case_id=C143590    CrayView rocks      # Test Run=R2097  Test Suite=T2832331
    #[Setup]  Run Keywords  Open Browser     ${home_URL}     ${BROWSER}
    #...              AND   Set Selenium Speed  ${SELSPEED}
    [Setup]   Run Keywords  Open Docker Browser To Login Page
    ...              AND   Set Selenium Speed  ${SELSPEED}
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]
    type     xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]    ${username}
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]
    type     xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]    ${password}
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::div[2]
    Sleep     3
    Capture Page Screenshot
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='/'])[3]/following::div[1]
    Sleep     2
    Capture Page Screenshot
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[1]
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[3]
    [Teardown]  Close Browser

Test 6 - Navigate to OST Page
    [Tags]  test_case_id=C143591    CrayView rocks      # Test Run=R2097  Test Suite=T2832331
    #[Setup]  Run Keywords  Open Browser     ${home_URL}     ${BROWSER}
    #...              AND   Set Selenium Speed  ${SELSPEED}
    [Setup]   Run Keywords  Open Docker Browser To Login Page
    ...              AND   Set Selenium Speed  ${SELSPEED}
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]
    type     xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]    ${username}
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]
    type     xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]    ${password}
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::div[2]
    Sleep     3
    Capture Page Screenshot
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='/'])[4]/following::div[1]
    Sleep     2
    Capture Page Screenshot
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[1]
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[3]
    [Teardown]  Close Browser

# Following tests are for Chrome only (the only officially supported browser)

Test 7 - Navigate to Kibana Page  # https://connect.us.cray.com/jira/browse/SMA-5029
    [Tags]  test_case_id=C159768   CrayView rocks      # Test Run=R2097  Test Suite=T2832331
    [Setup]  Run Keywords  Open Docker Browser To Login Page
    ...              AND   Set Selenium Speed  ${SELSPEED}
    type    xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]    admin
    type    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]    admin
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::div[2]
    sleep   2
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Alarms'])[3]/following::div[6]
    sleep   3
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[1]
    sleep   4
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[3]
    [Teardown]  Close Browser

Test 8 - Navigate to Metadata Page from Overview Page  # https://connect.us.cray.com/jira/browse/SMA-5028
    [Tags]  test_case_id=C159760   CrayView rocks      # Test Run=R2097  Test Suite=T2832331
    #[Setup]  Run Keywords  Open Browser     ${home_URL}     ${BROWSER}
    #...              AND   Set Selenium Speed  ${SELSPEED}
    [Setup]  Run Keywords  Open Docker Browser To Login Page
    ...              AND   Set Selenium Speed  ${SELSPEED}
    # open    https://caribou12.us.cray.com/auth
    type    xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]    admin
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]
    type    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]    admin
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::div[2]
    sleep   2
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Avg. write'])[2]/following::div[2]     # Metadata icon
    #selectFrame    index=1
    sleep   2
    #click    xpath.neighbor=(.//*[normalize-space(text()) and normalize-space(.)='Lustre File System Metadata'])[1]/preceding::img[1]     #Grafana pulldown
    #sleep   2
    #click    link=Home
    #click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='ClusterStor Storage Overview'])[1]/i[2]
    #type    xpath=(.//*[normalize-space(text()) and normalize-space(.)='UTC'])[1]/following::input[1]    Infini
    #click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='InfiniBand'])[1]/following::span[2]
    #selectFrame    relative=parent
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[1]
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[3]
    [Teardown]  Close Browser

Test 9 - Grafana field Search via Metadata Link     # https://connect.us.cray.com/jira/browse/SMA-5028
    [Tags]  test_case_id=C159761   CrayView rocks      # Test Run=R2097  Test Suite=T2832331
    #[Setup]  Run Keywords  Open Browser     ${home_URL}     ${BROWSER}
    #...              AND   Set Selenium Speed  ${SELSPEED}
    [Setup]  Run Keywords  Open Docker Browser To Login Page
    ...              AND   Set Selenium Speed  ${SELSPEED}
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]
    type    xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]    admin
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]
    type    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]    admin
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::div[2]
    sleep   2
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Avg. write'])[2]/following::div[2]    # Metadata Link
    sleep   2
    #selectFrame     index=1
    click   //div/div/div/a       # Search field
    sleep   2
    #type    xpath=(.//*[normalize-space(text()) and normalize-space(.)='UTC'])[1]/following::input[1]    Infini
    #
    type    /html/body/grafana-app/div[2]/div/dashnav/dashboard-search/div[2]/div[1]/input      Infini
    sleep   2
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='InfiniBand'])[1]/following::span[2]
    selectFrame    relative=parent
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[1]
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[3]
    [Teardown]  Close Browser

Test 10 - Navigate to Alarms Page  # https://connect.us.cray.com/jira/browse/SMA-5029
    [Tags]  test_case_id=C159769   CrayView rocks      # Test Run=R2097  Test Suite=T2832331
    [Setup]  Run Keywords  Open Docker Browser To Login Page
    ...              AND   Set Selenium Speed  ${SELSPEED}
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]
    type    xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]    admin
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]
    type    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]    admin
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::div[2]
    sleep   2
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Health'])[2]/following::div[6]
    sleep   2
    #click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='snx11253n003'])[1]/following::div[9]
    #sleep   2
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[1]
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[3]
    [Teardown]  Close Browser   

Test 11 - Alarms Filter Critical
    [Tags]  test_case_id=C159770   CrayView rocks      # Test Run=R2097  Test Suite=T2832331
    [Setup]  Run Keywords  Open Docker Browser To Login Page
    ...              AND   Set Selenium Speed  ${SELSPEED}
    # open    https://caribou12.us.cray.com/auth
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]
    type    xpath=(.//*[normalize-space(text()) and normalize-space(.)='User Name'])[1]/following::input[1]    admin
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]
    type    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::input[1]    admin
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Password'])[1]/following::div[2]
    sleep   2
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Health'])[2]/following::div[6]  # Alarms icon
    Capture Page Screenshot   # All Alarms
    sleep    2
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Alarms'])[2]/following::div[3]  # Filter icon
    sleep    1
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='High'])[2]/div[1]       # Uncheck High
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Medium'])[2]/div[1]     # Uncheck Medium
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Low'])[2]/div[1]        # Uncheck Low
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Ok'])[2]/following::div[2]  # Submit
    Capture Page Screenshot   # Filtered Critical Alarms
    sleep   1
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Filter'])[1]/following::div[3]    # Delete filter
    sleep   1
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[1]
    click    xpath=(.//*[normalize-space(text()) and normalize-space(.)='Admin'])[1]/following::div[3]
    [Teardown]  Close Browser  

# Locators:
# Jobs = xpath=(.//*[normalize-space(text()) and normalize-space(.)='/'])[3]/following::div[1]
# OSTs= xpath=(.//*[normalize-space(text()) and normalize-space(.)='/'])[4]/following::div[1]
# ScreenShots comparison:
# https://blog.codecentric.de/en/2017/09/robot-framework-compare-images-screenshots/