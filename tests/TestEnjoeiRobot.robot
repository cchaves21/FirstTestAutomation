*** Settings ***
Resource  /home/chaves/workspace/RobotFrameWork/FirstTestAutomation/resources/Resource.robot

### SETUP roda uma keyword antes de uma suite ou de um teste
Test Setup  Abrir navegador
### TEARDOWN ele roda uma keyword depois de uma suite ou um teste
Test Teardown  Fechar navegador 

*** Variables ***
${URL}        https://enjoei:gtvVGvtzs4bACM4xPyM3SNQvnizGqQ6t@next.enjoei.com.br
${BROWSER}    chrome

*** Test Cases ***
Cenário 01: Pesquisar produto existente
    Dado que estou na página home do site com o titulo "Enjoei - Queredores Quererão | Enjoei"
    Quando pesquiso pela lojinha "enjoei pro"
    Então a lojinha "enjoei pro" deve ser listado na página de resultado da busca