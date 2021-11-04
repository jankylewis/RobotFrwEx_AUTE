*** Settings ***
Resource            ../Resources/login.resource
Resource            ../Resources/create_project.resource
#Library             DataDriver                      ../Data/project_data.xlsx           sheet_name=create_project_data

#Test Teardown       Logout Of The System
Test Template       Create Project
Suite Teardown      Close Browser After

*** Test Cases ***
Create Project Successfully With All Fields

*** Keywords ***
Login To System
    Open Maximize Browser
    Wait Until Element Is Visible           id:username
    Input Username                          ${username}
    Input Password                          ${password}
    Click Login Button

Create Project
    [Arguments]       ${projectName}    ${projectType}    ${projectStatus}     ${startYear}       ${startMonth}     ${startDay}      ${endYear}    ${endMonth}     ${endDay}      ${sizeDay}    ${location}     ${PM}     ${DM}     ${EM}     ${shortDepict}     ${longDepict}     ${technologies}     ${clientName}     ${clientIndustry}     ${clientDepict}
    Login To System
    Click On Create Project
    Input Project Name                                  ${projectName}
    Select Project Type                                 ${projectType}
    Select Project Status                               ${projectStatus}
    Select Start Date                                   ${startYear}    ${startMonth}    ${startDay}
    Select End Date                                     ${endYear}      ${endMonth}      ${endDay}
    Input Size Day                                      ${sizeDay}
    Select Project Location                             ${location}
    Select PM                                           ${PM}
    Select DM                                           ${DM}
    Select EM                                           ${EM}
    Input Short Depict                                  ${shortDepict}
    Input Long Depict                                   ${longDepict}
    Input Technologies                                  ${technologies}
    Input Client Name                                   ${clientName}
    Select Client Industry                              ${clientIndustry}
    Input Client Depict                                 ${clientDepict}
    Click On Create Project Button
    Assertion After Creating Project Successfully       ${projectName}    ${projectType}    ${projectStatus}     ${startYear}       ${startMonth}     ${startDay}      ${endYear}    ${endMonth}     ${endDay}      ${sizeDay}    ${location}     ${PM}     ${DM}     ${EM}     ${shortDepict}     ${longDepict}     ${technologies}     ${clientName}     ${clientIndustry}     ${clientDepict}
    Delete Project After Create






