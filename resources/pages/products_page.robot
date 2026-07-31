*** Settings ***
Documentation    Inventory page. After sorting low to high, items are
...              cheapest-first, so we pick by position ({index}, 1 = cheapest).
Library          SeleniumLibrary
Library          String
Resource         ../config.robot

*** Variables ***
${SORT_DROPDOWN}    xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/span[1]/select[1]
${CART_LINK}        xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[3]/a[1]
${CART_BADGE}       xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[3]/a[1]/span[1]

# {index} = product position in the list.
${PRODUCT_NAME_XPATH}     xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[{index}]/div[2]/div[1]/a[1]/div[1]
${PRODUCT_PRICE_XPATH}    xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[{index}]/div[2]/div[2]/div[1]
${PRODUCT_ADD_XPATH}      xpath=/html[1]/body[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[{index}]/div[2]/div[2]/button[1]

*** Keywords ***
Sort Products By Price Low To High
    Wait Until Element Is Visible    ${SORT_DROPDOWN}    ${TIMEOUT}
    Select From List By Value        ${SORT_DROPDOWN}    lohi
    # Wait for the sorted list to render.
    ${first}=    Replace String    ${PRODUCT_NAME_XPATH}    {index}    1
    Wait Until Element Is Visible    ${first}    ${TIMEOUT}

Get Item Name At Position
    [Arguments]    ${position}
    ${locator}=    Replace String    ${PRODUCT_NAME_XPATH}    {index}    ${position}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    ${name}=    Get Text    ${locator}
    RETURN    ${name}

Get Item Price At Position
    [Arguments]    ${position}
    ${locator}=    Replace String    ${PRODUCT_PRICE_XPATH}    {index}    ${position}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    ${text}=     Get Text    ${locator}
    ${price}=    Parse Price    ${text}
    RETURN    ${price}

Add Item To Cart At Position
    [Arguments]    ${position}
    ${locator}=    Replace String    ${PRODUCT_ADD_XPATH}    {index}    ${position}
    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}
    Click Element    ${locator}
    # Button turns into Remove once the item is added.
    Wait Until Element Contains    ${locator}    Remove    timeout=${TIMEOUT}

Go To Cart
    # Badge shows up once items are added.
    Wait Until Element Is Visible    ${CART_BADGE}    ${TIMEOUT}
    Click Element    ${CART_LINK}
    Wait Until Location Contains    cart.html    timeout=${TIMEOUT}
