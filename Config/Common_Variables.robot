
*** Variables ***

${BASE_URL}     https://api-dev.vee24.com

# Add endpoints parameters in this section

${APPOINTMENTS}             api/Appointments
${APPOINTMENTTYPES}         api/AppointmentTypes
${APPOINTMENTCATEGORIES}    api/AppointmentCategories

# Add search parameters here

${SITE_NAME}    sitename=autotest1

# Add JSON paths here

${JP_APPTNAME}        $.appointmentTypes..name
${JP_CALLTYPE}        $.appointmentTypes..callType
${JP_CUSTOMERINFO}    $.appointmentTypes..customerInfo
${JP_SLOTDURATION}    $.appointmentTypes..slotDuration
${JP_LOCATIONIDS}     $.appointmentTypes..locationIds


${JP_ID}                    $.categories..id
${JP_CATEGORYNAME}          $.categories..name
${JP_parentCATEGORYID}      $.categories..parentCategoryId
${JP_hasChild}              $.categories..hasChild
${JP_Level}                 $.categories..level
${JP_appointmentTYPEID}     $.categories..appointmentTypeId

# Sample Json Path

${FP_apptype}    C:/DevOps Prac/API Automation/Vee24/Samples/response_json_apptype.json
${FP_appcat}     C:/DevOps Prac/API Automation/Vee24/Samples/response_json_appCat.json

# Appointment IDs

${APT_ID_AUTOTEST}    63







