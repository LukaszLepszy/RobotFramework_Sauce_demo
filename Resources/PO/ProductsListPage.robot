*** Settings ***
Documentation  Sauce_demo login page
Library  SeleniumLibrary


*** Variables ***
${BURGER_MENU_BUTTON}           css:button[id='react-burger-menu-btn']
${SIDEBAR}                      css:button[id='react-burger-cross-btn']
${logout_button_in_sedebar}     css:#logout_sidebar_link
${products_list_page_header}    css:div[class='header_secondary_container']
${dropdown_filter_selector}     css:select[class='product_sort_container']
${first_product_title}          css:#inventory_container > div > div:nth-child(1) > div.inventory_item_description > div.inventory_item_label > a > div.inventory_item_name
${first_product_price}          xpath://*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div
${first_product_add_to_cart}    xpath://*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/button
${shoping_cart}                 css:a[class='shopping_cart_link']
${shoping_cart_ammount}         css:span[class='shopping_cart_badge']

*** Keywords ***
Products list page should be open with logout button
    wait until element is visible    ${products_list_page_header}
    element should be enabled   ${logout_button_in_sedebar}

Click on button
    click button    ${logout_button_in_sedebar}

Choose field in dropdown
    [Arguments]   ${filter}
    wait until element is enabled   ${dropdown_filter_selector}
    select from list by value    ${dropdown_filter_selector}    ${filter}

Get first product tittle from products list
      ${title}  get text    ${first_product_title}
      RETURN    ${title}

Get first product price from products list
    ${price}    get text    ${first_product_price}
    RETURN   ${price}

Click on Add To Cart/Remove button
    wait until element is enabled    ${first_product_add_to_cart}
    click button    ${first_product_add_to_cart}

Get amount from shopping cart badget
    wait until element is visible   ${shoping_cart_ammount}
    ${value}    get text    ${shoping_cart_ammount}
    RETURN    ${value}

Value is not visible
    wait until element is not visible  ${shoping_cart_ammount}


