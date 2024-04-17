import json
from map import load_account_data_from_json
from modules.helloblockchain.helloblockchain import HelloBlockchain
from modules.random.data_generate import *
from modules.RoomThermostat.RoomThermostat import RoomThermostat
from modules.PingPongGame.PingPongGame import Starter
from modules.DigitalLocker.DigitalLocker import DIgitalLocker


address_to_private_key, private_key_to_address = load_account_data_from_json("account.json")

def main():
    print("Input test_id to fuzz the contract:\n 1.HelloBlockchain \n 2.AssetTransfer \n 3.BasicProvenance \n 4.SimpleMarketplace \n 5.DigitalLocker \n 6.DefectiveComponentCounter \n 7.RoomThermostat \n 8.FrequentFlyerRewardsCalculator \n 9.PingPongGame \n 10.BazaarItemListing \n 11.RefrigeratedTransportation \n")
    test_id = eval(input("Test id:"))

    if test_id == 1:
        filename = "data/helloblockchain/helloblockchain.json"
        with open(filename, "r") as json_file:
            data = json.load(json_file)

        requestor_call = HelloBlockchain(data["contract_address"], data['requestor_private_key'], data['requestor_address'])
        non_requestor_call = HelloBlockchain(data["contract_address"], data['non_request_private_key'], data['non_request_address'])

        while True:
            random_bit = generate_random_number(0, 3) 
            if random_bit == 0:
                print(requestor_call.send_request(generate_random_string(generate_random_number(1, 100))))
                print(requestor_call.get_request_message())
            if random_bit == 1:
                print(requestor_call.send_response(generate_random_string(generate_random_number(1, 100))))
                print(requestor_call.get_response_message())
            else:
                print(non_requestor_call.send_response(generate_random_string(generate_random_number(1, 100))))
                print(non_requestor_call.get_response_message())

    if test_id == 2:
        print("TBD")

    if test_id == 3:
        print("Done see data")
    
    if test_id == 4:
        print("Done see data")

    if test_id == 5:
        """
        while True:
            owner_contract = DIgitalLocker("0x38c2af432D0Aa8eE1e1ee0A76d5Bb1469b621812","5a6ba72f303f14aef83570587c966fcbee07c70b615e9304c127f6ace21c5e38","0x666474a318918123e27b9d6f1283528C88f97827");
            agent_contract = DIgitalLocker("0x38c2af432D0Aa8eE1e1ee0A76d5Bb1469b621812","da051548548d448882110f5889ed7579475cbeb32ee53042a716aeb512359a50","0x35fA38D6e01F98B5e9f7672b0294177388BB381e");
            random_bit = generate_random_number(0, 10)
            if random_bit == 0:
        """
    if test_id == 6:
        print("Done see data")

    if test_id == 7:
        while True:
            contract_caller = RoomThermostat("0xf7FAB9ecf9BF6F89d7648Cc5c312e63D10eAf142","5a6ba72f303f14aef83570587c966fcbee07c70b615e9304c127f6ace21c5e38","0x666474a318918123e27b9d6f1283528C88f97827");
            random_bit = generate_random_number(0, 1)
            if random_bit == 0:
                print(contract_caller.SetMode(generate_random_number(0, 3)))
            else :
                print(contract_caller.SetTargetTemperature(generate_random_number(0, 99999)))

    
    if test_id == 8:
        print("Done see data")
    
    if test_id == 9:
        while True:
            contract_caller = Starter("0x0a1c3554c82C65F33A49C1b3989c18c14Ed930c9","da051548548d448882110f5889ed7579475cbeb32ee53042a716aeb512359a50","0x35fA38D6e01F98B5e9f7672b0294177388BB381e")
            random_bit = generate_random_number(0, 2)
            if random_bit == 0:
                print(contract_caller.FinishGame())
            if random_bit == 1:
                print(contract_caller.Pong(generate_random_number(1, 20)))
            else:
                print(contract_caller.StartPingPong(generate_random_number(1, 20)))



    if test_id == 10:
        print("TBD")

    if test_id == 11:
        print("TBD")


if __name__ == "__main__":
    main()