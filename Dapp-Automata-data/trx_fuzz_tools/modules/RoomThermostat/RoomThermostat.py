from web3 import Web3

contract_abi = [{"constant":True,"inputs":[],"name":"User","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[],"name":"StartThermostat","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"Installer","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"targetTemperature","type":"int256"}],"name":"SetTargetTemperature","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":False,"inputs":[{"name":"mode","type":"uint8"}],"name":"SetMode","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"Mode","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"TargetTemperature","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"thermostatInstaller","type":"address"},{"name":"thermostatUser","type":"address"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]

class RoomThermostat:
    def __init__(self, contract_address, private_key, msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=contract_abi)
        self.private_key = private_key
        self.msg_address = msg_address


    def User(self):
        return self.contract.functions.User().call()


    def StartThermostat(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.StartThermostat().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def Installer(self):
        return self.contract.functions.Installer().call()


    def SetTargetTemperature(self, targetTemperature):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.SetTargetTemperature(targetTemperature).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def SetMode(self, mode):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.SetMode(mode).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def Mode(self):
        return self.contract.functions.Mode().call()


    def State(self):
        return self.contract.functions.State().call()


    def TargetTemperature(self):
        return self.contract.functions.TargetTemperature().call()

"""
contract_address = "0xf7FAB9ecf9BF6F89d7648Cc5c312e63D10eAf142"
msg_address = "0x666474a318918123e27b9d6f1283528C88f97827"
private_key = "5a6ba72f303f14aef83570587c966fcbee07c70b615e9304c127f6ace21c5e38"
contract_handler = RoomThermostat(contract_address,private_key,msg_address)

print("User:", contract_handler.User())
print("Installer:", contract_handler.Installer())
print("Mode:", contract_handler.Mode())
print("State:", contract_handler.State())
print("TargetTemperature:", contract_handler.TargetTemperature())
"""