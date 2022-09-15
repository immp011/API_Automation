*** Settings ***

Library    Collections
Library    RequestsLibrary
Library  JSONLibrary

Resource    ../Config/Common_Variables.robot

*** Variables ***
*** Keywords ***


GetJSON
    [Arguments]    ${base_url}    ${elements}   ${parameters}
    [Documentation]  This keyword checks the response for API request If response code is 200 then case is passed, for any other rsponse test case is failed.
    [Tags]  Common


    create session    mysession     ${base_url}    disable_warnings=1
    ${endpoint}    set variable    /${elements}?${parameters}
    ${resp}=    GET On Session    mysession    ${endpoint}
    &{response}=    Evaluate    json.loads($resp.content)    json
    # ${type_resp}=    Evaluate    type($response)
    # log to console    ${type_resp}
    [Return]    ${response}



ValidateStatus
    [Arguments]    ${base_url}    ${elements}   ${parameters}

    ${endpoint}    set variable    /${elements}?${parameters}
    ${response}=    GET    ${base_url}    ${endpoint}    expected_status=200
    LOG TO CONSOLE    Test Passed


CompareElements
    [Arguments]     ${parameters}    ${elements}    ${file_path}
    ${response}=    getJson    ${BASE_URL}    ${elements}   ${SITE_NAME}

    ${resp_obj}=    get value from json   ${response}    ${parameters}
    #log to console     ${resp_obj}

    ${file_json}=    load json from file     ${file_path}
    ${json_object}=    get value from json   ${file_json}   ${parameters}

    should be equal  ${resp_obj}    ${json_object}


CompareJSON
    [Arguments]    ${element}    ${file_path}

    ${response}=    getJson    ${BASE_URL}    ${element}    ${SITE_NAME}

    #log to console     ${resp_obj}

    ${file_json}=    load json from file     ${file_path}

    should be equal  ${response}     ${file_json}


Querying Appointment Type

    # create session    mysession     ${base_url}    disable_warnings=1
    ${resp}=    GET    https://api-dev.vee24.com/api/AppointmentTypes/63
    ${response}=    convert to string   ${resp.content}


    log to console    ${response}

   should contain    ${response}  ${APT_ID_AUTOTEST}

    #should be equal    ${json_obj}    63




