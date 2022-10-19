*** Settings ***
Library     RequestsLibrary
Library     SeleniumLibrary
Library     Collections

*** Variables ***
#/api/users?page=2
#200

*** Keywords ***
Get methods status
    [Arguments]     ${endpoint}     ${status_code}
    Create Session    my_regresin_session   https://reqres.in/
    ${response} =    get request    my_regresin_session     ${endpoint}
    should be equal as strings      ${response.status_code}    ${status_code}

Get body
    [Arguments]     ${endpoint}
    Create Session    my_regresin_session   https://reqres.in/
    ${response} =    get request    my_regresin_session     ${endpoint}
    &{json} =   set to dictionary    ${response.json()}
    &{properly_dict}   create dictionary        page=2        per_page=6    total=12      total_pages=2
    ${values}   set variable    2
    FOR     ${item}     IN      @{properly_dict.values()}
        Log     ${item}
        dictionary should contain value    ${properly_dict}    ${values}
    END
