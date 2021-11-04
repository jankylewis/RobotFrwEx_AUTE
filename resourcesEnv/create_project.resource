*** Settings ***
Library     SeleniumLibrary
Resource    login.resource

*** Variables ***
# Store selectors before creating project
${DDI_CREATE_PROJECT}               xpath://a[contains(text(),"Create Project")]
${DDL_PROJECTS}                     xpath://a[contains(text(),"Projects")]
${DDL_PROJECT_TYPE}                 id:projecttype
${DDL_PROJECT_STATUS}               id:status
${DDL_LOCATION}                     id:location
${DDL_CLIENT_INDUSTRY}              id:clientindustry
${DDL_PM}                           id:projectManager
${DDL_DM}                           id:deliveryManager
${DDL_EM}                           id:engagementManager
${DTP_START_DATE}                   xpath://div//input[@name="sdate" and @type="text"]
${DTP_END_DATE}                     xpath://div//input[@name="edate" and @type="text"]
${TXT_PROJECT_NAME}                 id:name
${TXT_SIZE_DAY}                     id:sizeday
${TXT_CLIENT_NAME}                  id:clientName
${TXA_SHORT_DEPICT}                 id:shortDescription
${TXA_LONG_DEPICT}                  id:longDescription
${TXA_TECHNOLOGIES}                 id:technologies
${TXA_CLIENT_DEPICT}                id:clientdescription
${BTN_DATE_UPWARD}                  css:button[ng-click="move(-1)"][type="button"]
${BTN_DATE_BACKWARD}                css:div button[ng-click="move(1)"][type="button"]
${BTN_CREATE_PROJECT}               id:btnConfirm
${BTN_YEAR}                         xpath://button[@role="heading" and @type="button"]
${BTN_FIRST_YEAR_DTP}               xpath://div[@datepicker-options="datepickerOptions"]//table[1]/tbody[1]/tr[1]/td[1]/button[1]/span[1]
${BTN_LAST_YEAR_DTP}                xpath://div[@datepicker-options="datepickerOptions"]//table[1]/tbody[1]/tr[4]/td[5]/button[1]/span[1]

# Store locators after creating project successfully
${LBL_PROJECT_NAME}                 xpath://div[@ui-view="projectinfotab" and @class]//label[@for="name"]/following-sibling::p
${LBL_PROJECT_TYPE}                 xpath://div[@ui-view="projectinfotab" and @class]//label[@for="type"]/following-sibling::p
${LBL_PROJECT_STATUS}               xpath://div[@ui-view="projectinfotab" and @class]//label[@for="status"]/following-sibling::p
${LBL_START_DATE}                   xpath://div[@ui-view="projectinfotab" and @class]//label[@for="startDate"]/following-sibling::p
${LBL_END_DATE}                     xpath://div[@ui-view="projectinfotab" and @class]//label[@for="endDate"]/following-sibling::p
${LBL_SIZE_DAY}                     xpath://div[@ui-view="projectinfotab" and @class]//label[@for="sizeday"]/following-sibling::p
${LBL_LOCATION}                     xpath://div[@ui-view="projectinfotab" and @class]//label[@for="location"]/following-sibling::p
${LBL_PROJECT_MANAGER}              xpath://div[@ui-view="projectinfotab" and @class]//label[@for="projectManager"]/following-sibling::p
${LBL_DELIVERY_MANAGER}             xpath://div[@ui-view="projectinfotab" and @class]//label[@for="deliveryManager"]/following-sibling::p
${LBL_ENGAGEMENT_MANAGER}           xpath://div[@ui-view="projectinfotab" and @class]//label[@for="engagementManager"]/following-sibling::p
${LBL_SHORT_DEPICT}                 xpath://div[@ui-view="projectinfotab" and @class]//label[@for="shortDescription"]/following-sibling::p
${LBL_LONG_DEPICT}                  xpath://div[@ui-view="projectinfotab" and @class]//label[@for="longDescription"]/following-sibling::p
${LBL_TECHNOLOGIES}                 xpath://div[@ui-view="projectinfotab" and @class]//label[@for="technologies"]/following-sibling::p
${LBL_CLIENT_NAME}                  xpath://div[@ui-view="projectinfotab" and @class]//label[@for="clientName"]/following-sibling::p
${LBL_CLIENT_INDUSTRY}              xpath://div[@ui-view="projectinfotab" and @class]//label[@for="clientindustry"]/following-sibling::p
${LBL_CLIENT_DESCRIPTION}           xpath://div[@ui-view="projectinfotab" and @class]//label[@for="clientdescription"]/following-sibling::p

*** Keywords ***
Delete Project After Create
    Click Button        css:button#btnDelete[type="submit"]
    Click Button        css:#modalDeleteProject #btnConfirm

Logout Of The System
    Click Element       css:img#ava
    Click Element       xpath://div[@ui-view="navbar"]//a[contains(text(),"Logout")]

Click On Create Project
    Wait Until Element Is Visible           ${DDL_PROJECTS}
    Click Element       ${DDL_PROJECTS}
    Wait Until Element Is Visible           ${DDI_CREATE_PROJECT}
    Click Element       ${DDI_CREATE_PROJECT}

Input Project Name
    [Arguments]         ${projectName}
    Wait Until Element Is Visible                   ${TXT_PROJECT_NAME}
    Input Text          ${TXT_PROJECT_NAME}         ${projectName}

Select Project Type
    [Arguments]         ${projectType}
    Select From List By Label                       ${DDL_PROJECT_TYPE}         ${projectType}

Select Project Status
    [Arguments]         ${projectStatus}
    Select From List By Label                       ${DDL_PROJECT_STATUS}       ${projectStatus}

Input Size Day
    [Arguments]         ${sizeDay}
    Input Text          ${TXT_SIZE_DAY}             ${sizeDay}

