from web3 import Web3

Starter_abi = [{"constant":True,"inputs":[],"name":"PingPongGameName","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"PingPongTimes","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"GamePlayer","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[],"name":"FinishGame","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"GameStarter","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"currentPingPongTimes","type":"int256"}],"name":"Pong","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[{"name":"pingPongTimes","type":"int256"}],"name":"StartPingPong","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"gameName","type":"string"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":False,"inputs":[{"indexed":False,"name":"_myString","type":"string"}],"name":"Log","type":"event"}]

class Starter:
    def __init__(self, contract_address, private_key, msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=Starter_abi)
        self.private_key = private_key
        self.msg_address = msg_address


    def PingPongGameName(self):
        return self.contract.functions.PingPongGameName().call()


    def PingPongTimes(self):
        return self.contract.functions.PingPongTimes().call()


    def GamePlayer(self):
        return self.contract.functions.GamePlayer().call()


    def FinishGame(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.FinishGame().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def GameStarter(self):
        return self.contract.functions.GameStarter().call()


    def Pong(self, currentPingPongTimes):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.Pong(currentPingPongTimes).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def StartPingPong(self, pingPongTimes):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.StartPingPong(pingPongTimes).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def State(self):
        return self.contract.functions.State().call()
    

Player_abi = [{"constant":True,"inputs":[],"name":"PingPongGameName","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"currentPingPongTimes","type":"int256"}],"name":"Ping","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[],"name":"FinishGame","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"GameStarter","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"pingPongGameName","type":"string"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"},{"anonymous":False,"inputs":[{"indexed":False,"name":"_myString","type":"string"}],"name":"Log","type":"event"}]

class Player:
    def __init__(self, contract_address, private_key, msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=Player_abi)
        self.private_key = private_key
        self.msg_address = msg_address


    def PingPongGameName(self):
        return self.contract.functions.PingPongGameName().call()


    def Ping(self, currentPingPongTimes):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.Ping(currentPingPongTimes).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def FinishGame(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.FinishGame().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def GameStarter(self):
        return self.contract.functions.GameStarter().call()


    def State(self):
        return self.contract.functions.State().call()

"""
Starter_address = "0x1430e7FB1379be9F6Aa5Ce5200bbB4c0e36f6fdC"
msg_address = "0x64DFEAe370C5174B3595dBb1DC04651595b7Da37"
private_key = "f1bd1a524d22d07e3f2d5817cce40f6c311ee95682411666cee3075d747655a8"

starter_contract = Starter(Starter_address,private_key,msg_address)
player_contract = Player(starter_contract.GamePlayer(),private_key,msg_address)

print("PingPongGameName:", starter_contract.PingPongGameName())
print("PingPongTimes:", starter_contract.PingPongTimes())
print("GamePlayer:", starter_contract.GamePlayer())
print("GameStarter:", starter_contract.GameStarter())
print("State:", starter_contract.State())

print("PingPongGameName:", player_contract.PingPongGameName())
print("GameStarter:", player_contract.GameStarter())
print("State:", player_contract.State())
"""