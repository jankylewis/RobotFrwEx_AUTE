*** Settings ***
Library         DataDriver         ../Data/login_data.xlsx                   sheet_name=invalid_data
Resource                           ../Resources/login.resource

*** Variables ***

*** Test Cases ***
Login Successfully With Valid Username And Password
    [Tags]          valid_login
    [Teardown]      Close Browser After
    Login With Valid Username And Password    ${username}    ${password}

Login Unsuccessfully With Invalid Username And Password
    [Tags]          invalid_login
    [Template]      Login With Invalid Username And Password
    [Teardown]      Close Browser After

*** Keywords ***
Login With Valid Username And Password
    [Arguments]     ${username}     ${password}
    Open Maximize Browser
    Open Login Page
    Wait Until Element Is Visible           id:username
    Input Username                          ${username}
    Input Password                          ${password}
    Click Login Button
    Assertion After Login

Login With Invalid Username And Password
    [Arguments]    ${wUsername}    ${wPassword}
    Open Maximize Browser
    Open Login Page
    Wait Until Element Is Visible           id:username
    Input Username    ${wUsername}
    Input Password    ${wPassword}
    Click Login Button

    Run Keyword If    "${wPassword}" == "${EMPTY}"          Assertion When Missing Field
    Run Keyword If    "${wUsername}" == "${EMPTY}"          Assertion When Missing Field
    Run Keyword If    "${wUsername}" and "${wPassword}"     Assertion With Invalid Data
