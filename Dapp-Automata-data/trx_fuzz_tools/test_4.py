from modules.SimpleMarketplace.SimpleMarketplace import SimpleMarketplace
from map import load_account_data_from_json
from modules.random.data_generate import *

address_to_private_key, private_key_to_address = load_account_data_from_json("account.json")

with open("deployer/4simplemarket.txt", "r") as file:
    data_list = [line.strip() for line in file]

test_flag = False
for i in data_list:
    if test_flag:
        req1 = SimpleMarketplace(i,address_to_private_key['0x3F8306Adf9DDa2E06Fd068CA44220756d9FDeF65'],"0x3F8306Adf9DDa2E06Fd068CA44220756d9FDeF65")
        while req1.State() != 2:
            r_number = generate_random_number(0,2)
            if r_number == 0:
                if req1.State() == 0:
                    random_address = random.choice(list(address_to_private_key.keys()))
                    while random_address == "0x3F8306Adf9DDa2E06Fd068CA44220756d9FDeF65":
                        random_address = random.choice(list(address_to_private_key.keys()))
                    req2 = SimpleMarketplace(i,address_to_private_key[random_address],random_address)
                    req2.MakeOffer(generate_random_number(1,1000))
            elif r_number == 1:
                if req1.State() == 1:
                    req1.Reject()
                else:
                    continue
            else:
                req1.AcceptOffer()
        print(i)
    else:
        req1 = SimpleMarketplace(i,address_to_private_key['0x3F8306Adf9DDa2E06Fd068CA44220756d9FDeF65'],"0x3F8306Adf9DDa2E06Fd068CA44220756d9FDeF65")
        print(req1.State())