from modules.BasicProvenance.BasicProvenance import BasicProvenance
from map import load_account_data_from_json
from modules.random.data_generate import *

test_flag = False

with open("deployer/3BasicProvenance.txt", "r") as file:
    data_list = [line.strip() for line in file]

address_to_private_key, private_key_to_address = load_account_data_from_json("account.json")

for i in data_list:
    if test_flag:
        while True:
            req1 = BasicProvenance(i,address_to_private_key["0x934e8d68E0b5B49054dad167564A4E044F4aDF58"],"0x934e8d68E0b5B49054dad167564A4E044F4aDF58")

            if req1.get_state() == 2:
                break
            r_number = generate_random_number(0,1)
            if r_number == 0:
                req2_address = req1.get_counterparty()
                req2_key = address_to_private_key[req2_address]
                req2 = BasicProvenance(i,str(req2_key),str(req2_address))
                random_address = random.choice(list(address_to_private_key.keys()))
                req2.TransferResponsibility(str(random_address))
            elif r_number == 1:
                req1.Complete()
                break
            if req1.get_state() == 2:
                break
        print(i)
    else:
        req1 = BasicProvenance(i,address_to_private_key["0x934e8d68E0b5B49054dad167564A4E044F4aDF58"],"0x934e8d68E0b5B49054dad167564A4E044F4aDF58")
        print(req1.get_state())