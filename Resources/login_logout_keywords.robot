*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Variables    ../Locators/Login_locators.py
Variables    ../Locators/General_locators.py
Variables    ../Locators/Cart_locators.py
Variables    ../Locators/Sort_locators.py
Variables    ../Constants/dm_constant.py
Library    ../Resources/decrypt_password.py
# Library    DataDriver    file=Book1.xlsx    sheet_name=Sheet1

*** Keywords ***
Test_login
    [Arguments]    ${uname}    ${pass}
    Open Browser    ${url}    ${edge}
    Maximize Browser Window
    Wait Until Element Is Visible    ${login_btn}    ${wait_30}
    Input Text    ${username_input}    ${uname}
    Input Text    ${password_input}    ${pass}
    Click Element    ${login_btn}

login
    Open Browser    ${url}    ${edge}
    Maximize Browser Window
    Wait Until Element Is Visible    ${login_btn}    ${wait_30}
    Input Text    ${username_input}    ${username}
    ${pass}    decrypt_password    ${login_password}
    Input Text    ${password_input}    ${pass} 
    Click Element    ${login_btn}

logout
    Click Element    ${left_menu}
    Wait Until Element Is Visible    ${logout_btn}
    Click Element    ${logout_btn}
    Wait Until Element Is Visible    ${login_btn}
    Close Browser



