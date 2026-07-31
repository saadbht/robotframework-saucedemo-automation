*** Settings ***
Documentation    End to end purchase flow for saucedemo.com.
Library          String
Library          ../libraries/price_utils.py
Resource         ../resources/common.robot
Resource         ../resources/config.robot
Resource         ../resources/pages/login_page.robot
Resource         ../resources/pages/products_page.robot
Resource         ../resources/pages/cart_page.robot
Resource         ../resources/pages/checkout_info_page.robot
Resource         ../resources/pages/checkout_overview_page.robot
Resource         ../resources/pages/checkout_complete_page.robot

Suite Setup      Open Application
Suite Teardown   Close Application

*** Variables ***
${SECOND_CHEAPEST}    2
${THIRD_CHEAPEST}     3
${BLOCK_ITEM_1}       3
${BLOCK_ITEM_2}       4

*** Test Cases ***
Complete Purchase Flow
    Login With Credentials    ${USERNAME}    ${PASSWORD}

    Sort Products By Price Low To High

    # Capture names and prices dynamically to check the cart and total amount later.
    ${name_2}=     Get Item Name At Position     ${SECOND_CHEAPEST}
    ${price_2}=    Get Item Price At Position    ${SECOND_CHEAPEST}
    ${name_3}=     Get Item Name At Position     ${THIRD_CHEAPEST}
    ${price_3}=    Get Item Price At Position    ${THIRD_CHEAPEST}
    Log    Selected: '${name_2}' (${price_2}), '${name_3}' (${price_3})

    Add Item To Cart At Position    ${SECOND_CHEAPEST}
    Add Item To Cart At Position    ${THIRD_CHEAPEST}

    Go To Cart
    Cart Should Contain Items    ${name_2}    ${name_3}

    Proceed To Checkout
    Fill Checkout Information    ${FIRST_NAME}    ${LAST_NAME}    ${ZIP_CODE}

    ${overview_price_1}=    Get Overview Item Price    ${BLOCK_ITEM_1}
    ${overview_price_2}=    Get Overview Item Price    ${BLOCK_ITEM_2}
    ${calculated_total}=    Sum Prices    ${overview_price_1}    ${overview_price_2}
    ${displayed_total}=     Get Displayed Item Total
    Should Be Equal As Numbers    ${calculated_total}    ${displayed_total}
    ...    msg=Item total does not match the sum of the item prices.

    Finish Purchase
    Verify Order Success
