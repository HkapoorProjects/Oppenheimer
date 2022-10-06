*** Settings ***
Resource            ../Resources/Helper/API/API_Helper.robot
Resource            ../Resources/Helper/UI/Oppenheimer_common.robot

#Suite Teardown
Test Teardown       close browser


*** Variables ***
${Dispense_button}=         //*[@class= 'btn btn-danger btn-block']
${Red_Color}                rgb(220, 53, 69)
${Style_Attribute}          text
${cash_dispensed_text}=     //*[@class='display-4 font-weight-bold']


*** Test Cases ***
TC_1: Validate Dispense Now button on the UI must be red-colored
    [Documentation]    This test case is validating the Dispense Now button color attribute
    [Tags]    sanity    regression
    Navigate to Oppenheimer Project
    ${style}=    Execute Javascript
    ...    return getComputedStyle(document.querySelector('a.btn.btn-danger.btn-block')).getPropertyValue('background-color')
    should be equal    ${style}    ${Red_Color}

TC_2: Validate the text on the button must be exactly “Dispense Now”
    [Documentation]    This test case is validating the Dispense Now text on the UI
    [Tags]    regression
    Navigate to Oppenheimer Project
    Element Text Should Be    ${Dispense_button}    Dispense Now

TC_3: Click on Dispense Now Button and validate text that says “Cash dispensed”
    [Documentation]    This test case is clicking on Dispense now button
    ...    and navigate to the next page and validate text that says “Cash dispensed”
    [Tags]    sanity    regression
    Navigate to Oppenheimer Project
    Element Text Should Be    ${Dispense_button}    Dispense Now
    Dispense taxRelief    ${Dispense_button}
    Element Text Should Be    ${cash_dispensed_text}    Cash dispensed
