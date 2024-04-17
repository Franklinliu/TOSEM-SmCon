from modules.RefrigeratedTransportation.RefrigeratedTransportation import RefrigeratedTransportation
from map import load_account_data_from_json
from modules.random.data_generate import *

address_to_private_key, private_key_to_address = load_account_data_from_json("account.json")

with open("deployer/11RefrigeratedTransportation.txt", "r") as file:
    data_list = [line.strip() for line in file]


test_flag = True

for i in data_list:

    req1 = RefrigeratedTransportation(i,address_to_private_key["0x3F8306Adf9DDa2E06Fd068CA44220756d9FDeF65"],"0x3F8306Adf9DDa2E06Fd068CA44220756d9FDeF65")

    if test_flag:
        while req1.State() < 2:
            r_number = generate_random_number(0,2)
            if r_number == 0:
                Device = req1.Device()
                req2 = RefrigeratedTransportation(i,address_to_private_key[Device],Device)
                req2.IngestTelemetry(generate_random_number(1,1000),generate_random_number(1,1000),generate_random_number(1,1000))
            elif r_number == 1:
                Counterparty = req1.Counterparty()
                req2 = RefrigeratedTransportation(i,address_to_private_key[Counterparty],Counterparty)
                random_address = random.choice(list(address_to_private_key.keys()))
                while random_address == req1.Device():
                    random_address = random.choice(list(address_to_private_key.keys()))
                req2.TransferResponsibility(random_address)
            else:
                req2 = RefrigeratedTransportation(i,address_to_private_key["0x606Ec1CA1C986462C52bDE7Bb7F694DB08c1Af72"],"0x606Ec1CA1C986462C52bDE7Bb7F694DB08c1Af72")
                req2.Complete()
        print(i)
    else:
        print(req1.State())
