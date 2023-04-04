*** Settings ***
Library     SeleniumLibrary
Library    Collections
Variables    ../Locators/Login_locators.py
Variables    ../Locators/General_locators.py
Variables    ../Locators/Cart_locators.py
Variables    ../Locators/Sort_locators.py
Variables    ../Constants/dm_constant.py

*** Keywords ***
sort_a_to_z
    Click Element    ${sort_btn}    
    Wait Until Element Is Visible    ${sort_az}    
    Click Element    ${sort_az} 
    Press Keys    None    ESC
    ${abc}    Create List
    ${bca}    Create List
    FOR    ${counter}    IN RANGE    1   7    
        ${a}    Get Text    (//div[@class='inventory_item_name'])[${counter}]   
        Append To List    ${abc}    ${a}
    END
    ${bca}    Copy List   ${abc} 
    Sort List    ${abc}
    Should Be Equal    ${bca}    ${abc} 

sort_z_to_a
    Click Element    ${sort_btn}    
    Wait Until Element Is Visible    ${sort_za}    
    Click Element    ${sort_za} 
    Press Keys    None    ESC
    ${abc}    Create List
    ${bca}    Create List
    FOR    ${counter}    IN RANGE    1   7    
        ${a}    Get Text    (//div[@class='inventory_item_name'])[${counter}]   
        Append To List    ${abc}    ${a}
    END
    ${bca}    Copy List   ${abc} 
    Sort List    ${abc}
    Reverse List    ${abc}
    Should Be Equal    ${bca}    ${abc} 

sort_low_to_high
    Set Log Level    NONE
    #this will hide the xpath from the result.
    Click Element    ${sort_btn} 
    Set Log Level    INFO     
    Wait Until Element Is Visible    ${sort_lohi}    
    Click Element    ${sort_lohi} 
    Press Keys    None    ESC
    ${abc}    Create List
    ${bca}    Create List
    FOR    ${counter}    IN RANGE    1   7    
        ${a}    Get Text    (//div[@class='inventory_item_price'])[${counter}]   
        Append To List    ${abc}    ${a}
    END
    ${bca}    Copy List   ${abc}  
    ${r1}    reg_exp    ${bca} 
    ${r2}    reg_exp    ${abc} 
    Sort List    ${r1}
    Should Be Equal    ${r1}    ${r2} 

sort_high_to_low
    Click Element    ${sort_btn}    
    Wait Until Element Is Visible    ${sort_hilo}    
    Click Element    ${sort_hilo} 
    Press Keys    None    ESC
    ${abc}    Create List
    ${bca}    Create List
    FOR    ${counter}    IN RANGE    1   7    
        ${a}    Get Text    (//div[@class='inventory_item_price'])[${counter}]   
        Append To List    ${abc}    ${a}
    END
    ${bca}    Copy List   ${abc}  
    ${r1}    reg_exp    ${bca} 
    ${r2}    reg_exp    ${abc} 
    Sort List    ${r1}
    Reverse List   ${r1}
    Should Be Equal    ${r1}    ${r2} 