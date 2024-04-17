from web3 import Web3

web3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))  

contract_abi = [{"constant":False,"inputs":[],"name":"Complete","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[{"name":"newCounterparty","type":"address"}],"name":"TransferResponsibility","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"PreviousCounterparty","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"SupplyChainObserver","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"Counterparty","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"SupplyChainOwner","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"InitiatingCounterparty","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"supplyChainOwner","type":"address"},{"name":"supplyChainObserver","type":"address"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]
Bazzar_abi = [{"constant":False,"inputs":[{"name":"itemName","type":"string"},{"name":"itemPrice","type":"int256"}],"name":"ListItem","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"PartyABalance","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"party","type":"address"},{"name":"balance","type":"int256"}],"name":"ChangeBalance","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"ItemPrice","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"InstancePartyA","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"PartyBBalance","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"sellerParty","type":"address"},{"name":"buyerParty","type":"address"},{"name":"itemPrice","type":"int256"}],"name":"UpdateBalance","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"InstancePartyB","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"CurrentSeller","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"CurrentContractAddress","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ItemName","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"currentItemListing","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"InstanceBazaarMaintainer","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[{"name":"buyer","type":"address"},{"name":"itemPrice","type":"int256"}],"name":"HasBalance","outputs":[{"name":"","type":"bool"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"partyA","type":"address"},{"name":"balanceA","type":"int256"},{"name":"partyB","type":"address"},{"name":"balanceB","type":"int256"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]
ItemListing_abi = [{"constant":True,"inputs":[],"name":"Seller","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ItemPrice","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"PartyB","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"PartyA","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ItemName","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[],"name":"BuyItem","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"InstanceBuyer","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ParentContract","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"itemName","type":"string"},{"name":"itemPrice","type":"int256"},{"name":"seller","type":"address"},{"name":"parentContractAddress","type":"address"},{"name":"partyA","type":"address"},{"name":"partyB","type":"address"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]

import csv

csv_file = "10-BazaarItemListing1.csv"

data_column = []

with open(csv_file, mode="r") as file:
    reader = csv.DictReader(file)
    for row in reader:
        data_column.append(row["Data"])

def decode_transaction_data(tx_data, contract_abi):
    method_signature = tx_data[:10]
    
   # print(method_signature)

    for item in contract_abi:
        if item["type"] == "function":
                method_id = Web3.keccak(text=f"{item['name']}({','.join([param['type'] for param in item['inputs']])})").hex()[:10]

                if method_id == method_signature:
                    contract = web3.eth.contract(abi=contract_abi)
                    decoded_inputs = contract.decode_function_input(method_signature + tx_data[10:])
                    return {
                        "function_name": item["name"],
                        "inputs": decoded_inputs
                    }
    
    return None
for i in data_column:
     #print(decode_transaction_data(i,Bazzar_abi))
    print(decode_transaction_data("0xaf3465f6",ItemListing_abi))