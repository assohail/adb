import time
import hmac
import hashlib
import requests

# Replace with your actual API credentials
API_KEY = 'sXHtiMqutzi3W55IkOwEpH5jxxVt57LnMxocPsfCxcZdXCHcG8Vkt4c9ij0GiOJI'
SECRET_KEY = 'k57QpClVeTdTewwZhLgJ6WbZHTHRlzDaoNrD3OxZPI5NIQC1tVI4aBt7Ln19OkRB'

BASE_URL = "https://api.binance.com"

def sign_request(params: dict) -> str:
    """Generate HMAC SHA256 signature."""
    query_string = '&'.join([f"{key}={value}" for key, value in params.items()])
    return hmac.new(SECRET_KEY.encode(), query_string.encode(), hashlib.sha256).hexdigest()

def get_virtual_sub_account_info():
    endpoint = "/sapi/v1/sub-account/virtual-subaccount"  # Verify this is the correct endpoint!
    params = {
        "timestamp": int(time.time() * 1000)
    }
    params["signature"] = sign_request(params)
    headers = {
        "X-MBX-APIKEY": API_KEY
    }
    response = requests.get(BASE_URL + endpoint, params=params, headers=headers)
    
    # Debug prints:
    print("Status Code:", response.status_code)
    print("Response Headers:", response.headers)
    print("Response Text:", response.text)
    
    try:
        return response.json()
    except Exception as e:
        print("Error decoding JSON:", e)
        return None

if __name__ == "__main__":
    info = get_virtual_sub_account_info()
    print(info)



