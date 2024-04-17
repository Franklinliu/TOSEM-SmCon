from web3 import Web3

web3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))  

contract_abi = [{"constant":True,"inputs":[],"name":"InstanceOwner","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"OfferPrice","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"Description","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"offerPrice","type":"int256"}],"name":"MakeOffer","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"InstanceBuyer","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[],"name":"Reject","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[],"name":"AcceptOffer","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"AskingPrice","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"description","type":"string"},{"name":"price","type":"int256"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]

import csv

csv_file = "4-SimpleMarketplace5.csv"

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
     print(decode_transaction_data(i,contract_abi))
