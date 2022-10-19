*** Settings ***
Library  SeleniumLibrary
Library    Dialogs
Resource    ../Resources/Sauce_demo_app.robot
Resource    ../Resources/Common.robot
Resource    ../Resources/PO/CheckoutPage.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${BROWSER}                  chrome
${URL}                      https://www.saucedemo.com/


*** Test Cases ***

    # SHOPPING CART
Added product should have quntity 1 in shopping cart
    [Tags]    Shopping_cart
    Given Log in using properly account
    When Addeed first product from products list
    And Go to shopping cart section
    Then The quantity in your cart should be equal 1

Added product should be in shopping cart
    [Tags]    Shopping_cart
    Given Log in using properly account
    When Addeed first product from products list
    And Go to shopping cart section
    Then The name should be     Sauce Labs Backpack
    And The price should be     $29.99

Remove product from shopping cart
    [Tags]    Shopping_cart
    Given Log in using properly account
    And Addeed first product from products list
    And Go to shopping cart section
    When Click in Remove button
    Then Element dissapear from shopping cart

    #CHECKOUT CUSTOMER INFORMATION

Invalid customer information without first name
    [Tags]    Checkout
    Given Log in using properly account
    And Addeed first product from products list
    And Go to shopping cart section
    And Go to customer information section
    When Fill last name input    My last name
    And Fill zip code input    1111
    And Go to checkout
    Then Error message shoul be    Error: First Name is required

Invalid customer information without last name
    [Tags]    Checkout
    Given Log in using properly account
    And Addeed first product from products list
    And Go to shopping cart section
    And Go to customer information section
    When Fill first name input    My first name
    And Fill zip code input    1111
    And Go to checkout
    Then Error message shoul be    Error: Last Name is required

Invalid customer information without zip code
    [Tags]    Checkout
    Given Log in using properly account
    And Addeed first product from products list
    And Go to shopping cart section
    And Go to customer information section
    When Fill first name input    My first name
    And Fill last name input    Last name
    And Go to checkout
    Then Error message shoul be    Error: Postal Code is required

Valid customer information
    [Tags]    Checkout
    Given Log in using properly account
    And Addeed first product from products list
    And Go to shopping cart section
    And Go to customer information section
    When Fill first name input    My first name
    And Fill last name input    Last name
    And Fill zip code input    1111
    And Go to checkout
    Then The section is Checkout: Overview

    #CHECKOUT OVERVIEW

Added product should have quntity 1 in checkout overiview
    [Tags]    Checkout-overview
    Given Log in using properly account
    And Addeed first product from products list
    And Go to shopping cart section
    And Go to customer information section
    When Fill first name input    My first name
    And Fill last name input    Last name
    And Fill zip code input    1111
    And Go to checkout
    And The quantity in your cart should be equal 1

Added product should be in checkout overiview
    [Tags]    Checkout-overview
    Given Log in using properly account
    And Addeed first product from products list
    And Go to shopping cart section
    And Go to customer information section
    When Fill first name input    My first name
    And Fill last name input    Last name
    And Fill zip code input    1111
    And Go to checkout
    Then The name should be    Sauce Labs Backpack
    And The price should be    $29.99
