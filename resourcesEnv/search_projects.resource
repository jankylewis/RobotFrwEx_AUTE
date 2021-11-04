*** Settings ***
Resource    login.resource

*** Variables ***
# Store selectors before clicking on Search button
${TXT_PROJECT_NAME}                     xpath://span[@ui-view="project" and @id="searchProject"]//div[@class="lineheight"]//label[@class="search-label"]/following-sibling::input
${DDL_PROJECT_LOCATION}                 xpath://span[@ui-view="project" and @id="searchProject"]//div[@class="lineheight"]//label[@class="search-label"]/following-sibling::select[@id="ddl-location"]
${DDL_PROJECT_TYPE}                     xpath://span[@ui-view="project" and @id="searchProject"]//div[@class="lineheight"]//label[@class="search-label"]/following-sibling::select[@id="ddl-projecttype"]
${BTN_SPY_GLASS_ICON}                   xpath://span[@ui-view="project" and @id="searchProject"]//div//following::button[@type="button" and @ng-click="search(input)"]
${DDL_PROJECTS}                         xpath://div[@id="navbar"]//a[contains(text(),"Projects")]
${DDI_SEARCH_PROJECTS}                  xpath://div[@id="navbar"]//a[contains(text(),"Search Project")]

# Store selectors after clicking on Spy Glass button
${LBL_TOTAL_COUNT}                      xpath://label[@ng-show="total_count"]
${LBL_PROJECT_COUNTER}                  xpath://div[@ui-view='projectsresult']//div[@id='tbl-results']//tr[@total-items='total_count']//a[@class='ng-binding']

*** Keywords ***
Click On Search Projects Button
    Wait Until Element Is Visible           ${DDL_PROJECTS}
    Click Element       ${DDL_PROJECTS}
    Wait Until Element Is Visible           ${DDI_SEARCH_PROJECTS}
    Click Element       ${DDI_SEARCH_PROJECTS}

Input Search Project Name
    [Arguments]         ${searchProjectName}
    Input Text          ${TXT_PROJECT_NAME}         ${searchProjectName}

Select Project Location
    [Arguments]         ${searchProjectLocation}
    Select From List By Label                       ${DDL_PROJECT_LOCATION}           ${searchProjectLocation}

Select Project Type
    [Arguments]         ${searchProjectType}
    Select From List By Label                       ${DDL_PROJECT_TYPE}               ${searchProjectType}

Click On Spy Glass Icon
    Click Button        ${BTN_SPY_GLASS_ICON}

Assertion After Searching Projects Successfully
    [Arguments]             ${searchProjectName}          ${searchProjectLocation}          ${searchProjectType}
    Wait Until Element Is Visible                         ${LBL_TOTAL_COUNT}
    ${projectCounter}         Get Element Count           ${LBL_PROJECT_COUNTER}
    Log To Console          \n\n${projectCounter}\n\n
        FOR        ${index}         IN RANGE    1    ${projectCounter} + 1
        Exit For Loop If      ${index} > ${projectCounter}
        ${afSearchProjectName}              Get Text                    xpath://div[@ui-view='projectsresult']//div[@id='tbl-results']/table/tbody/tr[${index}]/td[1]/a
        ${afSearchProjectLocation}          Get Text                    xpath://div[@ui-view='projectsresult']//div[@id="tbl-results"]/table/tbody/tr[${index}]/td[6]
        ${afSearchProjectType}              Get Text                    xpath://div[@ui-view='projectsresult']//div[@id="tbl-results"]/table/tbody/tr[${index}]/td[3]
        Log To Console              \n${afSearchProjectName}\n${afSearchProjectLocation}\n${afSearchProjectType}\n
        Element Should Contain      xpath://div[@ui-view='projectsresult']//div[@id='tbl-results']/table/tbody/tr[${index}]/td[1]/a         ${searchProjectName}
        Element Should Contain      xpath://div[@ui-view='projectsresult']//div[@id="tbl-results"]/table/tbody/tr[${index}]/td[6]           ${searchProjectLocation}
        Element Should Contain      xpath://div[@ui-view='projectsresult']//div[@id="tbl-results"]/table/tbody/tr[${index}]/td[3]           ${searchProjectType}
        ${index}                    Evaluate                            ${index} + 1
    END