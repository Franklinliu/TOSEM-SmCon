from modules.assettransfer.assettransfer import AssetTransfer
from map import load_account_data_from_json
from modules.random.data_generate import *

address_to_private_key, private_key_to_address = load_account_data_from_json("account.json")

with open("deployer/2assettransfer.txt", "r") as file:
    data_list = [line.strip() for line in file]

test_flag = True

op_num = 0

for i in data_list:
    req1 = AssetTransfer(i,address_to_private_key["0x3F8306Adf9DDa2E06Fd068CA44220756d9FDeF65"],"0x3F8306Adf9DDa2E06Fd068CA44220756d9FDeF65")
    if test_flag:
        while req1.get_state() != 9:
            op_num +=1
            print(i,op_num)
            r_number = generate_random_number(0,9)
            if op_num == 300:
                req1.Terminate()
                op_num = 0
            if r_number == 0:
                #req1.Terminate()
                pass
            elif r_number == 1:
                if req1.get_state() == 0:
                    req1.Modify(generate_random_string(generate_random_number(1,10)),generate_random_number(1,100))
                    #op_num +=1
            elif r_number == 2:
                if req1.get_state() == 1:
                    req1.AcceptOffer()
                    #op_num += 1
            elif r_number == 3:
                if req1.get_state() == 2 or req1.get_state() == 4:
                    req1.MarkInspected()
                    #op_num += 1
            elif r_number == 4:
                if req1.get_state() == 2 or req1.get_state() == 3:
                    req1.MarkAppraised()
            elif r_number == 5:
                if req1.get_state() in [1,2,3,4,5,7]:
                    req1.RescindOffer()
            elif r_number == 6:
                if req1.get_state() in [1,2,3,4,5,6]:
                    req1.Reject()
            elif r_number == 7:
                if req1.get_state() == 1 and req1.get_OfferPrice != 0:
                    req1.ModifyOffer(generate_random_number(1,100))
            elif r_number == 8:
                if req1.get_state() == 1:
                    req1.MakeOffer("0x606Ec1CA1C986462C52bDE7Bb7F694DB08c1Af72","0x03Db6D217C76E42138A1d8125c9e06eD591e08b2",generate_random_number(1,100))

            else:
                r_number2 = generate_random_number(0,1)
                if req1.get_state() != 5 and req1.get_state() != 6 and req1.get_state() != 7:
                    continue
                if req1.get_InstanceBuyer() == "0x0000000000000000000000000000000000000000":
                    continue
                
                if req1.get_state() == 6:
                    req2 = AssetTransfer(i,address_to_private_key[req1.get_InstanceBuyer()],req1.get_InstanceBuyer())
                    req2.Accept()
                elif req1.get_state() == 7:
                    req1.Accept()
                else:
                    if r_number2 == 0:
                        req1.Accept()
                    else:
                        req2 = AssetTransfer(i,address_to_private_key[req1.get_InstanceBuyer()],req1.get_InstanceBuyer())
                        req2.Accept() 

    else:
        print(i)