*** Settings ***
Documentation    Login page.
Library          SeleniumLibrary
Resource         ../config.robot

*** Variables ***
${LOGIN_USERNAME_INPUT}    xpath=/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/form[1]/div[1]/input[1]
${LOGIN_PASSWORD_INPUT}    xpath=/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/form[1]/div[2]/input[1]
${LOGIN_BUTTON}            xpath=/html[1]/body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/form[1]/input[1]

*** Keywords ***
Login With Credentials
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${LOGIN_USERNAME_INPUT}    ${TIMEOUT}
    Input Text        ${LOGIN_USERNAME_INPUT}    ${username}
    Input Password    ${LOGIN_PASSWORD_INPUT}    ${password}
    Click Element     ${LOGIN_BUTTON}
