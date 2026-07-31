*** Settings ***
Documentation    Cart page. Items keep the order they were added (rows 3 and 4).
Library          SeleniumLibrary
Library          String
Resource         ../config.robot

*** Variables ***
${CHECKOUT_BUTTON}         xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/button[2]
# {block} = item row (3 = first item, 4 = second).
${CART_ITEM_NAME_XPATH}    xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[{block}]/div[2]/a[1]/div[1]

*** Keywords ***
Get Cart Item Name
    [Arguments]    ${block}
    ${locator}=    Replace String    ${CART_ITEM_NAME_XPATH}    {block}    ${block}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    ${name}=    Get Text    ${locator}
    RETURN    ${name}

Cart Should Contain Items
    [Arguments]    ${expected_first}    ${expected_second}
    ${first}=     Get Cart Item Name    3
    ${second}=    Get Cart Item Name    4
    Should Be Equal As Strings    ${first}     ${expected_first}
    Should Be Equal As Strings    ${second}    ${expected_second}

Proceed To Checkout
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON}    ${TIMEOUT}
    Click Element    ${CHECKOUT_BUTTON}
