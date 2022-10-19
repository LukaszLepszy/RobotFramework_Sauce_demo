*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Resource   ../Resources/API/Regres_in.robot

*** Variables ***
@{LISTS_ENDPOINTS}      /api/users?page=2   xx
&{GET_USER_ENDPOINTS}       LIST_USERS=/api/users?page=2    SINGLE_USER=/api/users/2    SINGLE_USER_NOT_FOUND=api/users/23
&{GET_RESOURCES_ENDPOINTS}  LIST_RESOURCE=/api/unknown  SINGLE_RESOURCE=/api/unknown/2  SINGLE_RESOURCE_NOT_FOUND=/api/unknown/23

*** Test Cases ***
Status Code for Get List Useres Should Be 200
    [Tags]      API_GET
    Regres_in.Get methods status    ${GET_USER_ENDPOINTS}[LIST_USERS]      200

Status Code for Get Single User Should Be 200
    [Tags]      API_GET
    Regres_in.Get methods status    ${GET_USER_ENDPOINTS}[SINGLE_USER]      200

Status Code for Get Not Faunded User Should Be 404
    [Tags]      API_GET
    Regres_in.Get methods status    ${GET_USER_ENDPOINTS}[SINGLE_USER_NOT_FOUND]      404

Status Code for Get List Resource Useres Should Be 200
    [Tags]      API_GET
    Regres_in.Get methods status    ${GET_RESOURCES_ENDPOINTS}[LIST_RESOURCE]      200

Status Code for Get Single Resource Should Be 200
    [Tags]      API_GET
    Regres_in.Get methods status    ${GET_RESOURCES_ENDPOINTS}[SINGLE_RESOURCE]      200

Status Code for Get Not Faunded Resource Should Be 404
    [Tags]      API_GET
    Regres_in.Get methods status    ${GET_RESOURCES_ENDPOINTS}[SINGLE_RESOURCE_NOT_FOUND]      404


