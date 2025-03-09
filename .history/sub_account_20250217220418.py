import time
import hmac
import hashlib
import requests

# Replace with your actual API credentials
API_KEY = 'YOUR_API_KEY'
SECRET_KEY = 'YOUR_SECRET_KEY'

BASE_URL = "https://api.binance.com"

def sign_request(params: dict) -> str:
    """Generate HMAC SHA256 signature."""
    query_string = '&'.join([f"{key}={value}" for key, value in params.items()])
    return hmac.new(SECRET_KEY.encode(), query_string.encode(), hashlib.sha256).hexdigest()

def get_virtual_sub_account_info():
    # Example endpoint (please verify the correct endpoint from Binance documentation)
    endpoint = "/sapi/v1/sub-account/virtual-subaccount"
    params = {
        "timestamp": int(time.time() * 1000)
    }
    params["signature"] = sign_request(params)
    headers = {
        "X-MBX-APIKEY": API_KEY
    }
    response = requests.get(BASE_URL + endpoint, params=params, headers=headers)
    return response.json()

if __name__ == "__main__":
    info = get_virtual_sub_account_info()
    print(info)
