*** Settings ***
Library     RequestsLibrary

*** Keywords ***
Make a GET API Request with
    [Arguments]    ${URL}    ${Path}    ${json_header}=&{EMPTY}    ${json_param}=&{EMPTY}
    Log
    ...    <b>Domain_URL: ${URL}<br>Path: ${Path}<br>Request Headers: ${json_header}<br>Request Params: ${json_param}</b>
    ...    HTML
    Create Custom Session    API_GET    ${URL}    auth=${EMPTY}    disable_warnings=1
    ${API_RESPONSE}=    Get Request    API_GET    ${Path}    headers=${json_header}    params=${json_param}
    Log many    Response Status Code:    ${API_RESPONSE.status_code}    Response Body:    ${API_RESPONSE.content}
    ...    Response Headers:    ${API_RESPONSE.headers}
    Set Suite variable    ${API_RESPONSE}

Make a POST API Request with
    [Arguments]    ${URL}    ${Path}    ${json_header}    ${json_body}    ${json_param}=&{EMPTY}
    Log    <b>Domain_URL: ${URL}<br>Path: ${Path}<br>Request Headers: ${json_header}<br>Request Body: ${json_body}</b>
    ...    HTML
    Create Custom Session    API_POST    ${URL}    auth=${EMPTY}    disable_warnings=1
    ${API_RESPONSE}=    Post Request    API_POST    ${Path}    headers=${json_header}    data=${json_body}
    Log many    Response Status Code:    ${API_RESPONSE.status_code}    Response Body:    ${API_RESPONSE.content}
    ...    Response Headers:    ${API_RESPONSE.headers}
    Set Suite variable    ${API_RESPONSE}

Verify the API Response Code is
    [Arguments]    ${expected_status_code}
    Log
    ...    <b>Actual Response Status Code: ${API_RESPONSE.status_code}<br>Expected Response Status Code: ${expected_status_code}</b>
    ...    HTML
    Should Be Equal As Strings    ${API_RESPONSE.status_code}    ${expected_status_code}
