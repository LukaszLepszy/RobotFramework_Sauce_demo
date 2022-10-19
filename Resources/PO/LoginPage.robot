*** Settings ***
Documentation  Sauce_demo login page
Library  SeleniumLibrary
Library  OperatingSystem

*** Variables ***

${PRODUCTS_LIST_PAGE_HEADER}                css:div[class='header_secondary_container']
${LOGINPAGE_ERROR_NORYFICATION}             css:div[class ='error-message-container error']
${LOGINPAGE_ERROR_NORYFICATION_MESSAGE}     css:h3[data-test='error']
${LOGIN_INPUT}                              css:input[id='user-name']
${PASSWORD_INPUT}                           css:input[id='password']
${LOGIN_BUTTON}                             css:input[id='login-button']
${EMPTY_VALUE}

*** Keywords ***

Fill in login input
    [Arguments]    ${login}
    input text    ${LOGIN_INPUT}     ${login}

Fill in password input
    ${json}=    Get file    Credencials.json
    ${object}=  Evaluate    json.loads('''${json}''')   json
    input password    ${PASSWORD_INPUT}     ${object["password"]}

Fill bad password input
    [Arguments]    ${password}
    input text    ${PASSWORD_INPUT}      ${password}

Click login button
    Click Button  ${LOGIN_BUTTON}

Wait for products list page
    wait until element is visible    ${PRODUCTS_LIST_PAGE_HEADER}

Wait for notyfication
    wait until element is visible    ${LOGINPAGE_ERROR_NORYFICATION}

Text message from empty login input
    element text should be    ${LOGINPAGE_ERROR_NORYFICATION_MESSAGE}    Epic sadface: Username is required

Text message from empty password input
    element text should be    ${LOGINPAGE_ERROR_NORYFICATION_MESSAGE}    Epic sadface: Password is required

Login Page Opened
  Wait Until Element Is Visible     ${LOGIN_INPUT}
  element should be enabled         ${LOGIN_INPUT}
  Wait Until Element Is Visible     ${PASSWORD_INPUT}
  element should be enabled         ${PASSWORD_INPUT}

User is not log
    ${value_from_login_input}    get value    ${LOGIN_INPUT}
    should be equal    ${value_from_login_input}     ${EMPTY_VALUE}
    ${value_from_password_input}    get value    ${PASSWORD_INPUT}
    should be equal    ${value_from_password_input}     ${EMPTY_VALUE}

User is not logging and the notification will appear
    [Arguments]       ${message}
    wait until element is visible    ${LOGINPAGE_ERROR_NORYFICATION}
    element text should be    ${LOGINPAGE_ERROR_NORYFICATION_MESSAGE}      ${message}