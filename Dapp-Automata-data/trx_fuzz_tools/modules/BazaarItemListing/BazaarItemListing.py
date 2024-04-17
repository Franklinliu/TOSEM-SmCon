from web3 import Web3

ItemListing_abi = [{"constant":True,"inputs":[],"name":"Seller","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ItemPrice","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"PartyB","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"PartyA","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ItemName","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[],"name":"BuyItem","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"InstanceBuyer","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ParentContract","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"itemName","type":"string"},{"name":"itemPrice","type":"int256"},{"name":"seller","type":"address"},{"name":"parentContractAddress","type":"address"},{"name":"partyA","type":"address"},{"name":"partyB","type":"address"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]

class ItemListing:
    def __init__(self, contract_address, private_key, msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=ItemListing_abi)
        self.private_key = private_key
        self.msg_address = msg_address


    def Seller(self):
        return self.contract.functions.Seller().call()


    def ItemPrice(self):
        return self.contract.functions.ItemPrice().call()


    def PartyB(self):
        return self.contract.functions.PartyB().call()


    def PartyA(self):
        return self.contract.functions.PartyA().call()


    def ItemName(self):
        return self.contract.functions.ItemName().call()


    def BuyItem(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.BuyItem().build_transaction({
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


    def State(self):
        return self.contract.functions.State().call()


    def ParentContract(self):
        return self.contract.functions.ParentContract().call()
    

Bazzar_abi = [{"constant":False,"inputs":[{"name":"itemName","type":"string"},{"name":"itemPrice","type":"int256"}],"name":"ListItem","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"PartyABalance","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"party","type":"address"},{"name":"balance","type":"int256"}],"name":"ChangeBalance","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"ItemPrice","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"InstancePartyA","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"PartyBBalance","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"sellerParty","type":"address"},{"name":"buyerParty","type":"address"},{"name":"itemPrice","type":"int256"}],"name":"UpdateBalance","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"InstancePartyB","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"CurrentSeller","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"CurrentContractAddress","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ItemName","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"currentItemListing","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"InstanceBazaarMaintainer","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[{"name":"buyer","type":"address"},{"name":"itemPrice","type":"int256"}],"name":"HasBalance","outputs":[{"name":"","type":"bool"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"partyA","type":"address"},{"name":"balanceA","type":"int256"},{"name":"partyB","type":"address"},{"name":"balanceB","type":"int256"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]

class Bazzar:
    def __init__(self, contract_address, private_key, msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=Bazzar_abi)
        self.private_key = private_key
        self.msg_address = msg_address


    def ListItem(self, itemName, itemPrice):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.ListItem(itemName, itemPrice).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def PartyABalance(self):
        return self.contract.functions.PartyABalance().call()


    def ChangeBalance(self, party, balance):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.ChangeBalance(party, balance).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def ItemPrice(self):
        return self.contract.functions.ItemPrice().call()


    def InstancePartyA(self):
        return self.contract.functions.InstancePartyA().call()


    def PartyBBalance(self):
        return self.contract.functions.PartyBBalance().call()


    def UpdateBalance(self, sellerParty, buyerParty, itemPrice):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.UpdateBalance(sellerParty, buyerParty, itemPrice).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def InstancePartyB(self):
        return self.contract.functions.InstancePartyB().call()


    def CurrentSeller(self):
        return self.contract.functions.CurrentSeller().call()


    def CurrentContractAddress(self):
        return self.contract.functions.CurrentContractAddress().call()
    
    def currentItemListing(self):
        return self.contract.functions.currentItemListing().call()

    def ItemName(self):
        return self.contract.functions.ItemName().call()


    def InstanceBazaarMaintainer(self):
        return self.contract.functions.InstanceBazaarMaintainer().call()


    def State(self):
        return self.contract.functions.State().call()


    def HasBalance(self):
        return self.contract.functions.HasBalance().call()
    
"""
Bazaar_address = "0xF4523D4Eb2FE0baF44f98945d56A516C0736710D"
msg_address = "0x64DFEAe370C5174B3595dBb1DC04651595b7Da37"
private_key = "f1bd1a524d22d07e3f2d5817cce40f6c311ee95682411666cee3075d747655a8"

Bazaar_contract = Bazzar(Bazaar_address,private_key,msg_address)
#ItemListing_contract = ItemListing(Bazaar_contract.CurrentContractAddress(),private_key,msg_address)

#print("Seller:", ItemListing_contract.Seller())
#print("ItemPrice:", ItemListing_contract.ItemPrice())
#print("PartyB:", ItemListing_contract.PartyB())
#print("PartyA:", ItemListing_contract.PartyA()) 
#print("ItemName:", ItemListing_contract.ItemName())
#print("InstanceBuyer:", ItemListing_contract.InstanceBuyer())
#print("State:", ItemListing_contract.State())
#print("ParentContract:", ItemListing_contract.ParentContract())

print("PartyABalance:", Bazaar_contract.PartyABalance())
print("ItemPrice:", Bazaar_contract.ItemPrice())
print("InstancePartyA:", Bazaar_contract.InstancePartyA())
print("PartyBBalance:", Bazaar_contract.PartyBBalance())
print("InstancePartyB:", Bazaar_contract.InstancePartyB())
print("CurrentSeller:", Bazaar_contract.CurrentSeller())
print("ItemName:", Bazaar_contract.ItemName())
print("CurrentContractAddress:", Bazaar_contract.CurrentContractAddress())
print("InstanceBazaarMaintainer:", Bazaar_contract.InstanceBazaarMaintainer())
#print("currentItemListing", Bazaar_contract.currentItemListing())
#print("HasBalance:", Bazaar_contract.HasBalance())
print("State:", Bazaar_contract.State())
"""