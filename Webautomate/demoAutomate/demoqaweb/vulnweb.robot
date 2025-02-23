*** settings ***
Library			SeleniumLibrary
Test Setup      Open browser and maximize
Test Teardown   Close browser window

*** Variables ***
${url}                  http://testphp.vulnweb.com/login.php
${browser}              Chrome
${username}             test
${password}             test
@{list_search_texts}    Posters  Paintings  Stickers  Graffity 
#this is list to collect Posters  Paintings  Stickers  Graffity
***Keywords***
Open browser and maximize
    Open Browser    ${url}  ${browser}
    Minimize Browser Window
    sleep   2s

Close browser window
    Close Browser
    Log To Console  Test Completed

Log in with username and password
    Input Text      xpath=//input[@name="uname"]        ${username}
    Input Password  xpath=//input[@name="pass"]        ${password}
    Click Button    xpath=//input [@type="submit"]

Browse to categories
    Click Link     xpath=//div[@id='sectionLinks']//a[@href='categories.php']

Verify the category page contains keywords " Posters, Painings, Stickers, Grafity "
    FOR    ${item}    IN    @{list_search_texts}
        Page Should Contain    ${item}
        Log    ${item}
    END
    
***Test Cases***
tc-01: Login Page
        [Documentation]         Verify the category page contains keywords " Posters, Painings, Stickers, Grafity "
        [Tags]                  Functional
        Log in with username and password
        Browse to categories
        Verify the category page contains keywords " Posters, Painings, Stickers, Grafity "
