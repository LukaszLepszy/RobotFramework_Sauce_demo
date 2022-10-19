*** Settings ***
Resource    ../Resources/PO/ProductsListPage.robot
Library     SeleniumLibrary
Resource    ../Resources/Common.robot
Resource    ../Resources/Sauce_demo_app.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${BROWSER}          chrome
${URL}              https://www.saucedemo.com/
@{FILTERS_LIST}     az      za      lohi    hilo

*** Test Cases ***
Added product and check the shopping cart badget
    [Tags]  Shopping_cart_badget
    Given Log in using properly account
    When Addeed first product from products list
    Then The value in shopping cart badget should be 1

Removed product and checck the shopping cart badget
    [Tags]  Shopping_cart_badget
    Given Log in using properly account
    And Addeed first product from products list
    And The value in shopping cart badget should be 1
    When Click on Add To Cart/Remove button
    Then ProductsListPage.Value is not visible

Filter 'az' should appear as first product 'Sauce Labs Backpack'
    [Tags]    Filters
    Given Log in using properly account
    When Choose field in dropdown    ${FILTERS_LIST}[0]
    Then The first product should have title   Sauce Labs Backpack
    And The first product should have price   $29.99

Filter 'za' should appear as first product 'T-Shirt (Red)'
    [Tags]    Filters
    Given Log in using properly account
    When Choose field in dropdown    ${FILTERS_LIST}[1]
    Then The first product should have title   Test.allTheThings() T-Shirt (Red)
    And The first product should have price   $15.99

Filter 'lohi' should appear as first product 'Sauce Labs Onesie'
    [Tags]    Filters
    Given Log in using properly account
    When Choose field in dropdown    ${FILTERS_LIST}[2]
    Then The first product should have title   Sauce Labs Onesie
    And The first product should have price   $7.99

Filter 'hilo' should appear as first product 'Sauce Labs Onesie'
    [Tags]    Filters
    Given Log in using properly account
    When Choose field in dropdown    ${FILTERS_LIST}[3]
    Then The first product should have title  Sauce Labs Fleece Jacket
    And The first product should have price   $49.99

Check logout form app
    [Tags]    Logout
    Given Log in using properly account
    When Clicked on loggout button from menu-wrap
    Then Login Page Opened