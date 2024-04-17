from web3 import Web3

contract_abi = [{"constant":False,"inputs":[],"name":"Complete","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"ComplianceSensorType","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"MinTemperature","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"newCounterparty","type":"address"}],"name":"TransferResponsibility","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"PreviousCounterparty","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"MaxTemperature","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"SupplyChainObserver","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"Counterparty","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ComplianceDetail","outputs":[{"name":"","type":"string"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"SupplyChainOwner","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":False,"inputs":[{"name":"humidity","type":"int256"},{"name":"temperature","type":"int256"},{"name":"timestamp","type":"int256"}],"name":"IngestTelemetry","outputs":[],"payable":False,"stateMutability":"nonpayable","type":"function"},{"constant":True,"inputs":[],"name":"LastSensorUpdateTimestamp","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"Device","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"Owner","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"MinHumidity","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"MaxHumidity","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"InitiatingCounterparty","outputs":[{"name":"","type":"address"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ComplianceStatus","outputs":[{"name":"","type":"bool"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"ComplianceSensorReading","outputs":[{"name":"","type":"int256"}],"payable":False,"stateMutability":"view","type":"function"},{"constant":True,"inputs":[],"name":"State","outputs":[{"name":"","type":"uint8"}],"payable":False,"stateMutability":"view","type":"function"},{"inputs":[{"name":"device","type":"address"},{"name":"supplyChainOwner","type":"address"},{"name":"supplyChainObserver","type":"address"},{"name":"minHumidity","type":"int256"},{"name":"maxHumidity","type":"int256"},{"name":"minTemperature","type":"int256"},{"name":"maxTemperature","type":"int256"}],"payable":False,"stateMutability":"nonpayable","type":"constructor"}]

class RefrigeratedTransportation:
    def __init__(self, contract_address, private_key, msg_address):
        self.w3 = Web3(Web3.HTTPProvider(f'HTTP://127.0.0.1:8545'))
        self.contract = self.w3.eth.contract(address=contract_address, abi=contract_abi)
        self.private_key = private_key
        self.msg_address = msg_address


    def Complete(self, ):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.Complete().build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def ComplianceSensorType(self):
        return self.contract.functions.ComplianceSensorType().call()


    def MinTemperature(self):
        return self.contract.functions.MinTemperature().call()


    def TransferResponsibility(self, newCounterparty):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.TransferResponsibility(newCounterparty).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def PreviousCounterparty(self):
        return self.contract.functions.PreviousCounterparty().call()


    def MaxTemperature(self):
        return self.contract.functions.MaxTemperature().call()


    def SupplyChainObserver(self):
        return self.contract.functions.SupplyChainObserver().call()


    def Counterparty(self):
        return self.contract.functions.Counterparty().call()


    def ComplianceDetail(self):
        return self.contract.functions.ComplianceDetail().call()


    def SupplyChainOwner(self):
        return self.contract.functions.SupplyChainOwner().call()


    def IngestTelemetry(self, humidity, temperature, timestamp):
        nonce = self.w3.eth.get_transaction_count(self.msg_address)
        gas_price = self.w3.eth.gas_price
        gas_limit = 2000000  # 根据合约函数复杂性调整

        transaction = self.contract.functions.IngestTelemetry(humidity, temperature, timestamp).build_transaction({
            'chainId': 1,
            'gas': gas_limit,
            'gasPrice': gas_price,
            'nonce': nonce,
        })

        signed_txn = self.w3.eth.account.sign_transaction(transaction, private_key=self.private_key)
        tx_hash = self.w3.eth.send_raw_transaction(signed_txn.rawTransaction)
        return tx_hash.hex()


    def LastSensorUpdateTimestamp(self):
        return self.contract.functions.LastSensorUpdateTimestamp().call()


    def Device(self):
        return self.contract.functions.Device().call()


    def Owner(self):
        return self.contract.functions.Owner().call()


    def MinHumidity(self):
        return self.contract.functions.MinHumidity().call()


    def MaxHumidity(self):
        return self.contract.functions.MaxHumidity().call()


    def InitiatingCounterparty(self):
        return self.contract.functions.InitiatingCounterparty().call()


    def ComplianceStatus(self):
        return self.contract.functions.ComplianceStatus().call()


    def ComplianceSensorReading(self):
        return self.contract.functions.ComplianceSensorReading().call()


    def State(self):
        return self.contract.functions.State().call()

"""
contract_address = "0x615d0B22448F43DD9698A1B2767b6449dD0C5322"
msg_address = "0x64DFEAe370C5174B3595dBb1DC04651595b7Da37"
private_key = "f1bd1a524d22d07e3f2d5817cce40f6c311ee95682411666cee3075d747655a8"

contract_handle = RefrigeratedTransportation(contract_address,private_key,msg_address)

print("ComplianceSensorType:", contract_handle.ComplianceSensorType())
print("MinTemperature:", contract_handle.MinTemperature())
print("PreviousCounterparty:", contract_handle.PreviousCounterparty())
print("MaxTemperature:", contract_handle.MaxTemperature())
print("SupplyChainObserver:", contract_handle.SupplyChainObserver())
print("Counterparty:", contract_handle.Counterparty())
print("ComplianceDetail:", contract_handle.ComplianceDetail())
print("SupplyChainOwner:", contract_handle.SupplyChainOwner())
print("LastSensorUpdateTimestamp:", contract_handle.LastSensorUpdateTimestamp())
print("Device:", contract_handle.Device())
print("Owner:", contract_handle.Owner())
print("MinHumidity:", contract_handle.MinHumidity())
print("MaxHumidity:", contract_handle.MaxHumidity())
print("InitiatingCounterparty:", contract_handle.InitiatingCounterparty())
print("ComplianceStatus:", contract_handle.ComplianceStatus())
print("ComplianceSensorReading:", contract_handle.ComplianceSensorReading())
print("State:", contract_handle.State())
"""