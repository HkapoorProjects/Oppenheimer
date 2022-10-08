*** Settings ***
Resource            ../Resources/Helper/API/API_Helper.robot
Resource            ../Resources/Helper/UI/Oppenheimer_common.robot
Variables           ../TestData/User_Story_4.yml
Library             ../Resources/Helper/API/tax_relief.py
Library             String

#Suite Teardown
Test Teardown       close browser


*** Variables ***
${Base_URL}=                http://localhost:8080/
&{Request_header}=          Content-Type=application/json


*** Test Cases ***
TC_1: Fetch the details of taxRelief for each person in the database using GET API
    [Documentation]    This test case run the Get api and returns a list consist of natid, tax relief
    ...    amount.
    [Tags]    sanity    regression
    Make a GET API Request with    ${Base_URL}    calculator/taxRelief
    Verify the API Response Code is    200
    Validate TaxRelief response    ${API_RESPONSE.content}

TC_2: Validate that the natid field must be masked from the 5th character onwards with dollar sign ‘$’
    [Documentation]    This test case will validate the natid with masked value
    [Tags]    sanity    regression
    Make a GET API Request with    ${Base_URL}    calculator/taxRelief
    Verify the API Response Code is    200
    FOR    ${response_value}    IN    @{API_RESPONSE.json()}
        Should Match Regexp    ${response_value}[natid]    ^.{4}\\$*$
    END

TC_3: Calculate the computation of the tax relief using the formula as described and round off
    [Documentation]  This test case will use the formula and calculate and validate the tax relief
    [tags]          sanity     regression
    Make a POST API Request with    ${Base_URL}    calculator/insert
    ...    ${Request_header}
    ...    ${Single_record}
    Make a GET API Request with    ${Base_URL}    calculator/taxRelief
    ${taxRelief_list}=    Get python object for JSON    ${API_RESPONSE.content}
    FOR    ${user_record}  IN    @{taxRelief_list}
        IF  "${user_record}[name]" == "${Single_record}[name]"
            ${tax_relief_response} =  Set variable  ${user_record}[relief]
            Set Test Variable    ${tax_relief_response}
        END
    END
     ${yyyy}=        Convert To String     ${Single_record}[birthday]
     ${birth_year}=    Get Substring      ${YYYY}   -4
     ${age} =  Evaluate    2022 - ${birth_year}
    ${tax_relief_compute} =  get final tax relief    ${Single_record}[salary]  ${Single_record}[tax]  ${age}  ${Single_record}[gender]
    Should Be Equal    ${tax_relief_compute}    ${tax_relief_response}
