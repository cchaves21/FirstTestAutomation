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
  Close BROWSER

#### Passo-a-passo
Dado que estou na página home do site com o titulo "${title}"
  Title Should Be  ${title}

Quando eu pesquisar pelo produto "${PRODUTO}"
  Input Text      id=search_query_top   ${PRODUTO}
  Click Button    name=submit_search

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
  Wait Until Element is Visible   css=#center_column > h1
  Title Should Be                 Search - My Store
  Page Should Contain Image       xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
  Page Should Contain Link        xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),"${PRODUTO}")]
  Page Should Contain Element     xpath=//*[@id="center_column"]//a[@title="Add to cart"]

Então a página deve exibir a mensagem no result were found for you search "${PRODUTO}"
  Title Should Be                 Search - My Store
  Page Should Contain Element     xpath=//*[@id="center_column"]/p[@class="alert alert-warning"][contains(text(),"${PRODUTO}")]

Quando pesquiso pela lojinha "${LOJINHA}"
  Click Button  xpath=//*[@class="c-modal__content"]//button[@aria-label="Fechar"]
  Input Text    name=query  ${LOJINHA}
  Click Button  xpath=//*[@class="c-header-search__context-selector"]//button[2]
  Press Keys    name=query    ENTER

Então a lojinha "${LOJINHA}" deve ser listado na página de resultado da busca
  Wait Until Element is Visible   xpath=//*[@class="User-List"]
  Page Should Contain Element     xpath=//*[@class="User-List__title"][contains(text(),"${LOJINHA}")]