*** Settings ***

Resource    ../Config/Library.robot

*** Test Cases ***

Check the reponse code 200 for Appointment Types

    ValidateStatus    ${BASE_URL}    ${APPOINTMENTCATEGORIES}    ${SITE_NAME}

Verifying received response body with the expected response

    CompareJSON    ${APPOINTMENTCATEGORIES}    ${FP_appcat}

Verifying ID of appointment category with the expected response

    CompareElements   ${JP_ID}  ${APPOINTMENTCATEGORIES}    ${FP_appcat}
    log to console    Test Passed

Verifying Category Name of appointment category with the expected response

    CompareElements   ${JP_CATEGORYNAME}    ${APPOINTMENTCATEGORIES}    ${FP_appcat}
    log to console    Test Passed

Verifying Parent category ID of appointment category with the expected response

    CompareElements   ${JP_parentCATEGORYID}    ${APPOINTMENTCATEGORIES}    ${FP_appcat}
    log to console    Test Passed

Verifying has child value of appointment category with the expected response

    CompareElements   ${JP_hasChild}    ${APPOINTMENTCATEGORIES}    ${FP_appcat}
    log to console    Test Passed

Verifying Level of appointment category with the expected response

    CompareElements   ${JP_Level}   ${APPOINTMENTCATEGORIES}    ${FP_appcat}
    log to console    Test Passed

Verifying the associated appointment type ids of appointment category with the expected response

    CompareElements   ${JP_appointmentTYPEID}   ${APPOINTMENTCATEGORIES}    ${FP_appcat}
    log to console    Test Passed