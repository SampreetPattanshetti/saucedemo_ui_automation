*** Settings ***
Library     SeleniumLibrary
Library    RequestsLibrary
Library    Collections
Library    String
Resource    ../Resources/login_logout_keywords.robot
Resource    ../Resources/sort_keywords.robot
Resource    ../Resources/cart_keywords.robot
Library    ../Resources/python.py
Library    ../Resources/decrypt_password.py
Variables    ../Locators/Login_locators.py
Variables    ../Locators/General_locators.py
Variables    ../Locators/Cart_locators.py
Variables    ../Locators/Sort_locators.py
Variables    ../Constants/dm_constant.py

Test Setup    login
Test Teardown    logout

*** Test Cases ***
sort_functionality
    # sort_a_to_z
    # sort_z_to_a
    sort_low_to_high
    # sort_high_to_low
    
    
# cart_functionality
#     add_product_to_cart
    
    


