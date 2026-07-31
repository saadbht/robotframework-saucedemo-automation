*** Settings ***
Documentation    Checkout step two. Reads the two item prices and the item
...              total (before tax) to check they match.
Library          SeleniumLibrary
Library          String
Resource         ../config.robot

*** Variables ***
# {block} = item block in the list (3 = first item, 4 = second).
${OVERVIEW_PRICE_XPATH}     xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[{block}]/div[2]/div[2]/div[1]
${OVERVIEW_ITEM_TOTAL}      xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[6]
${OVERVIEW_FINISH_BUTTON}   xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/div[9]/button[2]

*** Keywords ***
Get Overview Item Price
    [Arguments]    ${block}
    ${locator}=    Replace String    ${OVERVIEW_PRICE_XPATH}    {block}    ${block}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    ${text}=     Get Text    ${locator}
    ${price}=    Parse Price    ${text}
    RETURN    ${price}

Get Displayed Item Total
    # Parse only the price value from the label.
    Wait Until Element Is Visible    ${OVERVIEW_ITEM_TOTAL}    ${TIMEOUT}
    ${text}=     Get Text    ${OVERVIEW_ITEM_TOTAL}
    ${total}=    Parse Price    ${text}
    RETURN    ${total}

Finish Purchase
    Wait Until Element Is Visible    ${OVERVIEW_FINISH_BUTTON}    ${TIMEOUT}
    Click Element    ${OVERVIEW_FINISH_BUTTON}
