*** Settings ***
Library           SeleniumLibrary
Library           String
Library           Screenshot
Resource          Variables.robot

*** Keywords ***

Open Browser And Login to Salesforce
    Open Browser   ${SalesForce_URL}     ${Browser}
    Maximize Browser Window
    Login Into Salesforce

Login Into Salesforce
    Wait until element is visible   ${UserName_Loc}     10s
    Input Text  ${UserName_Loc}  ${UserName}
    Input Text  ${Password_Loc}  ${Password}
    Click Element   ${Login_Loc}

Go To Account Page
    Go to   ${Account_URL}
    Wait Until Page Contains    ${Account}  20s

Renew Contract
    [Documentation]     Complete Renew Contract flow to use in data driven template
    [Arguments]    ${Term}    ${Contract_status}
    Log to Console      Starting Test case with term ${Term} and Contract Status ${Contract_status}
    Go To Account Page
    Click on Renew Contract
    Fill Contract Form   ${Term}   ${Contract_status}

Click on Renew Contract
    [Documentation]     Click Renew Contract and validate the page loaded
    Wait until element is visible   ${Frame_Loc}    timeout=20
    Select frame   ${Frame_Loc}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Enabled    ${RenewContract}    10s
    Force click element   ${RenewContract}
    Unselect frame
    Wait until page contains element  ${ContractPage_Frame}    timeout=20
    Select frame    ${ContractPage_Frame}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Enabled    ${Title_Loc}     10s
    Run Keyword if   ${status}   Log    "Inside page CREATE NEW CONTRACT"


Fill Contract Form
    [Documentation]     Fill all required details to create contract with passed term and Status Value. If correct Values are passed next page will be loaded. Else Error will be thrown.
    [Arguments]    ${Term}    ${Contract_status}
    ${Term_Value}    set variable    //select[@name='loopname']/option[@value='${Term}']
    ${Status_Loc}    set variable    //input[@value='${Contract_status}']
    ${status}    Run Keyword And Return Status    Wait Until Element Is Enabled    ${ContractName_Loc}   10s
    ${status}   Force click element   ${ContractName_Loc}
    Input Text   ${ContractName_Loc}   ${ContractName}
    Click element   ${Term_Loc}
    Click element   ${Term_Value}
    Wait Until Element Is Enabled    //input[@value='${Contract_status}']   10s
    Force click element   ${Status_Loc}
    Click element   ${Done_Loc}
    ${status}   Run Keyword and Return Status    Wait until element is visible   ${Error_loc}
    Run Keyword if   ${status}   Error Validation
    ...    ELSE    Validate Contract  ${Term}  ${Contract_status}

Validate Contract
    [Documentation]     Validate Contract Created
    [Arguments]    ${Term}    ${Contract_status}
    Unselect frame
    #Wait Until Element Is Visible     ${ContractNumber_Loc}
    ${Contract_Number}   Get Text  ${ContractNumber_Loc}
    ${Validate_Account}  Get Text   ${Validate_Account_Loc}
    ${Validate_Status}   Get Text  ${Validate_Status_Loc}
    ${Validate_Term}     Get Text  ${Validate_Term_Loc}
    Log    Contract Number Is ${Contract_Number}
    Capture Page Screenshot
    Should be equal   ${Validate_Account}     ${Account}
    Log   Contract is created for account ${Validate_Account}
    Element Text should be   ${Validate_Status_Loc}     ${Contract_status}
    Log     Status of the Contract is ${Validate_Status}
    Element Text should be      ${Validate_Term_Loc}    ${Term}
    Log     Contract Term is ${Validate_Term}

Error Validation
    [Documentation]     Validate the error thrown while creating contract
    ${Error}    Get Text    ${Error_loc}
    Log  ${Error}
    Capture Page Screenshot
    Click element   ${alert-ok-button_loc}
    Element Text should be      ${error_message_loc}    ${error_message}
    ${Validate Error Message}   Get text    ${error_message_loc}
    Log     Error message is "${Validate Error Message}"
    Capture Page Screenshot
    Unselect Frame


Force click element
    [Documentation]     Javascript Code to overcome the element interception issue
    [Arguments]    ${elementToClick}
    ${element_xpath}=    Replace String    ${elementToClick}    \"    \\\"
    Execute JavaScript    document.evaluate("${element_xpath}", document, null, XPathResult.ORDERED_NODE_SNAPSHOT_TYPE, null).snapshotItem(0).click();
    sleep  1s

Logout and Close Browser
    [Documentation]    General logout keyword for test teardowns
    Page should contain element     ${User_loc}
    Force Click element  ${User_loc}
    Click element  ${logout_loc}
    Close Browser



