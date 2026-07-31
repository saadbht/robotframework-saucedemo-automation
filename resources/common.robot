*** Settings ***
Documentation    Browser open and close, shared by all tests.
Library          SeleniumLibrary
Library          String
Library          ../libraries/browser_options.py
Resource         config.robot

*** Keywords ***
Open Application
    ${options}=    Get Browser Options
    Open Browser    ${URL}    browser=${BROWSER}    options=${options}
    Maximize Browser Window
    Set Selenium Timeout    ${TIMEOUT}

Get Browser Options
    ${browser}=    Convert To Lower Case    ${BROWSER}
    IF    'firefox' in '${browser}' or '${browser}' == 'ff'
        ${options}=    Get Firefox Options    ${HEADLESS}
    ELSE
        ${options}=    Get Chrome Options    ${HEADLESS}
    END
    RETURN    ${options}

Close Application
    Close All Browsers
