*** Settings ***
Library     OperatingSystem
Library     SeleniumLibrary


*** Test Cases ***
TC1
    Close Browser
    Append To Environment Variable      path       D:\\chromedriver
    Open Browser    url=https://www.db4free.net/      browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Click Element    //a[@href="/phpMyAdmin"]
    ${handles}=    Get Window Handles
    Switch Window       ${handles}[1]
    ${title}    Get Title
    Log    ${title}
    Log To Console    ${title}
    Input Text    xpath=//input[@id="input_username"]    admin
