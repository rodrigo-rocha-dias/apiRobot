*** Settings ***
Library    RequestsLibrary
Resource   ../resources/viacep_keywords.robot

*** Test Cases ***
Validar retorno de um cep valido
    [Documentation]    Valida que a API retorna os dados corretos para um CEP válido
    Given que faca a chamada para consultar o cep    09250300
    When obter o codigo de resposta    200
    Then sera retornado o logradouro esperado    ${response}    Avenida Sapopemba    "11"

#Validar retorno de um cep com formato invalido
#    [Documentation]    Valida que a API retorna erro para um CEP com formato inválido
#    Given que faca a chamada para consultar o cep    123456
#    When obter o codigo de resposta    400
#    Then validar mensagem de erro no response    "Bad Request"

#Validar retorno de um cep inexistente
#    [Documentation]    Valida que a API retorna erro para um CEP que não existe
#    Given que faca a chamada para consultar o cep    99999999
#    When obter o codigo de resposta    404
#    Then validar mensagem de erro no response    "CEP não encontrado"

#Validar retorno de um cep com caracteres especiais
#    [Documentation]    Valida que a API retorna erro para um CEP com caracteres especiais
#    Given que faca a chamada para consultar o cep    abc12345
#    When obter o codigo de resposta    400
#    Then validar mensagem de erro no response    "Bad Request"

Validar contrato
    [Documentation]    Valida se o response está conforme o contrato esperado
    Given que faca a chamada para consultar o cep    09250300
    When obter o codigo de resposta    200
    Then validar contrato do response    ${response}
