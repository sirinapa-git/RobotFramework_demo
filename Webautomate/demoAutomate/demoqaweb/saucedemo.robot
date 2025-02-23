***Settings***
Library             SeleniumLibrary
Library             RequestsLibrary
Test Setup          Open Browser And Maximize
Test Teardown       Close Browser Window

***Variables***
${url}              https://www.saucedemo.com/
${Browser}          Chrome
***Keywords****
Open Browser And Maximize
    Open Browser    ${url}      ${Browser}    
    Maximize Browser Window
    Sleep       2s         
Close Browser Window
    Close Browser
    # Log To Console  Test Completed

Test Keyword 1
    Log To Console  Executed Keyword1 - Found Items as expected

Test Keyword 2
    Log To Console  Executed Keyword2 - Found less than expected Items 

Test Keyword 3
    Log To Console  Executed Keyword3 - Exception

***Test Cases***
tc-01 : If-Else test(div)
    [Documentation]     Test  If-Else test Div in this testcase
    Input Text      id:user-name    standard_user
    Input Password  id:password     secret_sauce
    Click Button    id:login-button
    # ${count_list}=  Get Element Count   xpath=//*[@id="inventory_container"]/div
    # Log To Console  ${count_list}
    # Run Keyword If  ${count_list} == 10   Test Keyword 1
    # ...     ELSE IF ${count_list} < 10 and ${count_list} > 6  Test Keyword 2
    # ...     ELSE    Test Keyword 3

    ${count_div}=  Get Element Count   xpath=//*[@id="inventory_container"]/div//div[@class='inventory_item']
    ${count_item}=  Get Element Count   xpath=//div[@class='inventory_item']

    Log To Console    count_div = ${count_div}
    # Log To Console    count_item = ${count_item}

    Run Keyword If  ${count_div} == 10   Test Keyword 1
    ...     ELSE IF ${count_div} < 10 and ${count_div} > 6  Test Keyword 2
    ...     ELSE    Test Keyword 3

    # Run Keyword If  ${count_item} == 10   Test Keyword 1
    # ...     ELSE IF ${count_item} < 10 and ${count_item} > 6  Test Keyword 2
    # ...     ELSE    Test Keyword 3

tc-02 : If-Else test item(item)
        [Documentation]     Test  If-Else check Item in this testcase
        Input Text      id:user-name    standard_user
        Input Password  id:password     secret_sauce
        Click Button    id:login-button
        ${count_div}=  Get Element Count   xpath=//*[@id="inventory_container"]/div//div[@class='inventory_item']
        ${count_item}=  Get Element Count   xpath=//div[@class='inventory_item']
        Log To Console    count_item = ${count_item}
        Run Keyword If  ${count_item} == 10   Test Keyword 1
        ...     ELSE IF ${count_item} < 10 and ${count_item} > 6  Test Keyword 2
        ...     ELSE    Test Keyword 3