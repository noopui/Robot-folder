*** Settings ***
Library      SeleniumLibrary
Suite Setup  Go to login page



*** Variables ***
${URL}              https://www.saucedemo.com/
${BROWSER}          Chrome
${USERNAME}         standard_user
${PASSWORD}         secret_sauce
${INVAL_USERNAME}   user01
${INVAL_PASSWORD}    pass02
${HEADER}           Products

*** Test Cases ***

Login with correct password and correct username
    Log in with credentials     ${USERNAME}         ${PASSWORD}
    Page Should Contain         ${HEADER} 
    Log out


Login with incorrect password but correct username
    Log in with credentials     ${USERNAME}         ${INVAL_PASSWORD}
    Page Should Contain     Username and password do not match any user in this service


Login with correct password but incorrect username
    Log in with credentials     ${INVAL_USERNAME}     ${PASSWORD}
    Page Should Contain     Username and password do not match any user in this service


Login with incorrect password and incorrect username
    Log in with credentials     ${INVAL_USERNAME}     ${INVAL_PASSWORD}
    Page Should Contain     Username and password do not match any user in this service


*** Keywords ***

Go to login page
    Open Browser    ${URL}    ${BROWSER}

Log in with credentials 
    [Arguments]             ${username}     ${password}
    Input Text              id=user-name    ${username}   
    Input Text              id=password     ${password}   
    Click Element           id=login-button

Log out
    Click Element                       class:bm-burger-button
    Wait until Element Is Visible       id=logout_sidebar_link
    Click Element                       id=logout_sidebar_link



   





