*** Settings ***
Library     SeleniumLibrary
Library    ../Resources/python.py
Variables    ../Locators/Login_locators.py
Variables    ../Locators/General_locators.py
Variables    ../Locators/Cart_locators.py
Variables    ../Locators/Sort_locators.py
Variables    ../Constants/dm_constant.py
Resource    login_logout_keywords.robot

*** Keywords ***
add_product_to_cart
    ${rand}    select_random_number    
    ${a}    Get Text    (//div[@class='inventory_item_name'])[${rand}] 
    ${b}    Get Text    (//div[@class='inventory_item_price'])[${rand}]
    Scroll Element Into View    (//button[contains(text(),'Add to cart')])[${rand}]
    Click Element    (//button[contains(text(),'Add to cart')])[${rand}]
    Wait Until Element Is Visible    ${remove_cart_btn}    ${wait_mid}
    ${c}    Get Text    ${remove_cart_btn}
    Should Be Equal    ${c}    ${Remove} 
    Click Element    ${cart_btn}
    ${d}    Get Text    ${cart_item_name}
    ${e}    Get Text    ${cart_item_price}
    Should Be Equal    ${a}    ${d}    
    Should Be Equal    ${b}    ${e} 
    Wait Until Element Is Visible    ${remove_cart_btn}    ${wait_mid}
    Click Button    ${remove_cart_btn}

