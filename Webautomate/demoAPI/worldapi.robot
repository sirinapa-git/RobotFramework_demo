*** Settings ***
Library               RequestsLibrary
Library               JSONLibrary
Library               Collections

*** Variables ***
${URL}            https://thetestingworldapi.com/  
${NEW_STUDENT}       {"first_name": "John", "middle_name": "A", "last_name": "Doe", "date_of_birth": "2000-01-01"}
${UPDATE_STUDENT}    {"first_name": "John", "middle_name": "B", "last_name": "Doe", "date_of_birth": "2000-01-01"}
${STUDENT_ID}        0
${HEADERS}       {"Content-Type": "application/json"} 

*** Test Cases ***
TC_01 Get Request
    Create Session      API_Testing     ${URL}
    ${response}=       GET on Session     API_Testing     /api/studentsDetails/10523134
    Log To Console     ${Response.status_code}
    Should Be Equal As Numbers    ${Response.status_code}    200

TC_02 JSON
    Create Session      API_Testing     ${URL}
    ${get_response}=    GET on Session  API_Testing     /api/studentsDetails/10523134
    ${json_response}=   To JSON    ${get_response.content}
    Log To Console      ${json_response}

TC_03 Get Data from JSON
    Create Session      API_Testing     ${URL}
    ${get_response}=    GET on Session  API_Testing     /api/studentsDetails/10523134
    ${json_response}=   To JSON    ${get_response.content}
    @{first_name}=      get value from json    ${json_response}     data.first_name 
    Log To Console      ${first_name}    

TC_04 Get Student Details
    Create Session      API_Testing     ${URL}
    ${response}=       GET On Session     API_Testing     /api/studentsDetails
    Log To Console     ${response.status_code}
    Should Be Equal As Numbers    ${response.status_code}    200
    ${json_response}=   To JSON    ${response.content}
    Log To Console      ${json_response}

TC_05 POST to Create a New Student
    Create Session      API_Testing     ${URL}
    ${response}=       POST On Session     API_Testing     /api/studentsDetails     json=${NEW_STUDENT}    headers=${HEADERS}
    Log To Console     ${response.status_code}
    Should Be Equal As Numbers    ${response.status_code}    200
    ${json_response}=   To JSON    ${response.content}
    Log To Console      ${json_response}
    ${STUDENT_ID}=     Get Value From Json    ${json_response}    $.id
    Set Suite Variable  ${STUDENT_ID}    ${STUDENT_ID}
