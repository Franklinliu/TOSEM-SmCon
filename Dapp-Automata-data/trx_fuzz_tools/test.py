from modules.BasicProvenance.BasicProvenance import BasicProvenance
from map import load_account_data_from_json
from modules.random.data_generate import *

with open("deployer/3BasicProvenance.txt", "r") as file:
    data_list = [line.strip() for line in file]

address_to_private_key, private_key_to_address = load_account_data_from_json("account.json")
random_address = random.choice(list(address_to_private_key.keys()))
print(random_address)