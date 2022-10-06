*** Settings ***
Resource            ../Resources/Helper/API/API_Helper.robot
Resource            ../Resources/Helper/UI/Oppenheimer_common.robot

#Suite Teardown
Test Teardown       close browser


*** Variables ***
${Base_URL}=                            http://localhost:8080/
&{Request_header}=                      Content-Type=application/json
${upload_CSV_file_text}=                //*[@class='input-group-text']
${Expected_Natid}=                      ASDS$$$$$
${Refresh_Tax_Relief_Table_button}=     //*[@class='btn btn-primary']
#File Path
${dir_path}                             ${CURDIR}/../TestData/working_Class.csv


*** Test Cases ***
TC_1: Upload records of working class hero using CSV
    [Documentation]    uploading CSV file on UI page
    [Tags]    sanity    regression
    Navigate to Oppenheimer Project
    Upload File    ${dir_path}
    Click Button    ${Refresh_Tax_Relief_Table_button}
    Wait Until Keyword Succeeds    5s    1s    Page Should Contain Element    //tbody/tr/td[text()='${Expected_Natid}']

TC_2: validate Upload CSV file and Refresh Tax Relief Table Text from UI
    [Documentation]    uploading CSV file on UI page
    [Tags]    regression
    Navigate to Oppenheimer Project
    Element Text Should Be    ${upload_CSV_file_text}    Upload CSV file
    Element Text Should Be    ${Refresh_Tax_Relief_Table_button}    Refresh Tax Relief Table
