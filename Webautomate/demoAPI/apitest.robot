***Settings***
Library     RequestsLibrary

***Variables***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Get Data
    [Documentation]         Test API
    Create Session  my_session    ${BASE_URL}
    ${response}    GET    my_session    /users/1
    Log    ${response.json()}
    Should Be Equal As Strings    ${response.status_code}    200