import requests

search_rm_url = "https://rickandmortyapi.com/api/character"
search_url = "https://nominatim.openstreetmap.org/search"

def get_all_rm_characters():
    count_characters = 0
    # 43 - это страницы
    for i in range(1, 43):
        params = {
            "page": i,
            "format": 'json'
        }
        response = requests.get(url=search_rm_url, params=params)
        result = response.json()
        if response.ok:
            count_characters += len(result['results'])
    return count_characters


def get_adress_by_name(city, streetname, housenumber):
    params = {
        "city": city,
        "streetname": streetname,
        "housenumber": housenumber,
        "format": 'json'
    }
    response = requests.get(url=search_url,
                           params=params)
    result = response.json()
    if response.ok:
        return result[0]


def get_adress_by_coordinates(latitude, longitude):
    coordinates = latitude + "," + longitude
    params = {
        "q": coordinates,
        "format": 'json'
    }
    response = requests.get(url=search_url,
                           params=params)
    result = response.json()
    if response.ok:
        return result[0]