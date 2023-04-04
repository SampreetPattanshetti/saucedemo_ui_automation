*** Settings ***
Library     SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    String
Resource    ../Resources/login_logout_keywords.robot
Resource    ../Resources/sort_keywords.robot
Resource    ../Resources/cart_keywords.robot
Library    ../Resources/python.py
Variables    ../Locators/Login_locators.py
Variables    ../Locators/General_locators.py
Variables    ../Locators/Cart_locators.py
Variables    ../Locators/Sort_locators.py
Variables    ../Constants/dm_constant.py
#pip install robotframework-datadriver
Library    DataDriver    file=Book1.xlsx    dialect=excel
Test Template    Test_login

*** Keywords ***
Test_login
    [Arguments]    ${uname}    ${pass}
    Open Browser    ${url}    ${edge}
    Maximize Browser Window
    Wait Until Element Is Visible    ${login_btn}    ${wait_30}
    Input Text    ${username_input}    ${uname}
    Input Text    ${password_input}    ${pass}
    Click Element    ${login_btn}
    Page Should Not Contain    ${login_error}
    Close Browser

*** Test Cases ***
Login_Test
    Test_login    ${uname}    ${pass}
    