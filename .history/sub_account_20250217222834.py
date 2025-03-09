import time
import hmac
import hashlib
import requests

# Replace with your actual API credentials
API_KEY = 'sXHtiMqutzi3W55IkOwEpH5jxxVt57LnMxocPsfCxcZdXCHcG8Vkt4c9ij0GiOJI'
SECRET_KEY = 'k57QpClVeTdTewwZhLgJ6WbZHTHRlzDaoNrD3OxZPI5NIQC1tVI4aBt7Ln19OkRB'

def sign_request(params: dict) -> str:
    """
    Generate HMAC SHA256 signature.
    Note: Sorting the parameters may be required for some APIs.
    """
    # Optional: Sort the parameters by key if needed
    query_string = '&'.join([f"{key}={value}" for key, value in params.items()])
    signature = hmac.new(SECRET_KEY.encode(), query_string.encode(), hashlib.sha256).hexdigest()
    return signature

def get_virtual_sub_account_info():
    # Update the endpoint if needed based on Binance's latest documentation.
    endpoint = "/sapi/v1/sub-account/virtual-subaccount"
    params = {
        "timestamp": int(time.time() * 1000)
    }
    
    # Generate the signature and add it to the parameters
    params["signature"] = sign_request(params)
    
    headers = {
        "X-MBX-APIKEY": API_KEY
    }
    
    response = requests.get(BASE_URL + endpoint, params=params, headers=headers)
    
    # Debug prints:
    print("Status Code:", response.status