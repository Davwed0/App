import requests

BASE_URL = "http://127.0.0.1:5000/"

while (True):
    response = input("request: ")
    if response == "Q": break
    response_type = input("request type: ")
    if response_type == "post":
        response = requests.post(BASE_URL + "notes/" + response)
    elif response_type == "get":
        response = requests.get(BASE_URL + "notes/" + response)
    elif response_type == "put":
        response = requests.put(BASE_URL + "notes/" + response)
    elif response_type == "delete":
        response = requests.delete(BASE_URL + "notes/" + response)
    print(response.json())