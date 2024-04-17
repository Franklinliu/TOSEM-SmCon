from web3 import Web3

contract_abi = [{"constant":True,"inputs":[],"name":"InstanceOwner","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"OfferPrice","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"Description","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"offerPrice","type":"int256"}],"name":"MakeOffer","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"InstanceBuyer","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[],"name":"Reject","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[],"name":"AcceptOffer","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"AskingPrice","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"description","type":"string"},{"name":"price","type":"int256"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]

class SimpleMarketplace:
    def __init__(self, contract_address, private_key, msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=contract_abi)
        self.private_key = private_key
        self.msg_address = msg_address


    def InstanceOwner(self):
        return self.contract.functions.InstanceOwner().call()


    def OfferPrice(self):
        return self.contract.functions.OfferPrice().call()


    def Description(self):
        return self.contract.functions.Description().call()


    def MakeOffer(self, offerPrice):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.MakeOffer(offerPrice).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def InstanceBuyer(self):
        return self.contract.functions.InstanceBuyer().call()


    def Reject(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.Reject().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def AcceptOffer(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.AcceptOffer().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def AskingPrice(self):
        return self.contract.functions.AskingPrice().call()


    def State(self):
        return self.contract.functions.State().call()

"""
msg_address = "0x35fA38D6e01F98B5e9f7672b0294177388BB381e"
private_key = "da051548548d448882110f5889ed7579475cbeb32ee53042a716aeb512359a50"
contract_address = "0x299C996303a90c826B777175E6480a722e54Bdd8"
contract_handler = SimpleMarketplace(contract_address,private_key,msg_address)

print("InstanceOwner:", contract_handler.InstanceOwner())
print("OfferPrice:", contract_handler.OfferPrice())
print("Description:", contract_handler.Description())
print("InstanceBuyer:", contract_handler.InstanceBuyer())
print("AskingPrice:", contract_handler.AskingPrice())
print("State:", contract_handler.State())
"""