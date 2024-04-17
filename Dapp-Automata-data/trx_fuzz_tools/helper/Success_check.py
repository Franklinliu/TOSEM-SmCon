from web3 import Web3

w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))  

tx_hash = '0xc257de99a94e552f2d1b5344adf3cf11cf6fbadab604d8bfb4fc1768cb47603b'

tx_receipt = w3.eth.get_transaction_receipt(tx_hash)

print(tx_receipt)
if tx_receipt is None:
    print("fail")
else:
    if tx_receipt['status'] == 1:
        print("success")
    else:
        print("fail")

