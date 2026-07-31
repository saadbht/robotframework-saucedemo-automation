*** Settings ***
Documentation    Checkout: Complete (success) page.
Library          SeleniumLibrary
Resource         ../config.robot

*** Variables ***
${SUCCESS_HEADER}    xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/h2[1]

*** Keywords ***
Verify Order Success
    [Arguments]    ${expected_text}=Thank you for your order!
    Wait Until Element Is Visible    ${SUCCESS_HEADER}    ${TIMEOUT}
    ${actual}=    Get Text    ${SUCCESS_HEADER}
    Should Be Equal As Strings    ${actual}    ${expected_text}
