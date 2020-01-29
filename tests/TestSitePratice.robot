*** Settings ***
Resource  /home/chaves/workspace/RobotFrameWork/FirstTestAutomation/resources/Resource.robot

### SETUP roda uma keyword antes de uma suite ou de um teste
Test Setup  Abrir navegador
### TEARDOWN ele roda uma keyword depois de uma suite ou um teste
Test Teardown  Fechar navegador 

*** Variables ***
${URL}    http://automationpractice.com
${BROWSER}    chrome

*** Test Cases ***
Cenário 01: Pesquisar produto existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto "Blouse" deve ser listado na página de resultado da busca

#Cenário 02: Pesquisar produto não existente
#Dado que estou na página home do site
    #Dado que estou na página home do site
    #Quando eu pesquisar pelo produto "ItemNâoExistente"
    #Então a página deve exibir a mensagem no result were found for you search "ItemNâoExistente"
