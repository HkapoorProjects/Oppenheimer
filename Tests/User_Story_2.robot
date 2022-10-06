*** Settings ***
Resource        ../Resources/Helper/API/API_Helper.robot
Resource        ../Resources/Helper/UI/Oppenheimer_common.robot
Variables       ../TestData/User_Story_2.yml


*** Variables ***
${Base_URL}=            http://localhost:8080/
&{Request_header}=      Content-Type=application/json


*** Test Cases ***
TC_1: Insert a multiple records of working class
    [Documentation]    This test case can add more than one record in database via Post API
    [Tags]    sanity    regression
    Make a POST API Request with    ${Base_URL}    calculator/insertMultiple
    ...    ${Request_header}
    ...    ${Multiple_records}
    Verify the API Response Code is    202

# Negative Scenario's

TC_2: Insert a single record of working class
    [Documentation]    This test case we are adding one record i.e JSON in database via Post API
    [Tags]    regression
    Make a POST API Request with    ${Base_URL}    calculator/insertMultiple
    ...    ${Request_header}
    ...    ${Single_record}
    Verify the API Response Code is    400
    Verify the API Response body contains Error Message    JSON parse error

TC_3: Insert a incorrect record and validate the response
    [Documentation]    In this test case will add incorrect form of json and validate the error response.
    [Tags]    regression
    Make a POST API Request with    ${Base_URL}    calculator/insertMultiple
    ...    ${Request_header}
    ...    ${Incorrect_record}
    Verify the API Response Code is    500
    Verify the API Response body contains Error Message    Internal Server Error

TC_4: Insert a record with invalid format of Gender and validate the response
    [Documentation]    In this test case will add incorrect form of json and validate the error response.
    [Tags]    regression
    Make a POST API Request with    ${Base_URL}    calculator/insertMultiple
    ...    ${Request_header}
    ...    ${Incorrect_Gender_format}
    Verify the API Response Code is    500
    Verify the API Response body contains Error Message
    ...    could not execute statement; SQL [n/a]; nested exception is org.hibernate.exception.DataException: could not execute statement

TC_5: Insert a record with invalid birthday format and validate the response
    [Documentation]    In this test case will add incorrect form of json and validate the error response.
    [Tags]    regression
    Make a POST API Request with    ${Base_URL}    calculator/insertMultiple
    ...    ${Request_header}
    ...    ${Incorrect_birthday_format}
    Verify the API Response Code is    500
    Verify the API Response body contains Error Message
    ...    Text '19951122' could not be parsed: Invalid value for MonthOfYear (valid values 1 - 12): 95