Select Project Location
    [Arguments]         ${location}
    Select From List By Label                       ${DDL_LOCATION}             ${location}

Select PM
    [Arguments]         ${PM}
    Select From List By Label                       ${DDL_PM}                   ${PM}

Select DM
    [Arguments]         ${DM}
    Select From List By Label                       ${DDL_DM}                   ${DM}

Select EM
    [Arguments]         ${EM}
    Select From List By Label                       ${DDL_EM}                   ${EM}

Input Short Depict
    [Arguments]         ${shortDepict}
    Input Text          ${TXA_SHORT_DEPICT}         ${shortDepict}

Input Long Depict
    [Arguments]         ${longDepict}
    Input Text          ${TXA_LONG_DEPICT}          ${longDepict}

Input Technologies
    [Arguments]         ${technologies}
    Input Text          ${TXA_TECHNOLOGIES}         ${technologies}

Input Client Name
    [Arguments]         ${clientName}
    Input Text          ${TXT_CLIENT_NAME}          ${clientName}

Select Client Industry
    [Arguments]         ${clientIndustry}
    Select From List By Label                       ${DDL_CLIENT_INDUSTRY}      ${clientIndustry}

Input Client Depict
    [Arguments]         ${clientDepict}
    Input Text          ${TXA_CLIENT_DEPICT}        ${clientDepict}

Click On Create Project Button
    Click Button        ${BTN_CREATE_PROJECT}

Click On Backward Button
    Click Button        ${BTN_DATE_BACKWARD}

Click On Upward Button
    Click Button        ${BTN_DATE_UPWARD}

Select Start Date
    [Arguments]             ${year}                     ${month}                    ${day}
    Click Element           ${DTP_START_DATE}
    Click Element           ${BTN_YEAR}
    Click Element           ${BTN_YEAR}
    FOR    ${index}         IN RANGE                    99999
        ${minYear}          Get Text                    ${BTN_FIRST_YEAR_DTP}
        ${maxYear}          Get Text                    ${BTN_LAST_YEAR_DTP}

        Run Keyword If      ${year} < ${minYear}              Click On Upward Button
        Run Keyword If      ${year} > ${maxYear}              Click On Backward Button
        Exit For Loop If    ${year} >= ${minYear} and ${year} <= ${maxYear}
    END
    Click Element           xpath://td[@role="gridcell"]//span[normalize-space()="${year}"]
    Click Element           xpath://td[@role="gridcell"]//span[normalize-space()="${month}"]
    Click Element           xpath://td[@role="gridcell"]//span[text()="${day}"]

Select End Date
    [Arguments]             ${year}                     ${month}                    ${day}
    Click Element           ${DTP_END_DATE}
    Click Element           ${BTN_YEAR}
    Click Element           ${BTN_YEAR}
    FOR    ${index}         IN RANGE                    99999
        ${minYear}          Get Text                    ${BTN_FIRST_YEAR_DTP}
        ${maxYear}          Get Text                    ${BTN_LAST_YEAR_DTP}

        Run Keyword If      ${year} < ${minYear}              Click On Upward Button
        Run Keyword If      ${year} > ${maxYear}              Click On Backward Button
        Exit For Loop If    ${year} >= ${minYear} and ${year} <= ${maxYear}
    END
    Click Element           xpath://td[@role="gridcell"]//span[normalize-space()="${year}"]
    Click Element           xpath://td[@role="gridcell"]//span[normalize-space()="${month}"]
    Click Element           xpath://td[@role="gridcell"]//span[text()="${day}"]

Assertion After Creating Project Successfully
    [Arguments]     ${projectName}    ${projectType}    ${projectStatus}     ${startYear}       ${startMonth}     ${startDay}      ${endYear}    ${endMonth}     ${endDay}      ${sizeDay}    ${location}     ${PM}     ${DM}     ${EM}     ${shortDepict}     ${longDepict}     ${technologies}     ${clientName}     ${clientIndustry}     ${clientDepict}
    ${afStartDate}      Catenate      SEPARATOR=-       ${startDay}          ${startMonth}      ${startYear}
    ${afEndDate}        Catenate      SEPARATOR=-       ${endDay}            ${endMonth}        ${endYear}
    Wait Until Element Is Visible     ${LBL_PROJECT_NAME}
    Element Should Contain            ${LBL_PROJECT_NAME}                    ${projectName}
    Element Should Contain            ${LBL_PROJECT_TYPE}                    ${projectType}
    Element Should Contain            ${LBL_PROJECT_STATUS}                  ${projectStatus}
    Element Should Be Visible         ${LBL_START_DATE}                      ${afStartDate}
    Element Should Be Visible         ${LBL_END_DATE}                        ${afEndDate}
    Element Should Contain            ${LBL_SIZE_DAY}                        ${sizeDay}
    Element Should Contain            ${LBL_LOCATION}                        ${location}
    Element Should Be Visible         ${LBL_PROJECT_MANAGER}                 ${PM}
    Element Should Be Visible         ${LBL_DELIVERY_MANAGER}                ${DM}
    Element Should Be Visible         ${LBL_ENGAGEMENT_MANAGER}              ${EM}
    Element Should Contain            ${LBL_SHORT_DEPICT}                    ${shortDepict}
    Element Should Contain            ${LBL_LONG_DEPICT}                     ${longDepict}
    Element Should Contain            ${LBL_TECHNOLOGIES}                    ${technologies}
    Element Should Contain            ${LBL_CLIENT_NAME}                     ${clientName}
    Element Should Contain            ${LBL_CLIENT_INDUSTRY}                 ${clientIndustry}
    Element Should Contain            ${LBL_CLIENT_DESCRIPTION}              ${clientDepict}