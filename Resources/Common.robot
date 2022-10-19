*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Begin Web Test
    Open Browser    ${URL}     ${BROWSER}
    Maximize Browser Window

End Web Test
    close all browsers

Insert testing data
    Log    I am setting up the test data

Cleanup testing data
    Log    I am cleaning up the test data