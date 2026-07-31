*** Settings ***
Documentation    Checkout step one - fill name and address information.
Library          SeleniumLibrary
Resource         ../config.robot

*** Variables ***
${FIRST_NAME_INPUT}    xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/input[1]
${LAST_NAME_INPUT}     xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[2]/input[1]
${ZIP_INPUT}           xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[1]/div[3]/input[1]
${CONTINUE_BUTTON}     xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/form[1]/div[2]/input[1]

*** Keywords ***
Fill Checkout Information
    [Arguments]    ${first_name}    ${last_name}    ${zip_code}
    Wait Until Element Is Visible    ${FIRST_NAME_INPUT}    ${TIMEOUT}
    Input Text       ${FIRST_NAME_INPUT}    ${first_name}
    Input Text       ${LAST_NAME_INPUT}     ${last_name}
    Input Text       ${ZIP_INPUT}           ${zip_code}
    Click Element    ${CONTINUE_BUTTON}
