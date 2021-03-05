*** Variables ***

${SalesForce_URL}           https://login.salesforce.com
${UserName}                 taniya.dey-1452066749@vlocityapps.com
${Password}                 Vlocity1234
${Account_URL}              https://knowledge-web-14204.lightning.force.com/lightning/r/Account/0014x000009sUZOAA2/view
${Account}                  John Smith
${ContractName}             Test_Contract
${Browser}                  Firefox

${UserName_Loc}             //input[@id='username']
${Password_Loc}             //input[@id='password']
${Login_Loc}                //input[@id='Login']
${Frame_Loc}                //iframe[@id='iFrameResizer0']
${ContractPage_Frame}       //iframe[@id='iFrameResizer1']
${RenewContract}            //a[contains(.,'Renew Contract')]
${Title_Loc}                //div/section[@id="CreateNew"]/section/div/div/div/h1
${ContractName_Loc}         //input[@id='ContractName']
${Term_Loc}                 //select[@name='loopname']
${Done_Loc}                 //p[text()='Done']
${ContractNumber_Loc}       //div[@class='slds-page-header__title slds-m-right--small slds-align-middle clip-text slds-line-clamp']/span
${Validate_Account_Loc}     //span[@title='Account Name']//following::a[1]
${Validate_Status_Loc}      //span[@title='Status']//following::span[1]
${Validate_Term_Loc}        //span[@title='Contract Term (months)']//following::span[1]
${Error_loc}                //p[text()='Error : Please fix all the fields with errors.']
${alert-ok-button_loc}          //button[@id='alert-ok-button']
${User_loc}                     //img[@title='User']
${logout_loc}                   //div[@class='profile-card-indent']/div/a[2]
${error_message_loc}        //div[@class='error']/small
${error_message}            Choose a valid contract status and save your changes. Ask your admin for details.

