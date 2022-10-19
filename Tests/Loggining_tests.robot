*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/PO/LoginPage.robot
Resource  ../Resources/PO/ProductsListPage.robot
Resource    ../Resources/Common.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${BROWSER}                  chrome
${URL}                      https://www.saucedemo.com/
${Properly_Login}           standard_user
${Performance_low_Login}    performance_glitch_user
${Locked_Login}             locked_out_user
${Problem_Login}            problem_user
${Password}                 secret_sauce
${LOCKED_USER_MESSAGE_NOTYFICATION}         Epic sadface: Sorry, this user has been locked out.
${PASSWORD_REQUIRED_MESSAGE_NOTYFICATION}   Epic sadface: Password is required
${LOGIN_REQUIRED_MESSAGE_NOTYFICATION}      Epic sadface: Username is required
${BAD_CREDENCIALS_MESSAGE_NOTYFICATION}     Epic sadface: Username and password do not match any user in this service

*** Test Cases ***
Login to web
    [Tags]    Logg
    Given Login Page Opened
    And User is not log
    When Fill in login input     ${Properly_Login}
    And Fill in password input
    And Click login button
    Then Products list page should be open with logout button

Valid Login With Properly Account
    [Tags]    Loggining
    Given Login Page Opened
    And User is not log
    When Fill in login input     ${Properly_Login}
    And Fill in password input
    And Click login button
    Then Products list page should be open with logout button

Valid Login With Low Performance Account
    [Tags]    Loggining
    Given Login Page Opened
    And User is not log
    When Fill in login input     ${Performance_low_Login}
    And Fill in password input
    And Click login button
    Then Products list page should be open with logout button

Invalid Login With Locked Account
    [Tags]    Loggining
    Given Login Page Opened
    And User is not log
    When Fill in login input     ${Locked_Login}
    And Fill in password input
    And Click login button
    Then User is not logging and the notification will appear     ${LOCKED_USER_MESSAGE_NOTYFICATION}

Invalid Login Using Only Password
    [Tags]    Loggining
    Given Login Page Opened
    And User is not log
    And Fill in password input
    And Click login button
    Then User is not logging and the notification will appear     ${LOGIN_REQUIRED_MESSAGE_NOTYFICATION}

Invalid Login Using Only Login
    [Tags]    Loggining
    Given Login Page Opened
    And User is not log
    And Fill in login input    input
    And Click login button
    Then User is not logging and the notification will appear     ${PASSWORD_REQUIRED_MESSAGE_NOTYFICATION}

Invalid Login Without Credencials
    [Tags]    Loggining
    Given Login Page Opened
    And User is not log
    And Click login button
    Then User is not logging and the notification will appear     ${LOGIN_REQUIRED_MESSAGE_NOTYFICATION}

Invalid Login Using Invalid Credencials
    [Tags]    Loggining
    Given Login Page Opened
    And User is not log
    When Fill in login input     Bad Login
    And Fill bad password input  Bad Password
    And Click login button
    Then User is not logging and the notification will appear     ${BAD_CREDENCIALS_MESSAGE_NOTYFICATION}
