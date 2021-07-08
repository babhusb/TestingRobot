*** Settings ***
Library     DateTime
Library     SeleniumLibrary
Library     OperatingSystem

*** Test Cases ***
TC1 Get Datetime
    ${Currentdate}     Get Current Date
    Log To Console    ${Currentdate}

TC2 PrintName
    ${name1}    Set Variable    test
    Log To Console    ${name1}

TC3 OpenBrowser Login
    Append To Environment Variable      path       D:\\chromedriver
    Open Browser    url=https://www.jetbrains.com/pycharm/      browser=chrome
    Maximize Browser Window


TC4 Testing
    Close Browser
    Append To Environment Variable      path       D:\\chromedriver
    Open Browser    url=http://demo.openemr.io/b/openemr/interface/login/login.php?site=default      browser=chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Input Text    xpath=//input[@id='authUser']    admin
    Input Password    xpath=//input[@id='clearPass']    pass
    Select From List By Label    xpath=//select[@name='languageChoice']     English (Indian)
    Click Button    xpath=//button[text()[contains(.,'Login')]]
    ${title}    Get Title
    Log    ${title}
    Log To Console    ${title}
    
    Mouse Over      //div[@role="button" and .='Patient/Client']
    Sleep    2s
    Mouse Over      //div[.='Patients']
    Click Element    //div[.='Patients']
    Select Frame    //iframe[@name="fin"]
    Click Button    //button[@id="create_patient_btn1"]
    Close All Browsers
