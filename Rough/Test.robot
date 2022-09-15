*** Settings ***

Library    Collections
Library    RequestsLibrary
Library  JSONLibrary

*** Variables ***
${baseURL}    https://api-dev.vee24.com/api/Appointments
${header}
${body}    { "siteSection": "MainSite","userGuid": "6c8fcec3-cb9e-4925-aa85-c17aecef3b2f","appointmentTypeId": 1,"referrer": "https://test.vee24.com","appointmentDate": "2022-08-25T00:00:00+00:00","appointmentTime": "05:00-06:00","clientOffSet": 0,"customerInfo": "{\"Email Address\": \"joe.bloggs@email.com\",\"First Name\": \"Joe\",\"Surname\": \"Bloggs\"}","email": "test@vee24.com","locationId": -1,"sitename": "autotest1" }

*** Test Cases ***

Test Case Example
   Create Session    createsessionname    ${baseURL}    headers=${header}
   ${response}=    POST On Session    createsessionname    data=${body}    headers=${header}
   Set Test Variable    ${response}    ${response}
   Validate Response Code & Message    ${response} 200  message    messageToBeValidated


*** Keywords ***

Get Result Response
    [Documentation]  This keyword will convert API response to json
    [Arguments]    ${response}
    &{result}=    Evaluate    json.loads($response.content)    json
    Log    ${result}
    [Return]    ${result}


Validate Response Code
    [Documentation]  This keyword will validate the response code given by user
     [Arguments]    ${response}     ${status_code}
     ${response_code}=    Convert To String    ${response.status_code}
     Should Be Equal    ${response_code}    ${status_code}     Response Code was Expected as:${status_code} but it was ${response_code}
     ...  values=False

Validate Response Code & Message
    [Documentation]  This keyword will validate the response code and response body given by user
    [Arguments]     ${response}   ${response_code}   ${key}   ${message}
    Validate Response Code     ${response}  ${response_code}
    ${res}=  Get Result Response   ${response}
    Dictionary Should Contain Item     ${res}  ${key}  ${message}