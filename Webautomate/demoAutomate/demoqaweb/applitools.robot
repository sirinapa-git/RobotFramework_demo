# ***Settings***
# Library             SeleniumLibrary
# Library             RequestsLibrary
# Test Setup          Open Browser And Maximize
# Test Teardown       Close Browser Window

# ***Variables***
# ${URL}              https://demo.applitools.com/
# ${Browser}          Chrome

# ***Keywords***
# Open browser and maximize
#     Open Browser    ${url}  ${browser}
#     Minimize Browser Window
#     sleep   2s

# Close browser window
#     Close Browser
#     Log To Console  Test Completed

# Login Homepage
#     Input Text          id:username  Ab.stopbus+1@gmail.com
#     Input Password      id:password  Password123! 
#     Click Link          id=log-in
#     #id: -> ใช้สำหรับการระบุ locator,id= -> ใช้ระบุค่าหรือค่าของตัวแปร

# ***Test Cases***
# tc1:Login Homepage
#     Login Homepage
#     Close browser window

