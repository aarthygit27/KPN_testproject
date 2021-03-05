*** Settings ***

Resource          ../Resources/Keywords.robot
Resource          ../Resources/Variables.robot
Test Setup        Open Browser And Login to Salesforce
Test Teardown     Logout and Close Browser


*** Test Cases ***

TC01_RenewContract-Positive
    [Documentation]     Renew Contract with draft status and term 1 year and validate the contract created in draft sttaus
    [Tags]          Task
    ${Term}   Set Variable   12
    ${Status}   Set Variable    Draft
    Go To Account Page
    Click on Renew Contract
    Fill Contract Form   ${Term}   ${Status}

TC02_RenewContract-ErrorValidation
    [Documentation]     Renew Contract with Status Draft and Term 2 years and validate the error
    [Tags]          Task
    ${Term}   Set Variable   24
    ${Status}   Set Variable    Signed
    Go To Account Page
    Click on Renew Contract
    Fill Contract Form   ${Term}   ${Status}

TC03_RenewContract
    [Documentation]     Includes both test cases to renew contract using Data Driven Technique
    [Tags]          Task
    [Template]      Renew Contract
    12  Draft
    24  Signed



