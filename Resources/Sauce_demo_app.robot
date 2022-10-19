*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/Common.robot
Resource  PO/LoginPage.robot
Resource  ../Resources/PO/ProductsListPage.robot

*** Variables ***

*** Keywords ***

Clicked on loggout button from menu-wrap
    ProductsListPage.Products list page should be open with logout button
    click button    ${BURGER_MENU_BUTTON}
    sleep    2s
    click link    ${logout_button_in_sedebar}

Log in using properly account
     Fill in login input       standard_user
     Fill in password input
     Click login button
     Wait for products list page

Addeed first product from products list
    Wait for products list page
    Choose field in dropdown    az
    Click on Add To Cart/Remove button

The value in shopping cart badget should be 1
    ${value}    ProductsListPage.Get amount from shopping cart badget
    should be equal as strings  ${value}    1

Value is not visible
    wait until element is not visible

The first product should have title
    [Arguments]    ${product_title}
    ${title}    ProductsListPage.Get first product tittle from products list
    should be equal as strings    ${title}    ${product_title}

The first product should have price
    [Arguments]   ${product_price}
    ${price}    ProductsListPage.Get first product price from products list
    should be equal as strings    ${price}      ${product_price}





