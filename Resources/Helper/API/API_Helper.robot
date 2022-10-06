*** Settings ***
Library     RequestsLibrary
Library    Collections

*** Variables ***
@{expected_keys_in_tax_relief} =  name    natid    relief

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

Verify the API Response body contains Error Message
    [Arguments]    ${error_msg}
    ${response_body} =  convert to string  ${API_RESPONSE.content}
    Should Contain    ${response_body}      ${error_msg}

Verify the API Response body has empty list
    ${response_body} =  convert to string  ${API_RESPONSE.content}
    Should Be Equal As Strings  ${response_body}  []

Get python object for JSON
     [Arguments]  ${json_value}
    ${python_data}  evaluate  json.loads('''${json_value}''')    json
    [Return]  ${python_data}

Verify datatype
    [Arguments]      ${value}   ${data_type}
    ${is_valid_value}    evaluate  isinstance(${value}, ${data_type})
    [Return]    ${is_valid_value}

Validate TaxRelief response
    [arguments]      ${json_value}
    ${python_data}    Get python object for JSON     ${json_value}
    ${is_list}    Verify datatype    ${python_data}    list
    Should Be True    ${is_list}
    ${length}       Get Length   ${python_data}
    IF  ${length}>0
        ${key_list}     Get Dictionary Keys    ${python_data}[0]
        Lists Should Be Equal    ${key_list}    ${expected_keys_in_tax_relief}    ignore_order=True
    END





