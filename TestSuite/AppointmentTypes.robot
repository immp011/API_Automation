*** Settings ***

Resource    ../Config/Library.robot

*** Test Cases ***

Check the reponse code 200 for Appointment Types

    ValidateStatus    ${BASE_URL}    ${APPOINTMENTTYPES}    ${SITE_NAME}

Verifying the received response body with the expected response

    CompareJSON    ${APPOINTMENTTYPES}    ${FP_apptype}

Verifying Call Types of appointment types with the expected response

    CompareElements   ${JP_CALLTYPE}   ${APPOINTMENTTYPES}   ${FP_apptype}
    log to console    Test Passed

Verifying Customer Information of appointment types with the expected response

    CompareElements   ${JP_CUSTOMERINFO}   ${APPOINTMENTTYPES}   ${FP_apptype}
    log to console    Test Passed

Verifying Slot Durations of appointment types with the expected response

    CompareElements   ${JP_SLOTDURATION}   ${APPOINTMENTTYPES}   ${FP_apptype}
    log to console    Test Passed

Verifying Location IDs of appointment types with the expected response

    CompareElements   ${JP_LOCATIONIDS}   ${APPOINTMENTTYPES}   ${FP_apptype}
    log to console    Test Passed

Verifying Appointment Types names with the expected response

    CompareElements   ${JP_APPTNAME}   ${APPOINTMENTTYPES}   ${FP_apptype}
    log to console    Test Passed

Querying specific appointment type returns correct values

    Querying Appointment Type