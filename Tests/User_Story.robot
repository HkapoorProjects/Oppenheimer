*** Settings ***
Resource        ../Resources/Helper/API/API_Helper.robot
Resource        ../Resources/Helper/UI/Oppenheimer_common.robot
Library         Collections
Variables       ../TestData/User_Story.yml

#Suite Teardown
Test Teardown    close browser

*** Variables ***
${Base_URL}=                http://localhost:8080/
${Dispense_button}=         //*[@class= 'btn btn-danger btn-block']
${Red_Color}                rgb(200, 35, 51)
${Style_Attribute}          text
${cash_dispensed_text}=     //*[@class='display-4 font-weight-bold']
&{Request_header}=          Content-Type=application/json
#File Path
${dir_path}                 ${CURDIR}/../TestData/working_Class.csv

*** Test Cases ***
TC_1: Insert a single record of working class
    [Documentation]    This test case can add single record in database via Post API
    Make a POST API Request with    ${Base_URL}    calculator/insert
    ...    ${Request_header}
    ...    ${Single_record}
    Verify the API Response Code is    202

TC_2: Insert a multiple records of working class
    [Documentation]    This test case can add more than one record in database via Post API
    Make a POST API Request with    ${Base_URL}    calculator/insertMultiple
    ...    ${Request_header}
    ...    ${Multiple_records}
    Verify the API Response Code is    202

TC_3: Upload records of working class hero using CSV
    [Documentation]    uploading CSV file on UI page
    Navigate to Oppenheimer Project
    Upload File    ${dir_path}

TC_4: Query the amount of taxRelief for each person in the database
    [Documentation]    This test case can query the amount of tax
    ...    relief for each person in the database
    Make a GET API Request with    ${Base_URL}    calculator/taxRelief
    Verify the API Response Code is    200
    FOR    ${response_value}    IN    @{API_RESPONSE.json()}
        Should Match Regexp    ${response_value}[natid]    ^.{4}\\$*$
        ${roundoff_TaxReleif}=    Convert To Number    ${response_value}[relief]    0
    END

TC_5: Dispense tax relief for working class heroes
    [Documentation]    This test case can Dispense tax relief for working class heroes
    Navigate to Oppenheimer Project
#    ${color}=    Get Element Attribute    ${Dispense_button}    style
#    ${text}=    Get Text    ${Dispense_button}
    Element Text Should Be    ${Dispense_button}    Dispense Now
    Dispense taxRelief    ${Dispense_button}
    Element Text Should Be    ${cash_dispensed_text}    Cash dispensed
