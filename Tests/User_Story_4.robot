*** Settings ***
Resource            ../Resources/Helper/API/API_Helper.robot
Resource            ../Resources/Helper/UI/Oppenheimer_common.robot
Variables           ../TestData/User_Story_4.yml

#Suite Teardown
Test Teardown       close browser


*** Variables ***
${Base_URL}=                http://localhost:8080/
${Dispense_button}=         //*[@class= 'btn btn-danger btn-block']
${Red_Color}                rgb(220, 53, 69)
${Style_Attribute}          text
${cash_dispensed_text}=     //*[@class='display-4 font-weight-bold']
&{Request_header}=          Content-Type=application/json
#File Path
${dir_path}                 ${CURDIR}/../TestData/working_Class.csv


*** Test Cases ***
TC_1: Fetch the details of taxRelief for each person in the database using GET API
    [Documentation]    This test case run the Get api and returns a list consist of natid, tax relief
    ...    amount.
    [Tags]    sanity    regression
    Make a GET API Request with    ${Base_URL}    calculator/taxRelief
    Validate TaxRelief response    ${API_RESPONSE.content}

#TC_4: Query the amount of taxRelief for each person in the database
#    [Documentation]    This test case can query the amount of tax
#    ...    relief for each person in the database
#    Make a GET API Request with    ${Base_URL}    calculator/taxRelief
#    Verify the API Response Code is    200
#    FOR    ${response_value}    IN    @{API_RESPONSE.json()}
#    Should Match Regexp    ${response_value}[natid]    ^.{4}\\$*$
#    ${roundoff_TaxReleif}=    Convert To Number    ${response_value}[relief]    0
#    END
