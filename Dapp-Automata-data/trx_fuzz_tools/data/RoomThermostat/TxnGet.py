from web3 import Web3
import csv

ganache_url = "http://127.0.0.1:8545"  
web3 = Web3(Web3.HTTPProvider(ganache_url))


latest_block_number = web3.eth.block_number

csv_file = "4-SimpleMarketplace5.csv"
with open(csv_file, mode="w", newline="") as file:
    writer = csv.writer(file)
    writer.writerow(["Block Number", "Tx Hash", "From", "To", "Value", "Data"])


for block_number in range(latest_block_number + 1):
    block = web3.eth.get_block(block_number)
    transactions = block["transactions"]

    for tx_hash in transactions:
        tx = web3.eth.get_transaction(tx_hash)

        if tx["to"] == "0xf7FAB9ecf9BF6F89d7648Cc5c312e63D10eAf142":
            Tx_Hash = (web3.to_hex(tx['hash']))

            with open(csv_file, mode="a", newline="") as file:
                writer = csv.writer(file)
                writer.writerow([block_number, Tx_Hash, tx["from"], tx["to"], tx["value"], tx['input']])

print(f"Transactions data saved to {csv_file}")