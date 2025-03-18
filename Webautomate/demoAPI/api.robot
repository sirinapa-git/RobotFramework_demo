*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://practicesoftwaretesting.com

*** Test Cases ***
Test GET Request
    [Documentation]    Test API GET Request
    Create Session    practice_api    ${BASE_URL}    verify=False
    ${params}    Create Dictionary    page=1
    ${response}    GET On Session    practice_api    url=/api/users    params=${params}
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console    ${response.text}

Test GET Users
    [Documentation]    Test API GET User Request 
    Create Session    practice_api    ${BASE_URL}    verify=False
    ${params}    Create Dictionary    page=1
    ${response}    GET On Session    practice_api    url=/api/users    params=${params}
    Should Be Equal As Strings    ${response.status_code}    200
    Log To Console    ${response.text}
