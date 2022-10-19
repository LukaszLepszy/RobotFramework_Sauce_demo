*** Settings ***
Documentation  Sauce_demo login page
Library  SeleniumLibrary

*** Variables ***
${CART_QUANTITY}                    css:div[class='cart_quantity']
${INVENTORY_ITEM_NAME}              css:div[class='inventory_item_name']
${INVENTORY_ITEM_PRICE}             css:div[class='inventory_item_price']
${SHOPING_CART_ICON}                css:a[class='shopping_cart_link']
${CART_LIST}                        css:div[class='cart_list']
${CART_ITEM}                        css:div[class='cart_item']
${REMOVED_BUTTON}                   css:button[class='btn btn_secondary btn_small cart_button']
${REMOVED_ITEM}                     css:div[class='removed_cart_item']
${ERROR_MESSAGE}                    css:h3[data-test='error']
${FIRST_NAME_INPUT}                 css:input[id='first-name']
${LAST_NAME_INPUT}                  css:input[id='last-name']
${ZIP_CODE_INPUT}                   css:input[id='postal-code']
${CONTINUE_BUTTON}                  css:input[id='continue']
${CHECKOUT_BUTTON_IN_CART_SECTION}  css:button[id='checkout']
${CHECKOUT_OVIERVIEW}               css:span[class='title']

*** Keywords ***
The quantity in your cart should be equal 1
    wait until element is visible   ${CART_LIST}
    ${quantity}     get text    ${CART_QUANTITY}
    should be equal as strings     ${quantity}     1

The name should be
    [Arguments]    ${product_name}
    wait until element is visible   ${CART_LIST}
    ${name}     get text    ${INVENTORY_ITEM_NAME}
    should be equal as strings   ${name}     ${product_name}

The price should be
    [Arguments]    ${product_price}
    wait until element is visible   ${CART_LIST}
    ${price}     get text    ${INVENTORY_ITEM_PRICE}
    should be equal as strings   ${price}     ${product_price}

Click in Remove button
    wait until element is visible   ${CART_LIST}
    click button    ${REMOVED_BUTTON}

Go to shopping cart section
    wait until element is enabled   ${SHOPING_CART_ICON}
    click link    ${SHOPING_CART_ICON}

Element dissapear from shopping cart
    wait until element is not visible   ${CART_ITEM}
    element should be enabled    ${REMOVED_ITEM}

Fill first name input
    [Arguments]    ${first_name}
    wait until element is enabled       ${FIRST_NAME_INPUT}
    input text    ${FIRST_NAME_INPUT}       ${first_name}

Fill last name input
    [Arguments]    ${last_name}
    wait until element is enabled       ${LAST_NAME_INPUT}
    input text    ${LAST_NAME_INPUT}       ${last_name}

Fill zip code input
    [Arguments]    ${zip_code}
    wait until element is enabled       ${ZIP_CODE_INPUT}
    input text    ${ZIP_CODE_INPUT}       ${zip_code}

Go to checkout
    wait until element is enabled   ${CONTINUE_BUTTON}
    click element    ${CONTINUE_BUTTON}

The section is Checkout: Overview
    wait until element is visible   ${CHECKOUT_OVIERVIEW}
    ${text}     get text        ${CHECKOUT_OVIERVIEW}
    should be equal as strings    ${text}   CHECKOUT: OVERVIEW

Error message shoul be
    [Arguments]    ${text_message}
    wait until element is visible   ${ERROR_MESSAGE}
    ${text}     get text    ${ERROR_MESSAGE}
    should be equal as strings    ${text}   ${text_message}

Go to customer information section
    wait until element is enabled    ${CHECKOUT_BUTTON_IN_CART_SECTION}
    click button        ${CHECKOUT_BUTTON_IN_CART_SECTION}