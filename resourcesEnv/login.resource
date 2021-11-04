*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${login_URL}            http://192.168.237.10:3000/#!/login
${browser}              Chrome
${username}             Admin2
${password}             qp$#tGu^
${invalidErrMes}        The Username or Password you entered is incorrect
${missedFieldErrMes}    This is a required field.

*** Keywords ***
Open Maximize Browser
    Open Browser                            ${login_URL}                    browser=${browser}
    Maximize Browser Window

Close Browser After
    Close All Browsers

Open Login Page
    Go To                                   ${login_URL}

Input Username
    [Arguments]                             ${username}
    Input Text                              id:username                     ${username}

Input Password
    [Arguments]                             ${password}
    Input Text                              id:password                     ${password}

Click Login Button
    Wait Until Element Is Visible           css:[value="Login"]
    Click Button                            css:[value="Login"]

Assertion After Login
    Wait Until Element Is Visible           xpath://div[@id="navbar"]/div/ul[2]/li/a
    Element Text Should Be                  xpath://div[@id="navbar"]/div/ul[2]/li/a             ${username}

Assertion With Invalid Data
    Wait Until Element Is Visible           css:[ng-show="isError"]
    Element Text Should Be                  css:[ng-show="isError"]         ${invalidErrMes}

Assertion When Missing Field
    Wait Until Element Is Visible           xpath://div[@class="form-group"]//p[contains(text(),"This is a required field.")]
    Element Text Should Be                  xpath://div[@class="form-group"]//p[contains(text(),"This is a required field.")]        ${missedFieldErrMes}