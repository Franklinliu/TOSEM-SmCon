# solc --abi HelloBlockchain.sol -o output

from web3 import Web3

contract_abi = [
    {
        "constant": True,
        "inputs": [],
        "name": "ResponseMessage",
        "outputs": [
            {
                "name": "",
                "type": "string"
            }
        ],
        "payable": False,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": False,
        "inputs": [
            {
                "name": "responseMessage",
                "type": "string"
            }
        ],
        "name": "SendResponse",
        "outputs": [],
        "payable": False,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": False,
        "inputs": [
            {
                "name": "requestMessage",
                "type": "string"
            }
        ],
        "name": "SendRequest",
        "outputs": [],
        "payable": False,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": True,
        "inputs": [],
        "name": "Responder",
        "outputs": [
            {
                "name": "",
                "type": "address"
            }
        ],
        "payable": False,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": True,
        "inputs": [],
        "name": "RequestMessage",
        "outputs": [
            {
                "name": "",
                "type": "string"
            }
        ],
        "payable": False,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": True,
        "inputs": [],
        "name": "State",
        "outputs": [
            {
                "name": "",
                "type": "uint8"
            }
        ],
        "payable": False,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": True,
        "inputs": [],
        "name": "Requestor",
        "outputs": [
            {
                "name": "",
                "type": "address"
            }
        ],
        "payable": False,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [
            {
                "name": "message",
                "type": "string"
            }
        ],
        "payable": False,
        "stateMutability": "nonpayable",
        "type": "constructor"
    }
]

class HelloBlockchain:
    def __init__(self, contract_address,private_key,msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=contract_abi)
        self.private_key = private_key
        self.msg_address = msg_address

    def get_response_message(self):
        return self.contract.functions.ResponseMessage().call()

    def send_response(self, response_message):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.SendResponse(response_message).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()

    def send_request(self, request_message):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.SendRequest(request_message).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()

    def get_responder(self):
        return self.contract.functions.Responder().call()

    def get_request_message(self):
        return self.contract.functions.RequestMessage().call()

    def get_state(self):
        return self.contract.functions.State().call()

    def get_requestor(self):
        return self.contract.functions.Requestor().call()
    
"""
contract_address = "0x520EBbBe4B76a1F4f474389beB6D817cf09fe8B1"
msg_address = "0x64DFEAe370C5174B3595dBb1DC04651595b7Da37"
private_key = "f1bd1a524d22d07e3f2d5817cce40f6c311ee95682411666cee3075d747655a8"

contract_handler = HelloBlockchain(contract_address,private_key,msg_address)


response_message = contract_handler.get_response_message()
print("Response Message:", response_message)


response_message = contract_handler.get_response_message()
print("Response Message:", response_message)

request_transaction_hash = contract_handler.send_request("test")
print("SendRequest Transaction Hash:", request_transaction_hash)

responder_address = contract_handler.get_responder()
print("Responder Address:", responder_address)

request_message = contract_handler.get_request_message()
print("Request Message:", request_message)

state = contract_handler.get_state()
print("State:", state)

requestor_address = contract_handler.get_requestor()
print("Requestor Address:", requestor_address)
"""