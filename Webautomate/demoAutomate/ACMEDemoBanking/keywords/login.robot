*** Settings ***
Library         SeleniumLibrary
Resource        common.robot

*** Keywords ***
user login to ACME Demo Banking with ${Username} and ${Passwor}
    common.Wait until element is ready then input text        name=email            ${Username}
    common.Wait until element is ready then input text        name=password         ${Passwor}
    common.Wait until element is ready then click element     xpath=//button[@type="submit" and text()="เข้าสู่ระบบ"]