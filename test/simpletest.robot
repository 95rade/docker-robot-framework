*** Settings ***
Library			SeleniumLibrary

*** Variables ***
${BROWSER}		headlesschrome

*** Test Cases ***
Visit Baidu
	Open Browser			https://www.baidu.com		${BROWSER}
	Capture Page Screenshot
	[Teardown]  Close Browser

Visit Bing
	Open Browser			https://www.bing.com		${BROWSER}
	Capture Page Screenshot
	[Teardown]  Close Browser

Visit Google
	Open Browser			https://www.google.com		${BROWSER}
	Capture Page Screenshot
	[Teardown]  Close Browser

Visit Yahoo
	Open Browser			https://search.yahoo.com	${BROWSER}
	Capture Page Screenshot
	[Teardown]  Close Browser
