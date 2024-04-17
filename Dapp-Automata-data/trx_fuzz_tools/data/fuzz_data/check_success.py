from web3 import Web3

w3 = Web3(Web3.HTTPProvider("http://127.0.0.1:8545" ))

import csv

csv_file1 = "all_txn.csv"

data_column = []

with open(csv_file1, mode="r") as file:
    reader = csv.DictReader(file)
    for row in reader:
        data_column.append(row["Tx Hash"])
    

for i in data_column:
    tx_receipt = w3.eth.get_transaction_receipt(i)

    if tx_receipt is not None:
        if tx_receipt['status'] == 1:
            pass
        else:
            print(i)
    else:
        print("交易尚未被确认或不存在")
