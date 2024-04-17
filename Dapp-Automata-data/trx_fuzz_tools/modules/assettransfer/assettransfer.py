# solc --abi HelloBlockchain.sol -o output
from web3 import Web3
contract_abi = [{"constant":True,"inputs":[],"name":"InstanceInspector","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"InstanceOwner","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"offerPrice","type":"uint256"}],"name":"ModifyOffer","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"OfferPrice","outputs":[{"name":"","type":"uint256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[],"name":"MarkAppraised","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[],"name":"MarkInspected","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[],"name":"Accept","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"InstanceAppraiser","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"Description","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[],"name":"Terminate","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[],"name":"RescindOffer","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"InstanceBuyer","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"description","type":"string"},{"name":"price","type":"uint256"}],"name":"Modify","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[],"name":"Reject","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[],"name":"AcceptOffer","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[{"name":"inspector","type":"address"},{"name":"appraiser","type":"address"},{"name":"offerPrice","type":"uint256"}],"name":"MakeOffer","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"AskingPrice","outputs":[{"name":"","type":"uint256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"description","type":"string"},{"name":"price","type":"uint256"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]

class AssetTransfer:
    def __init__(self, contract_address,private_key,msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=contract_abi)
        self.private_key = private_key
        self.msg_address = msg_address

    def get_state(self):
        return self.contract.functions.State().call()
    
    def get_InstanceOwner(self):
        return self.contract.functions.InstanceOwner().call()
    
    def get_Description(self):
        return self.contract.functions.Description().call()
    
    def get_AskingPrice(self):
        return self.contract.functions.AskingPrice().call()
    
    def get_InstanceBuyer(self):
        return self.contract.functions.InstanceBuyer().call()
    
    def get_OfferPrice(self):
        return self.contract.functions.OfferPrice().call()
    
    def get_InstanceInspector(self):
        return self.contract.functions.InstanceInspector().call()
    
    def get_InstanceAppraiser(self):
        return self.contract.functions.InstanceAppraiser().call()
    
    def Terminate(self):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.Terminate().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()
    
    def Modify(self,description,price):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.Modify(description,price).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()
    
    def MakeOffer(self,inspector,appraiser,offerPrice):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.MakeOffer(inspector,appraiser,offerPrice).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()
    
    def AcceptOffer(self):
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
        
    def Reject(self):
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

    def Accept(self):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.Accept().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()

    def ModifyOffer(self,offerPrice):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.ModifyOffer(offerPrice).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()
    
    def RescindOffer(self):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.RescindOffer().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()

    def MarkAppraised(self):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.MarkAppraised().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()
    
    def MarkInspected(self):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.MarkInspected().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()

#contract_address = "0xb55AB342754a11f5be02bd1084d0a724808D0745"
#private_key = "b899cf57925d680b72d4b8a8d4ce545f3dc70d2914254e59b6055ddbd6e858dc"
#msg_address = "0x03Db6D217C76E42138A1d8125c9e06eD591e08b2"
#contract_handler = AssetTransfer(contract_address,private_key,msg_address)

#print(contract_handler.get_InstanceAppraiser())