*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
Library    ../libraries/api_viacep.py

*** Keywords ***
que faca a chamada para consultar o cep
    [Arguments]    ${cep}
    ${status_code}    ${response}    Consultar Cep    ${cep}
    Set Test Variable    ${status_code}
    Set Test Variable    ${response}

obter o codigo de resposta
    [Arguments]    ${status_code_esperado}
    Should Be Equal As Numbers    ${status_code}    ${status_code_esperado}

sera retornado o logradouro esperado
    [Arguments]    ${response}    ${logradouro_esperado}    ${ddd_esperado}
    ${logradouro_real}    Strip String    ${response["logradouro"]}
    ${logradouro_esperado}    Strip String    ${logradouro_esperado}
    Should Be Equal As Strings    ${logradouro_real}    ${logradouro_esperado}

validar mensagem de erro no response
    [Arguments]    ${mensagem_esperada}
    Log    ${response}
    ${mensagem_real}    Get From Dictionary    ${response}    "erro"
    Should Be Equal As Strings    ${mensagem_real}    ${mensagem_esperada}

validar contrato do response
    [Arguments]    ${response}
    Log    ${response}

    ${campos_esperados}    Create Dictionary
    ...    cep=str
    ...    logradouro=str
    ...    bairro=str
    ...    localidade=str
    ...    uf=str
    ...    ddd=str

    FOR    ${campo}    IN    @{campos_esperados.keys()}
        ${tipo_esperado}    Get From Dictionary    ${campos_esperados}    ${campo}
        Should Contain    ${response}    ${campo}
        ${valor}    Get From Dictionary    ${response}    ${campo}
        Run Keyword If    "${tipo_esperado}" == "str"    Should Be String    ${valor}
    END
