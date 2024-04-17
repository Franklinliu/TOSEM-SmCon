from web3 import Web3

web3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))  

Starter_abi = [{"constant":True,"inputs":[],"name":"PingPongGameName","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"PingPongTimes","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"GamePlayer","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[],"name":"FinishGame","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"GameStarter","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"currentPingPongTimes","type":"int256"}],"name":"Pong","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[{"name":"pingPongTimes","type":"int256"}],"name":"StartPingPong","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"gameName","type":"string"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":False,"inputs":[{"indexed":False,"name":"_myString","type":"string"}],"name":"Log","type":"event"}]

import csv

csv_file = "9-PingPongGame1.csv"

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
     print(decode_transaction_data(i,Starter_abi))
