import requests

BASE_URL = "https://viacep.com.br/ws"

def Consultar_Cep(cep):
    url = f"{BASE_URL}/{cep}/json"
    response = requests.get(url)
    return response.status_code, response.json()
