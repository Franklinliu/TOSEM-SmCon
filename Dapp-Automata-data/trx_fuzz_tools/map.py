import json

def load_account_data_from_json(file_path):
    with open(file_path, 'r') as json_file:
        data = json.load(json_file)
        address_to_private_key = {}  
        private_key_to_address = {}  
        
        for account in data["accounts"]:
            address = account["address"]
            private_key = account["private_key"]
            
            address_to_private_key[address] = private_key
            private_key_to_address[private_key] = address
            
        return address_to_private_key, private_key_to_address

