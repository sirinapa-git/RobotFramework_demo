***Settings***
Library             SeleniumLibrary
Library             RequestsLibrary
Test Setup          Open Browser And Maximize
Test Teardown       Close Browser Window

***Variables***
${URL}              https://demoqa.com/broken
${Browser}          Chrome
${VALID_IMG}        xpath=//div[p[text()='Valid image']]/img[contains(@src, "/images/Toolsqa.jpg" )]
${VERIFY_VALID_IMG}    xpath=//img[contains(@src, "/images/Toolsqa.jpg")]
${INVALID_IMG}      xpath=//img[contains(@src, "/images/Toolsqa_1.jpg")]
${VALID_LINKS}      xpath=//a[contains(@href, "http://demoqa.com")]
${INVALID_LINKS}    xpath=//a[contains(@href, "http://the-internet.herokuapp.com/status_codes/500")]

***Keywords***
Open Browser And Maximize
    Open Browser    ${URL}  ${Browser} 
    Maximize Browser Window
    Sleep   2s
Close Browser Window
    Close Browser
    Log To Console  Test Completed

***Test Cases***
TC-001 : Check Valid Image
    [Documentation]     Valid Image
    [Tags]              Functional
    Element Should Be Visible   ${VALID_IMG}
    ${img_src1} =   Get Element Attribute    ${VALID_IMG}    src
    Go To       ${img_src1}
    Element Should Be Visible   ${VERIFY_VALID_IMG}

TC-002 : Check Invalid Image
    [Documentation]     Invalid Image
    [Tags]              Functional
    Element Should Be Visible   ${INVALID_IMG}
    ${img_src2} =   Get Element Attribute    ${INVALID_IMG}    src
    Go To       ${img_src2}
    Page Should Not Contain Element    ${INVALID_IMG}

TC-003 : Check Valid Links
    [Documentation]     Valid Links
    [Tags]              Regression
    ${link} =   Get Element Attribute    ${VALID_LINKS}    href
    ${response} =    Get    ${link}
    Should Be Equal As Integers    ${response.status_code}    200

TC-004 : Check Invalid Links
    [Documentation]     Invalid Links
    [Tags]              Regression
    ${link} =   Get Element Attribute    ${INVALID_LINKS}    href
    ${response} =    Get    ${link}
    Should Be Equal As Integers    ${response.status_code}    500

