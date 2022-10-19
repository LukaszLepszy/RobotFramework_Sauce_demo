*** Settings ***
Documentation    These are some file and directory tests
Resource    ../Resources/OperatingSystem/OS.robot

*** Variables ***


*** Test Cases ***
Create Some Directories
    [Tags]    OperatingSystem
    OS.Create the Base Directory
    OS.Create Directory 1
    OS.Create Directory 2

Create Some Files
    [Tags]    OperatingSystem
    OS.Create the First File
    OS.Create the Second File

Move file
    [Tags]    OperatingSystem
    OS.Create the First File
    OS.Create the Second File
    OS.Move File 1 from Durectory 1 to Directory 2