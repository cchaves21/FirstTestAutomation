*** Settings ***
Library  SeleniumLibrary 

*** Variables ***
${URL}    http://automationpractice.com
${BROWSER}    chrome

*** Keyword ***
#### SETUPS and Teardown
Abrir navegador
  Open BROWSER    ${URL}  ${BROWSER}

Fechar navegador
  Clese BROWSER

#### Passo-a-passo
Dado que estou na página home do site
  Title Shoud Be    My Store