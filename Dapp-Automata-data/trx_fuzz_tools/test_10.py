from modules.BazaarItemListing.BazaarItemListing import ItemListing,Bazzar
from map import load_account_data_from_json
from modules.random.data_generate import *

address_to_private_key, private_key_to_address = load_account_data_from_json("account.json")

with open("deployer/10BazzarItemListing.txt", "r") as file:
    data_list = [line.strip() for line in file]


test_flag = True
op_num = 0

for i in data_list:
    req1 = Bazzar(i,address_to_private_key["0x3F8306Adf9DDa2E06Fd068CA44220756d9FDeF65"],"0x3F8306Adf9DDa2E06Fd068CA44220756d9FDeF65")
    addressa = req1.InstancePartyA()
    addressb = req1.InstancePartyB()
    if test_flag:
        while op_num !=100:
            r_number1 = generate_random_number(0,2)
            if r_number1 == 0:
                r_number2 = generate_random_number(0,1)
                if r_number2 == 0:
                    req1.UpdateBalance(addressa,addressb,generate_random_number(1,10))
                else:
                    req1.UpdateBalance(addressb,addressa,generate_random_number(1,10))
                op_num += 1
            elif r_number1 == 1:
                req2 = Bazzar(i,address_to_private_key["0x7A4f14dcF116DDFAeB08E9E3E4615937FDd24621"],"0x7A4f14dcF116DDFAeB08E9E3E4615937FDd24621")
                req2.ListItem(generate_random_string(generate_random_number(1,10)),generate_random_number(1,10))
                op_num+=1
            else:
                if req1.currentItemListing() != "0x0000000000000000000000000000000000000000":
                    r_number2 = generate_random_number(0,1)
                    if r_number2 == 0:
                        req2 = ItemListing(req1.currentItemListing(),address_to_private_key["0x666474a318918123e27b9d6f1283528C88f97827"],"0x666474a318918123e27b9d6f1283528C88f97827")
                        req2.BuyItem()
                    else:
                        req2 = ItemListing(req1.currentItemListing(),address_to_private_key["0x934e8d68E0b5B49054dad167564A4E044F4aDF58"],"0x934e8d68E0b5B49054dad167564A4E044F4aDF58")
                        req2.BuyItem()
                    op_num+=1
            print(i,op_num)
        op_num = 0

    else:
        print(req1.State())