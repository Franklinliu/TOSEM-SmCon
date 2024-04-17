import json

data = {
    "contract_address": "0x520EBbBe4B76a1F4f474389beB6D817cf09fe8B1",
    "requestor_address": "0x606Ec1CA1C986462C52bDE7Bb7F694DB08c1Af72",
    "private_key": "844f6b17c5199c063c4f27eb2b6410660a142391277155f90b393b0fc43a17f5"
}

json_data = json.dumps(data, indent=4)

print(json_data)

