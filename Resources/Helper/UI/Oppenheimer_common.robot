*** Settings ***
Documentation       This page object file has all the UI related Keyword

Library             SeleniumLibrary
Library             OperatingSystem

*** Variables ***
${browse_button}=       //*[@class='custom-file-input']
${Base_URL}=            http://localhost:8080/

*** Keywords ***
Navigate to Oppenheimer Project
    [Documentation]    Navigate to the Oppenheimer Project page
    Open Browser    ${base_URL}    chrome
    Set Screenshot Directory    EMBED
    Maximize Browser Window

Upload File
    [Documentation]    Pass xpath(xpath should be related to input tag not button) and path of file
    [Arguments]    ${File_Path}
    ${NORMAL_PATH_UPLOAD_FILE_NAME}=    Normalize Path    ${File_Path}
    Choose File    ${browse_button}    ${NORMAL_PATH_UPLOAD_FILE_NAME}
    #### Load Time ########
    Sleep    2s

Dispense taxRelief
    [Documentation]    Dispense tax relief for working class heroes
    [Arguments]    ${Dispense_button}
    Click Element    ${Dispense_button}
